const router = express.Router();
const Sequelize = require('sequelize');

var rolesModel = require('../models/roles');
var authentication = require("./authentication");

var requester, apiKey, errorMessage;

/**
 * <p>This API is used to retrieve all the roles.</p>
 * @author Vivek Dwivedi
 */
router.post('/',(req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            rolesModel.findAll().then(roles => {
                res.json(roles);
            }).catch(err => {
                res.json("Could not retrieve roles: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This API is used to insert a new user role.</p>
 * <p>Only Admin users are allowed access to this.</p>
 * @author Vive DWivedi
 */
router.post('/insert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    
    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            rolesModel.create({
                roleID: req.body.roleID,
                roleName: req.body.roleName
            }).then(role => {
                res.json(role);
            }).catch(err => {
                res.json("Could not insert role into roles: " + err);
            })
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;