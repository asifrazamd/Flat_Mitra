// app.js
const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const userRoutes=require('./routes/userRoutes');
const propertyRoutes = require('./routes/propertyRoutes');
const stTablesRoutes=require('./routes/stTablesRoutes');
//const db = require('./config/db');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());


// Register the routes
app.use('/api', propertyRoutes);

app.use('/api',userRoutes);

app.use('/api',stTablesRoutes);
// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
