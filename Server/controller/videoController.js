const WatchHistory = require("../models/historyvideo");


exports.getWatchHistory = async (req, res) => {
  try {
    const { id } = req.user;
    const watchHistory = await WatchHistory.find({ id });
    res.status(200).json(watchHistory);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


exports.addWatchHistory = async (req, res) => {
  const { id } = req.user;
  const { videoId } = req.body;

  const watchHistory = new WatchHistory({
    id,
    videoId,
  });

  try {
    const newWatchHistory = await watchHistory.save();
    res.status(201).json(newWatchHistory);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};
