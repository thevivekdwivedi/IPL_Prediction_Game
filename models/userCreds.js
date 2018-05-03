const Sequelize = require('sequelize');
const db = require('../db/dbConnection');
const users = require('./users');

const userCreds = db.define('userCreds', {
    userID: {
        type: Sequelize.STRING,
        primaryKey: true,
        validate: {
            isAlphanumeric: true
        },
        references: {
            model: users,
            key: 'user_login_id'
        }
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false,
        defaultValue: "12345678"
    },
    apiKey: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isAlphanumeric: true
        }
    }
});

module.exports = userCreds;