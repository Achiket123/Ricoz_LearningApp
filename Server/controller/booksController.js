const Book = require("../models/books"); // Assuming your Book model is in a separate file

// Search controller
exports.searchBooks = async (req, res) => {
  try {
    const { query } = req.query;
    const books = await Book.find({
      $or: [
        { title: { $regex: query, $options: "i" } },
        { author: { $regex: query, $options: "i" } },
        { class: { $regex: query, $options: "i" } },
      ],
    });

    res.json({ books });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Internal Server Error" });
  }
};
