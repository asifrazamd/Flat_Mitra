const { S3Client, ListObjectsV2Command, DeleteObjectsCommand } = require('@aws-sdk/client-s3');
const { uploadImagesToS3 } = require('../utils/imageUploadToS3'); // S3 upload utility
const db = require('../config/db'); // Database connection
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// Initialize S3 client
const s3Client = new S3Client({ region: process.env.AWS_REGION });
const createProperty = async (req, res) => {
  const dbConnection = await db.getConnection(); // Assuming a DB connection pool
  try {
    console.log("Processing createProperty request...");

    // Upload images to S3 if provided
    const folderUrl = req.files?.length
      ? await uploadImagesToS3(req.files)
      : Null;

    console.log("S3 Folder URL:", folderUrl);

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
    console.log("Calling stored procedure with params:", params);
    await dbConnection.query('CALL CreateProperty(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', params);

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
const getProperties = async (req, res) => {
  const { property_id, user_id, page = 1, limit = 10 } = req.query;
  if (!property_id) {
    return res.status(400).json({ error: "Property ID is required" });
  }

  try {
    const offset = (page - 1) * limit;

    // Call the stored procedure
    const sql = `CALL get_properties(?, ?,?,?)`;
    const [result] = await db.query(sql, [
      property_id || null,
      user_id || null,
      offset,
      parseInt(limit),
    ]);

    const properties = result[0];
    if (!properties.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    // Fetch images for each property
    /*const imageResults = await Promise.all(
      properties.map(async (property) => {
        if (!property.images_location) return [];
        const folderName = new URL(property.images_location).pathname.substring(1);

        const listParams = {
          Bucket: process.env.AWSS3_BUCKET_NAME,
          Prefix: folderName,
        };

        const command = new ListObjectsV2Command(listParams);
        const listedObjects = await s3Client.send(command);

        return (listedObjects.Contents || []).map((object) =>
          `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${object.Key}`
        );
      })
    );

    // Attach images to properties
    const propertiesWithImages = properties.map((property, index) => ({
      ...property,
      images: imageResults[index] || [],
    }));*/

    // Fetch total properties count
    const countSql = `SELECT COUNT(*) as total FROM dy_property`;
    const [countResult] = await db.query(countSql);
    const totalProperties = countResult[0]?.total || 0;
    const properties1 = properties.map((property, index) => ({
      ...property,
    }));

    res.status(200).json({
      message: 'Properties retrieved successfully',
      //totalProperties,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: properties1,

      //properties: propertiesWithImages,
    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};

const getAllProperties = async (req, res) => {
  const { page = 1, limit = 10 } = req.query;

  try {
    const offset = (page - 1) * limit;

    // Call the stored procedure
    const sql = `CALL get_all_properties(?, ?)`;
    const [result] = await db.query(sql, [
      //property_id || null,
      //user_id || null,
      offset,
      parseInt(limit),
    ]);

    console.log("below");
    const properties = result[0];
    console.log("properties",properties);
    if (!properties.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    // Fetch images for each property
    /*const imageResults = await Promise.all(
      properties.map(async (property) => {
        console.log("images_location:", property.images_location);

        if (!property.images_location) return [];
        const folderName = new URL(property.images_location).pathname.substring(1);
        console.log("folderName",folderName);

        const listParams = {
          Bucket: process.env.AWSS3_BUCKET_NAME,
          Prefix: folderName,
        };
        console.log("list",listParams);


        const command = new ListObjectsV2Command(listParams);
        const listedObjects = await s3Client.send(command);

        return (listedObjects.Contents || []).map((object) =>
          `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${object.Key}`
        );
      })
    );
    console.log("imageResults",imageResults);

    // Attach images to properties
    const propertiesWithImages = properties.map((property, index) => ({
      ...property,
      images: imageResults[index] || [],
    }));
    console.log("propertiesWithImages",propertiesWithImages);*/

    // Fetch total properties count
    const countSql = `SELECT COUNT(*) as total FROM dy_property`;
    const [countResult] = await db.query(countSql);
    const totalProperties = countResult[0]?.total || 0;
    const properties1 = properties.map((property, index) => ({
      ...property,
    }));

    res.status(200).json({
      message: 'Properties retrieved successfully',
      totalProperties,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: properties1,

      //properties: propertiesWithImages,
    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};
module.exports = { createProperty, getProperties, getAllProperties };
