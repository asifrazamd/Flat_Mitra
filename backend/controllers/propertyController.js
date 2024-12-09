const { S3Client, ListObjectsV2Command, DeleteObjectsCommand } = require('@aws-sdk/client-s3');
const { uploadImagesToS3 } = require('../utils/imageUploadToS3'); // S3 upload utility
const db = require('../config/db'); // Database connection
const dotenv = require('dotenv');
const { redis } = require("../config/redis");

// Load environment variables
dotenv.config();

// Initialize S3 client
const s3Client = new S3Client({ region: process.env.AWS_REGION });


const createProperty = async (req, res) => {
  const dbConnection = await db.getConnection(); // Assuming a DB connection pool
  try {

    // Upload images to S3 if provided
    const folderUrl = req.files?.length
      ? await uploadImagesToS3(req.files)
      : Null;


    // Parse property data from request body
    const propertyData = JSON.parse(req.body.data);

    // Prepare stored procedure parameters
    const params = [
      propertyData.user_id,
      propertyData.prop_type_id,
      propertyData.home_type_id,
      propertyData.prop_desc_id,
      propertyData.community_id,
      propertyData.no_beds,
      propertyData.no_baths,
      propertyData.no_balconies,
      propertyData.tenant_type_id,
      propertyData.tenant_eat_pref_id,
      propertyData.rental_range_id,
      propertyData.parking_type_id,
      propertyData.parking_count_id,
      propertyData.deposit_range_id,
      propertyData.gender_pref,
      propertyData.availabl_date,
      propertyData.tower_no,
      propertyData.floor_no,
      propertyData.flat_no,
      folderUrl, // S3 folder URL as images_location
    ];

    // Execute stored procedure
    await dbConnection.query(`CALL CreateProperty(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`, params);

    return res.status(201).json({
      message: 'Property created successfully',
      images_location: folderUrl,
    });
  } catch (error) {
    console.error("Error in createProperty:", error);
    return res.status(500).json({
      message: 'Error creating property',
      error: error.message,
    });
  } finally {
    if (dbConnection) dbConnection.release(); // Ensure the connection is released
  }
};



const getPropertyDetails = async (req, res) => {
  const { property_id} = req.query;
  if (!property_id) {
    return res.status(400).json({ error: "Property ID is required" });
  }

  try {
    // Check Redis cache first
    let cachedData = await redis.get(`AllPropertiesData`);
    if (cachedData) {
      cachedData=JSON.parse(cachedData).filter((item)=>{
        if (item.id===parseInt(property_id)){
          return item
        }
      })
      
      return res.status(200).json((cachedData[0]));
    }
    // Call the stored procedure
    const sql = `CALL get_all_properties()`;
    const [result] = await db.query(sql);
    
    let properties = result[0];

    // Cache the data in Redis for 1 hour
    await redis.set(`AllPropertiesData`, JSON.stringify(properties), 'EX', 3600);

    properties=properties.filter((item)=>{
      if (item.id===parseInt(property_id)){
        return item
      }
    })

    if (!properties.length) {
      return res.status(404).json(`{ message: No Property Found with ID : ${property_id} }`);
    }

    res.status(200).json(
      properties[0]
      //properties: propertiesWithImages,
    );
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};

const getAllProperties = async (req, res) => {
  const { page = 1, limit = 10 } = req.query;

  try {
    const offset = (page - 1) * limit;
    // Check Redis cache first
    let cachedData = await redis.get('AllPropertiesData');
    if (cachedData) {
      cachedData = JSON.parse(cachedData).slice(offset, offset + parseInt(limit));
      
      return res.status(200).json((cachedData[0]));
    }


    // Call the stored procedure
    const sql = `CALL get_all_properties()`;
    const [result] = await db.query(sql);
  

    let properties = result[0];

    // Cache the data in Redis for 1 hour
    await redis.set('AllPropertiesData', JSON.stringify(properties), 'EX', 3600);

    const totalProperties=properties.length

    if (!properties.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    properties = properties.slice(offset, offset + parseInt(limit));
    res.status(200).json({
      message: 'Properties retrieved successfully',
      totalProperties,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: properties,

    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};
module.exports = { createProperty, getPropertyDetails, getAllProperties };