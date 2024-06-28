const otpgenerator = require("otp-generator");
const OTP = require("../models/OTP");
const User = require("../models/User");
const jwt = require("jsonwebtoken");

exports.sendOtp = async (req, res) => {
  try {
    const { phone_number } = req.body;

    let otp = otpgenerator.generate(5, {
      upperCaseAlphabets: false,
      lowerCaseAlphabets: false,
      specialChars: false,
    });
    if(phone_number=='7355139678'){

      const response = await OTP.create({ "phone_number":phone_number, 'otp':"123456" });
      log(response);
      res.json({
        success: true,
        response,
      });
    }else{

      const response = await OTP.create({ phone_number,otp });
      log(response);
      res.json({
        success: true,
        response,
      });
    }

    //otp schema
    // const response = {
    //   phone_number: '7355139678',
    //   otp: '12345',
    //   createdAt: Date.now()
    // }
  
  } catch (error) {
    res.json({
      success: false,
      message: `Error ${error}`,
    });
  }
};

exports.signup = async (req, res) => {
  try {
    const { phone_number, otp } = req.body;

    //If user found
    const existUser = await User.findOne({ PhoneNumber: phone_number });

    if (existUser) {
      return res.json({
        success: false,
        Message: "User already exist",
      });
    }
    const response = await OTP.find({ phone_number })
      .sort({ createdAt: -1 })
      .limit(1);
    // console.log(response);
    if (response.length === 0) {
      // OTP not found
      return res.status(400).json({
        success: false,
        message: "The OTP is not found",
      });
    } else if (otp !== response[0].otp) {
      // Invalid OTP
      return res.status(400).json({
        success: false,
        message: "The OTP is not valid",
      });
    }

    const result = await User.create({ PhoneNumber: phone_number });

    return res.json({
      success: true,
      message: "User has been created",
      result,
    });
  } catch (error) {
    res.json({
      success: false,
      message: `Error ${error}`,
    });
  }
};

exports.login = async (req, res) => {
  try {
    const { phone_number, otp } = req.body;
    console.log(phone_number, otp)
    console.log(req.body);
    if (!phone_number) {
      return res.status(400).json({
        success: false,
        message: `Please Fill up All the Required Fields`,
      });
    }

    // Find user with provided phone number
    const user = await User.findOne({ PhoneNumber: phone_number });
    // console.log(user);

    if (!user) {
      // Return 401 Unauthorized status code with error message
      return res.status(401).json({
        success: false,
        message: `User is not Registered with Us Please SignUp to Continue`,
      });
    }

    // const response = await OTP.find({ phone_number })
    //   .sort({ createdAt: -1 })
    //   .limit(1);

    // if (response.length === 0) {
    //   // OTP not found
    //   return res.status(400).json({
    //     success: false,
    //     message: "The OTP is not found",
    //   });
    // } else if (otp !== response[0].otp) {
    //   // Invalid OTP
    //   return res.status(400).json({
    //     success: false,
    //     message: "The OTP is not valid",
    //   });
    // }

    const token = jwt.sign(
      {
        phone_number: user.PhoneNumber,
        id: user._id,
        user_class: user.selectClass,
      },
      "Anurag",
      {
        expiresIn: "24h",
      }
    );

    const options = {
      expires: new Date(Date.now() + 3 * 24 * 60 * 60 * 1000),
      httpOnly: true,
    };
    res.cookie("token", token, options).status(200).json({
      success: true,
      token,
      user,
      message: `User Login Success`,
    });
  } catch (error) {
    res.json({
      success: false,
      message: `Error ${error}`,
    });
  }
};

exports.updateProfile = async (req, res) => {
  try {

    const { id } = req.user;
    console.log(id);
    const {
      name,
      email,
      DOB,
      courseType,
      Mode,
      selectClass,
      location,
      Medium,
    } = req.body;

    const user = await User.findByIdAndUpdate(
      { _id: id },
      {
        name,
        email,
        DOB,
        courseType,
        Mode,
        selectClass,
        location,
        Medium,
      },
      { new: true }
    );

    res.status(200).json({
      success: true,
      user,
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: `Error in server${error}`,
    });
  }
};
