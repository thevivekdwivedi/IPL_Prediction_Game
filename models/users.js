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
        allowNull: true,
        validate: {
            isAlpha: true
        }
    },
    role: {
        type: Sequelize.ENUM("Admin", "Player"),
        allowNull: false
    },
    apiKey: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isAlphanumeric: true
        }
    },
    emailID: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isEmail: true
        }
    }
});

module.exports = users;