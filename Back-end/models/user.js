const { DataTypes } = require('sequelize');//Pour définir le type de field
const sequelize = require('../config/database'); // Chemin relatif au fichier database.js

const User = sequelize.define('User', {
    Email: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true, // Spécifiez que cette colonne est la clé primaire
        unique: true
    },
    Password: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    schema: 'PFE',
    tableName: 'USERS',
    timestamps: false
});

module.exports = User;
