const {User} = require('pg');

const user = new postgreSQL({
    
    host : "localhost",
    user : "postgres",
    port : 5432,
    password : "Hamza1234567",
    database : "ProjectPFE"
})

user.connect();

user.query(`SELECT * FROM USERS`, (err,res)=>{
    if(!err){
        console.log(res.rows);
    }
    else{
        console.log(err.message);
    }
    user.end;
})
/* sequelize.query(`SELECT * FROM "PFE"."USERS"`, { type: sequelize.QueryTypes.SELECT })
    .then(users => {
        console.log(users);
    })
    .catch(err => {
        console.error('Error executing query:', err);
    })
    .finally(() => {
        sequelize.close();
    });
 */