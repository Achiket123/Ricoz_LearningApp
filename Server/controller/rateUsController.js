const rateUsSchema = require("../models/rateUs");

exports.giveRating = async (req, res) => {
  try {
    const { rating } = req.body;
    if (rating > 5) {
      return res.status(400).json({ message: "Rate star up to 5 only" });
    }
    const addRating = new rateUsSchema({
      rating
    });

    const result = await addRating.save();
    res.status(201).json({ message: "Rating done !", result });
  } catch (err) {
    console.log(err);
    return res.status(500).json({ message: "Internal server err" });
  }
};
