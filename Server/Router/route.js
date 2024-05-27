const express = require("express");
const router = express.Router();

const { auth } = require("../middleware/auth");
const { searchBooks } = require("../controller/booksController");
const { getSubjectsByClass } = require("../controller/subjectController");
const {
  getWatchHistory,
  addWatchHistory,
} = require("../controller/videoController");

router.get("/books", searchBooks);
router.get("/usersubject", auth, getSubjectsByClass);

//history schema
router.get("/getUserHistory", getWatchHistory);
router.post("/history", addWatchHistory);

module.exports = router;
