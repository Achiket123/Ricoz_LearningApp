const mongoose = require("mongoose");

// Define a schema for subjects
const subjectSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  class: {
    type: String,
    required: true,
    enum: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
  },
});

// Create a model based on the schema
const Subject = mongoose.model("Subject", subjectSchema);

module.exports = Subject;
