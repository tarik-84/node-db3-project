const db = require('../data/dbConfig')


module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove,
  };

function find() {
  return db('schemes')
}

function findById(id) {
  return db('schemes')
         .where({id})
         .first();
}

function findSteps(schemeId) {
  return db('steps as s')
      .join('schemes as sc', 'sc.id', 's.scheme_id')
      .where('s.scheme_id' , schemeId)
      .select('s.id', 's.step_number', 's.instructions', 'sc.scheme_name');
}


function add(scheme) {
  return db('schemes')
  .insert(scheme)
  .then(ids => {
    return findById(ids[0]);
 });
}


function addStep(step){
  return db('steps')
  .insert(step)
  .then(ids => {
    return findById(ids[0]);
 });
}


function update(id, changes) {
    return db('schemes')
    .where('id', id)
    .update(changes)
    .then(() => {
      return findById(id)
    });
}


function remove(id) {
    return db('schemes')
    .where('id', id)
    .del(); 
}