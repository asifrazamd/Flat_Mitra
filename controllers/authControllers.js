const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const db=require("../config/db");
const dotenv = require('dotenv');
dotenv.config();



const signup=async (req, res) => {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({ message: 'All fields are required.' });
    }

    try {

        const [[user]] = await db.query('CALL GetUserByEmail(?)', [email]);
        
        if (user) {
            return res.status(400).json({ message: 'Email already exists.' });
            }


        // Hash the password
        const hashedPassword = await bcrypt.hash(password,parseInt( process.env.BCRYPT_SALT_ROUNDS));

        // Call the stored procedure to create a new user
        await db.query('CALL CreateUser(?, ?, ?)', [username, email, hashedPassword]);

        res.status(201).json({ message: 'User created successfully.' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Internal server error.' });
    }
};

// Login endpoint
const login = async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ message: 'All fields are required.' });
    }

    try {
        // Call the stored procedure to get the user by email
        const [[user]] = await db.query('CALL GetUserByEmail(?)', [email]);

        if (!user || user.length === 0) {
            return res.status(401).json({ message: 'Invalid email or password.' });
        }

        // Verify the password
        const isPasswordValid = await bcrypt.compare(password, user[0].password);

        if (!isPasswordValid) {
            return res.status(401).json({ message: 'Invalid email or password.' });
        }

        // Generate a JWT
        const token = jwt.sign({ id: user[0].id, email: user[0].email }, process.env.JWT_SECRET, {
            expiresIn: process.env.JWT_EXPIRES_IN,
        });

        res.status(200).json({ message: 'Login successful.', token });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Internal server error.' });
    }
};
 
module.exports={signup,login};
