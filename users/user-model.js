const db = require('../data/dbConfig.js');
module.exports = {
get,
getById,
getUserPosts,
insert,
update,
remove,
};

function get() {
return db('users');
}

function getById(id) {
return db('users')
.where({ id })
.first();
}

function getUserPosts(id) {

//     select p.id
// , p.contents as Quote
// , u.username as Author 
// from posts as p
// join users as u
// on p.user_Id = u.id
// where user_id = 1;
    return db('posts as p')
    .select("p.id", "p.contents as Quote", "u.username as Author " )
    .join("users as u", "p.user_id", "=", "u.id")
    .where("user_id", userId)
}

function insert(post) {
return db('users')
.insert(post)
.then(ids => {
return getById(ids[0]);
});
}

function update(id, changes) {
return db('users')
.where({ id })
.update(changes);
}

function remove(id) {
return db('users')
.where('id', id)
.del();
}