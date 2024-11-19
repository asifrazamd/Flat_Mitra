const db = require('../config/db'); // Assuming you have a database connection file

// Create a user
const createUser = async (userData, callback) => {
  const { username, email, password } = userData;

  const query = 'INSERT INTO dyn_users (username, email, password) VALUES (?, ?, ?)';
  await db.query(query, [username, email, password], (err, results) => {
    callback(err, results);
  });
};

// Validate user login
const validateUserLogin = async (username, password) => {
  try {
    const query = 'SELECT * FROM dyn_users WHERE username = ? AND password = ?';
    console.log('Executing Query:', query, [username, password]); // Debug log
    const [results] = await db.query(query, [username, password]);
    console.log('Query Results:', results); // Log query results
    return results;
  } catch (error) {
    console.error('Database Query Error:', error);
    throw error;
  }
};
module.exports = {
  createUser,
  validateUserLogin
};
