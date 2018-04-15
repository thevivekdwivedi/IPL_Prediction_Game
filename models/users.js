const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

const users = db.define('users', {
    userID: {
        type: Sequelize.STRING,
        primaryKey: true,
        validate: {
            isAlphanumeric: true
        }
    },
    firstName: {
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
            isAlpha: true
        }
    },
    lastName: {
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
            isAlpha: true
        }
    },
    role: {
        type: Sequelize.ENUM("Admin", "Player"),
        allowNull: false
    }
});

module.exports = users;