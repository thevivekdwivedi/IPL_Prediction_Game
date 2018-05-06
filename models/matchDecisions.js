const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

const bidStatuses = db.define('bidStatuses', {
    decisionID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
        validate: {
            isNumeric: true
        },
        decisionName: {
            type: Sequelize.STRING,
            unique: true,
            allowNull: false,
            validate: {
                isAlphanumeric: true
            }
        }
    }
});

module.exports = bidStatuses;