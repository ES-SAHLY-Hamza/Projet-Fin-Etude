// La connexion avec la base de donnée PostgreSQL en utilisant L'ORM 

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('ProjectPFE', 'postgres', 'Hamza1234567', {
    host: 'localhost',
    dialect: 'postgres',
    port: 5432,
});


sequelize.authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
    })
    .catch(err => {
        console.error('Unable to connect to the database:', err);
    });

module.exports = sequelize;
