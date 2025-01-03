require('dotenv').config();
const express = require('express');
const cors = require('cors');
const dns = require('dns');
const urlparser = require('url');
const { param } = require('express/lib/request');
const app = express();

// Basic Configuration
const port = process.env.PORT || 3000;

let mongoose = require('mongoose');
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });
const urlsSchema = new mongoose.Schema({
  original_url: String,
  short_url: Number
});
let Urlsc = mongoose.model('Urlsc', urlsSchema);


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended : true}));

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

app.post('/api/shorturl', (req, res) => {
  let url = req.body.url;
  const dnslookup = dns.lookup(urlparser.parse(url).hostname, async (err, address) => {
    if(!address){
      res.json({error : "Invalid URL"});
    } else {
      let uu = new Urlsc({ original_url: req.body.url, short_url: 100});
      uu.save().then((data)=>{
          res.json(data);
      }).catch((err)=>{
          console.log(err);
      })
    }
  })
});

app.get('/api/shorturl/:su', function(req, res) {
  Urlsc.find({ short_url : req.params.su }).then((data)=>{
      res.json(data);
  }).catch((err)=>{
      console.log(err);
  })
});

app.get("/articles", async (req, res) => {
  try {
    const articles = await Article.find({ });
    res.send(articles);
    console.log(articles);
  } catch (err) {
    console.log(err);
  }
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
