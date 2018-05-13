const Sequelize = require('sequelize');
const db = require('../db/dbConnection');
const teams = require('./teams');
const statuses = require('./bidStatuses');
const decisions = require('./matchDecisions');

const roster = db.define('roster', {
    matchID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        defaultValue: 1,
        validate: {
            isNumeric: true
        }
    },
    team1: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
            model: teams,
            key: 'team1_ID'
        }
    },
    team2: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
            model: teams,
            key: 'team2_ID'
        }
    },
    matchDate: {
        type: Sequelize.DATEONLY,
        allowNull: false
    },
    matchTime: {
        type: Sequelize.TIME,
        allowNull: false
    },
    matchDecision: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: decisions,
            key: 'decisionID'
        }
    },
    bidStatus: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: statuses,
            key: 'statusID'
        }
    },
    matchPool: {
        type: Sequelize.INTEGER,
        allowNull: true,
        defaultValue: 0
    }
}, {
        getterMethods: {
            shouldSurveyBeClosedNow() {
                db.query('select TIME_TO_SEC(TIMEDIFF(matchTime, TIME(NOW()))) from roster').then(timeDiff => {
                    if (timeDiff <= 0) {
                        return true;
                    } else {
                        return false;
                    }
                });
            },
            getMatchDecision() {
                switch (this.matchDecision) {
                    case "1":
                        return teams.findById(this.getTeam1());
                    case "2":
                        return teams.findById(this.getTeam2());
                    default:
                        return this.matchDecision;
                }
            }
        }
    });

module.exports = roster;