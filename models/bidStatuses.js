const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

const bidStatuses = db.define('bidStatuses', {
    statusID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        validate: {
            isNumeric: true
        }
    },
    statusName: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            isAlphanumeric: true
        }
    }
});

module.exports = bidStatuses;