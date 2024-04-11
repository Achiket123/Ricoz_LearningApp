const mongoose = require('mongoose');

// Define a schema for subjects
const subjectSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  class: {
    type: String,
    required: true,
    enum: ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10', 'Class 11', 'Class 12'],
  },
});

// Create a model based on the schema
const Subject = mongoose.model('Subject', subjectSchema);

module.exports = Subject;
