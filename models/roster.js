const Sequelize = require('sequelize');
const db = require('../db/dbConnection');
const teams = require('./teams');

const roster = db.define('roster', {
    matchID: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    team1: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
            model: teams,
            key: 'teamID',
        }
    },
    team2: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
            model: teams,
            key: teamID
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
        type: Sequelize.ENUM("1", "2", "Tie", "Abandon"),
        allowNull: false
    }
}, {
        getterMethods: {
            getMatchID() {
                return this.matchID;
            },
            getTeam1() {
                return this.team1;
            },
            getTeam2() {
                return this.team2;
            },
            getMatchDate() {
                return this.matchDate;
            },
            getMatchTime() {
                return this.matchTime;
            },
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
                        return teams.findById(this.getTeam1()).getTeamName();
                    case "2":
                        return teams.findById(this.getTeam2()).getTeamName();
                    default:
                        return this.matchDecision;
                }
            }
        }
    });

module.exports = roster;