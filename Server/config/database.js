const mongoose = require("mongoose");

exports.connect = async () => {
  await mongoose
    .connect("mongodb://127.0.0.1:27017/Ricoz_LearningApp")
    .then(console.log(`DB Connection Success`))
    .catch((err) => {
      console.log(`DB Connection Failed`);
      console.log(err);
      process.exit(1);
    });
};
