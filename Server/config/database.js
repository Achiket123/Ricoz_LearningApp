const mongoose = require("mongoose");

exports.connect = async () => {
  await mongoose
    .connect("mongodb+srv://nolafis395:8n1SPzMBaf3zkZtW@cluster0.yflmhey.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
    .then(console.log(`DB Connection Success`))
    .catch((err) => {
      console.log(`DB Connection Failed`);
      console.log(err);
      process.exit(1);
    });
};
