const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    add,
    update,
    remove,
    findSteps,
    addStep
}

function find(){
    return db('schemes')
}

function findById(id){
    return db('schemes')
    .where({id})
    .first()
}

function add(scheme){
    return db('schemes')
    .insert(scheme);
}

function update(changes, id){
    return db('schemes')
    .where({id: id})
    .update(changes);
}

function remove(id){
    return db('schemes')
    .where({id})
    .del()
}

function findSteps(id){
    return db('steps as st')
    .join('schemes as sch', 'st.scheme_id', "=", "sch.id")
    .where({scheme_id : id})
    .select('st.id','st.step_number','st.instructions','sch.scheme_name')
}

function addStep(step, id){
    return db('steps')
    .insert({
        step_number : step.step_number ,
        scheme_id : id ,
        instructions: step.instructions
    })
}