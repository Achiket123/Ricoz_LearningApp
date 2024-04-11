const express = require("express");
const app = express();
const userRoutes = require("./Router/userRouter");
const database = require("./config/database");
const cors = require("cors");
const common = require("./Router/route");

// Setting up port number
const PORT = 8000;

// Connecting to database
database.connect();

// Middlewares
app.use(express.json());

app.use(
  cors({
    origin: "*",
    credentials: true,
  })
);

// Setting up routes
app.use("/api/v1/auth", userRoutes);
app.use("/api/v1", common);

// Testing the server
app.get("/", (req, res) => {
  return res.json({
    success: true,
    message: "Your server is up and running ...",
  });
});

// Listening to the server
app.listen(PORT, () => {
  console.log(`App is listening at ${PORT}`);
});

// End of code.
