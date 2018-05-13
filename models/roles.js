const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

const roles = db.define('roles', {
    roleID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        validate: {
            isNumeric: true
        }
    },
    roleName: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            isAlphanumeric: true
        }
    }
});

module.exports = roles;