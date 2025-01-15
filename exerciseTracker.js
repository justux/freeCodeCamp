const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const mongoose = require("mongoose");
const { Schema } = mongoose;

mongoose.connect(process.env.MONGO_URI);

const UserSchema = new Schema({
  username: String
})
const User = mongoose.model("User", UserSchema);

/* {
  username: "fcc_test",
  description: "test",
  duration: 60,
  date: "Mon Jan 01 1990",
  _id: "5fb5853f734231456ccb3b05"
} */

const ExerciseSchema = new Schema({
  user_id: String,
  description: String,
  duration: Number,
  date: Date,
})
const Exercise = mongoose.model("Exercise", ExerciseSchema);


const { MongoClient } = require('mongodb');

const client = new MongoClient(process.env.MONGO_URI);
const db = client.db("exercises");
const users = db.collection("users");

app.use(cors())
app.use(express.static('public'))
app.use(express.json());
app.use(express.urlencoded({extended : true}));


app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});

app.post('/api/users', async (req, res) => {
  const usernameReq = req.body.username;
  const userObj = new User({
    username: usernameReq
  })
  const result = await userObj.save();
  res.json(result);

})

app.get('/api/users', async (req, res) => {
  const result = await User.find({});
  res.json(result);
})
// /api/users/6785007701c45feb02f18883/exercises

app.post('/api/users/:_id/exercises', async (req, res) => {
  const user = await User.findOne({_id:req.params._id})
  if (!user){
    res.send("User not found");
  } else {
    const exObj = new Exercise({
      user_id: req.params._id,
      description: req.body.description,
      duration: req.body.duration,
      date: req.body.date ? new Date(req.body.date) : new Date(),
  
    })
    const result =  await exObj.save();
    res.json({
      _id: user._id,
      username: user.username,
      description: req.body.description,
      duration: Number(req.body.duration),
      date: new Date(req.body.date).toDateString(),
    });
  }

})

//   /api/users/6787c84eb0146fcb3f468dbd/logs

app.get('/api/users/:_id/logs', async (req, res) => {
  const user = await User.findOne({_id:req.params._id})
  const { from , to, limit} = req.query;

  if (!user){
    res.send("User not found");
  } else {
    let listExercises = [];
    let dateObj = {};
    if(from){
      dateObj["$gte"] = new Date(from);
    }
    if(to){
      dateObj["$lte"] = new Date(to);
    }
    let filter = {user_id:req.params._id}

    if(from || to){
      filter.date = dateObj;
    }
    const exercises = await Exercise.find(filter).limit(+limit ?? 500);

    exercises.forEach((exe) => {
      let dateExec = new Date(exe.date);
      
      let e = {
        description: exe.description,
        duration: exe.duration,
        date: dateExec.toDateString()
      }
      listExercises.push(e);
    })

    res.json({
      username : user.username,
      count: listExercises.length,
      _id: user._id,
      log : listExercises
    })
  }
})

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
