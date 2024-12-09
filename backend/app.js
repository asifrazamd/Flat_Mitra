// Import necessary modules
const express = require('express'); // Web framework for building RESTful APIs
const cors = require('cors'); // Middleware for enabling Cross-Origin Resource Sharing
const dotenv = require('dotenv'); // Module for loading environment variables from a .env file
const propertyRoutes = require('./routes/propertyRoutes'); // Routes for property-related endpoints
const stTablesRoutes = require('./routes/stTablesRoutes'); // Routes for other table-related endpoints
const authRoutes=require('./routes/authRoutes');


// Load environment variables from .env file
dotenv.config();

// Create an instance of an Express application
const app = express();

// Set the port for the application, with a default value of 5000 if not specified in .env
const PORT = process.env.PORT || 5000;

// Middleware configuration

// Enable Cross-Origin Resource Sharing (CORS) to allow requests from other domains
app.use(cors());

// Middleware to parse incoming JSON payloads in requests
app.use(express.json());

// Register API routes

// Property-related API routes, prefixed with /api
app.use('/api', propertyRoutes);

// Routes for managing static tables, also prefixed with /api
app.use('/api', stTablesRoutes);

app.use('/api',authRoutes);


// Start the server and listen for incoming requests on the specified port
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});