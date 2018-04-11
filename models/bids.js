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
        type: Sequelize.STRING,
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
    }
}, {
    getterMethods: {
        getMatchDetails() {
            users.findById(matchID).then(mathcDetails => {
                return matchDetails.team1 + " v " + matchDetails.team2 + ", Date " + matchDetails.matchDate + ", Time " + matchDetails.matchTime + ", Decision " + matchDetails.matchDecision + ", Bid Status " + matchDetails.bidStatus
            });
        }
    }
});

module.exports = bids;