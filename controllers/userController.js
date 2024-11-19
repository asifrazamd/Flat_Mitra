const userModel = require('../models/userModel');
const dotenv = require('dotenv');
dotenv.config();


// User registration
const createUser = (req, res) => {
    console.log('Received registration request:', req.body); // Check if request body is correctly parsed

  const { username, email, password } = req.body;

  const userData = { username, email, password };

  userModel.createUser(userData, (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Error creating user', error: err });
    }
    res.status(201).json({ message: 'User created successfully' });
  });
};

// User login
const loginUser = async (req, res) => {
  const { username, password } = req.body;

  console.log('Login request received:', { username, password });

  try {
    const results = await userModel.validateUserLogin(username, password);

    if (results.length === 0) {
      console.log('Invalid credentials for:', username);
      return res.status(400).json({ message: 'Invalid username or password' });
    }

    console.log('Login successful for user:', results[0]);
    return res.status(200).json({ message: 'Login successful', user: results[0] });
  } catch (error) {
    console.error('Error during login:', error);
    return res.status(500).json({ message: 'Error logging in', error });
  }
};

module.exports = {
  createUser,
  loginUser,
};
