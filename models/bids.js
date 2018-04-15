const Sequelize = require('sequelize');
const db = require('../db/dbConnection');
const users = require('./users');
const roster = require('./roster');
const temas = require('./teams');

const bids = db.define('bids', {
    bidID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        validate: {
            isNumeric: true
        },
        defaultValue: 1
    },
    matchID: {
        type: Sequelize.INTEGER,
        validate: {
            isNumeric: true
        },
        references: {
            model: roster,
            key: 'bid_matchID'
        }
    },
    userID: {
        type: Sequelize.TEXT,
        validate: {
            isAlphanumeric: true
        },
        references: {
            model: users,
            key: 'bid_userID'
        }
    },
    predictedResult: {
        type: Sequelize.ENUM("1", "2", "Tie", "Abandon"),
        allowNull: false
    },
    bidAmount: {
        type: Sequelize.NUMBER,
        allowNull: false,
        validate: {
            isNumeric: true,
            max: 50,
            min: 5
        }
    },
    revisedBid: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: false
    },
    timestamp: {
        type: Sequelize.TIME,
        allowNull: false,
        defaultValue: Sequelize.NOW
    }
});

module.exports = bids;