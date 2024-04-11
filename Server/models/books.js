const mongoose = require('mongoose');

const bookSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  author: {
    type: String,
    required: true,
  },
  class: {
    type: String,
    required: true,
    enum: ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10', 'Class 11', 'Class 12'],
  },
  publisher: {
    type: String,
    required: true,
  },
  
});

// Create a model based on the schema
const Book = mongoose.model('Book', bookSchema);

module.exports = Book;
