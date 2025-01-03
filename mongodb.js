require('dotenv').config();

let mongoose = require('mongoose');
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

const personSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  age: Number,
  favoriteFoods:[String]
});


let Person = mongoose.model('Person', personSchema);

const createAndSavePerson = (done) => {
  let p = new Person({ name: "Alberto", age: 40, favoriteFoods : ["gelato", "patatine"]});
  p.save(function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};
let arrayOfPeople = [
  { name: "Alberto", age: 40, favoriteFoods : ["gelato", "patatine"]},
  { name: "Chiara", age: 38, favoriteFoods : ["burrito"]}
]
const createManyPeople = (arrayOfPeople, done) => {
  Person.create(arrayOfPeople,function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};

let personName = "Alberto";

const findPeopleByName = (personName, done) => {
  Person.find({name: personName}, function(err, data){
    if (err) return console.error(err);
    done(null, data)
  });
};

let food = 'gelato';

const findOneByFood = (food, done) => {
  Person.findOne({ favoriteFoods: [food]}, function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};
let personId = '123';
const findPersonById = (personId, done) => {
  Person.findById(personId, function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};

const findEditThenSave = (personId, done) => {
  const foodToAdd = "hamburger";
  Person.findById(personId, function(err, data){
    if (err) return console.error(err);

    data.favoriteFoods.push(foodToAdd);
    data.save(function(err, data){
      if (err) return console.error(err);
      done(null, data)
    })
   
  })
};

const findAndUpdate = (personName, done) => {
  const ageToSet = 20;
  Person.findOneAndUpdate({ name: personName}, {age:ageToSet}, {new : true},function(err, data){
    if (err) return console.error(err);
    done(null, data)
  });
};

const removeById = (personId, done) => {

  Person.findByIdAndDelete(personId, function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};

const removeManyPeople = (done) => {
  const nameToRemove = "Mary";

  Person.deleteMany({name : nameToRemove}, function(err, data){
    if (err) return console.error(err);
    done(null, data)
  })
};



const queryChain = (done) => {
  const foodToSearch = "burrito";
    Person.find({favoriteFoods : foodToSearch})
             .sort({name:1})
             .limit(2)
             .select({age:0})
             .exec(function(err,data){
      if(err) return console.log(err)
      done(null, data)
    });
  };

/** **Well Done !!**
/* You completed these challenges, let's go celebrate !
 */

//----- **DO NOT EDIT BELOW THIS LINE** ----------------------------------

exports.PersonModel = Person;
exports.createAndSavePerson = createAndSavePerson;
exports.findPeopleByName = findPeopleByName;
exports.findOneByFood = findOneByFood;
exports.findPersonById = findPersonById;
exports.findEditThenSave = findEditThenSave;
exports.findAndUpdate = findAndUpdate;
exports.createManyPeople = createManyPeople;
exports.removeById = removeById;
exports.removeManyPeople = removeManyPeople;
exports.queryChain = queryChain;
