const express = require("express");

const {giveRating} = require('../controller/rateUsController')

const router = express.Router();

router.post("/give/rating", giveRating);

module.exports = router;
