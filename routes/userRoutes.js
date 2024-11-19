const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// User registration
router.post('/register', userController.createUser);
/*router.post('/register', (req, res) => {
    const { username, email, password } = req.body;
    
    // You can add your registration logic here
    res.json({
      message: `User ${username} registered successfully!`,
      data: { username, email }
    });
  });*/

// User login
router.post('/login', userController.loginUser);

module.exports = router;
