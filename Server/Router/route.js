const express = require("express");
const router = express.Router();

const { auth } = require("../middleware/auth");
const { searchBooks } = require("../controller/booksController");
const { getSubjectsByClass } = require("../controller/subjectController");

router.get("/books", searchBooks);
router.get("/usersubject", auth, getSubjectsByClass);

module.exports = router;
