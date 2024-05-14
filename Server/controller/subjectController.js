const Subject = require("../models/subject");

// Controller function to fetch subjects based on user's registered class
const getSubjectsByClass = async (req, res) => {
  try {
    const { user_class } = req.user;
    const subjects = await Subject.find({ class: user_class });

    res.json({ subjects });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

module.exports = { getSubjectsByClass };
