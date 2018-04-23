const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const crypt = require('crypto-js');

const apiKeySecret = process.env.APIKEY_SECRET;

var userCredsModel = require('../models/userCreds');


module.exports = {

    _cleanTheAPIKey(apiKey) {
        // decrypt the apikey with the api key secret
        // console.log("API Key: " + apiKey.toString());
        // console.log("API Key Secret: " + apiKeySecret);
        
        // var decryptedBytes = crypt.AES.decrypt(apiKey.toString(), apiKeySecret.toString());
        // console.log("Decrypted:"+decryptedBytes);
        
        // apiKey = decryptedBytes.toString(crypt.enc.Utf8);
        // // re-encrypt the decrypted api key. If this matches the one in the table, then we go through, else we don't allow access.
        // apiKey = crypt.AES.encrypt(apiKey, apiKeySecret);

        return apiKey;
    },

    /**
     * <p>This method specifies whether the the requesting user is authorized.<br>It checks the user's apiKey. When the apiKey matches<br>the user is given access to the api</p>
     * @author Vivek Diwvedi
     * @param {*} requester <p>The userID of the user requesting data</p>
     * @param {*} apiKey <p>The apiKey of the user requesting data</p>
     */
    isRequesterAuthorized(requester, apiKey) {
        apiKey = this._cleanTheAPIKey(apiKey);

        return new Promise((resolve, reject) => {
            userCredsModel.findById(requester).then(requestingUser => {
                if (requestingUser.apiKey == apiKey) {
                    console.log("User is authenticated.");
                    resolve(JSON.parse(true));
                } else {
                    console.error("User is not authenticated");
                    resolve(JSON.parse(false));
                }
            }).catch(err => {
                console.error("Could not authenticate.");
                reject(JSON.parse(err));
            });
        });
    },

    /**
     * <p>This method specifies whether the requesting user is an admin or not</p>
     * @author Vivek Diwvedi
     * @param {*} requester <p>The userID of the user requesting date</p>
     */
    isReuqesterAnAdmin(requester) {
        apiKey = this._cleanTheAPIKey(apiKey);

        return new Promise((resolve, reject) => {
            userCredsModel.findById(requester).then(requestingUser => {
                if (requestingUser.role == "Admin") {
                    console.log("User is admin and authenticated.");
                    resolve(JSON.parse(true));
                } else {
                    console.error("User is authenticated but not an admin.");
                    resolve(JSON.parse(false));
                }
            }).catch(err => {
                console.error("Could not confirm if user is admin or not");
                reject(JSON.parse(err));
            });
        });
    },

    /**
     * <p>This method specifies whether the requesting user is an authorized admin user or not.<br>It checks the user's role and apiKey for this.</p>
     * @author Vivek Diwvedi
     * @param {*} requester <p>The userID of the user requesting data</p>
     * @param {*} apiKey <p>The apiKey of the user requesting data</p>
     */
    isRequesterAuthorizedAndAdmin(requester, apiKey) {
        apiKey = this._cleanTheAPIKey(apiKey);

        this.isRequesterAuthorized(requester, apiKey).then(isAuthorized => {
            if (isAuthorized) {
                this.isReuqesterAnAdmin(requester).then(isAdmin => {
                    if (isAdmin) {
                        resolve(JSON.parse(true));
                    } else {
                        resolve(JSON.parse(false));
                    }
                }).catch(err => {
                    reject(err);
                });
            } else {
                resolve(JSON.parse(false));
            }
        }).catch(err => {
            reject(JSON.parse(err));
        });
    }
};