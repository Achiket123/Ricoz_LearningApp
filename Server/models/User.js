const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  PhoneNumber: {
    type: String,
    required: true,
    Unique: true,
    // maxLength: 10,
  },
  name: {
    type: String,
    trim: true,
  },
  email: {
    type: String,
    trim: true,
  },
  DOB: {
    type: String,
  },
  courseType: {
    type: String,
    enum: ["CBSE", "ICSE", "STATEBOARD"],
  },
  Mode: {
    type: String,
    enum: ["ONLINE", "OFFLINE"],
    // required: true,
  },
  selectClass: {
    type: String,
  },
  location: {
    type: String,
  },
  Medium: {
    type: String,
  },
  createdAt: {
    type: Date,
    required: true,
    default: Date.now(),
  },
  updatedAt: {
    type: Date,
    required: true,
    default: Date.now(),
  },
});

module.exports = mongoose.model("User", userSchema);
