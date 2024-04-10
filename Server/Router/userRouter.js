const express = require("express");
const {  signup, sendOtp, login, updateProfile } = require("../controller/userController");
const { auth } = require("../middleware/auth");
const router = express.Router();

router.post("/sendotp", sendOtp);
router.post("/signup", signup);
router.post("/login", login);
router.patch("/updateProfile", auth,  updateProfile);


module.exports = router;
