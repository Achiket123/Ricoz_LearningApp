const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const rateUsSchema = new Schema(
  {
    rating: {
      type: Number,
      required: true,
      min: [1, "Rating must be at least 1"],
      max: [5, "Rating cannot be more than 5"],
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Rate", rateUsSchema);
