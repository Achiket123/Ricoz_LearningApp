const express = require("express");
const {
  signup,
  sendOtp,
  login,
  updateProfile,
} = require("../controller/userController");
const { auth } = require("../middleware/auth");
const { searchBooks } = require("../controller/booksController");
const router = express.Router();

router.post("/sendotp", sendOtp);
router.post("/signup", signup);
router.post("/login", login);
router.patch("/updateProfile", auth, updateProfile);
router.get("/books", auth, searchBooks);

module.exports = router;
