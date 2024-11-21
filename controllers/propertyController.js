const AWS = require('aws-sdk');  // Ensure AWS SDK is imported
const s3 = new AWS.S3();  // Initialize the S3 service

const db = require('../config/db');  // Import the db connection
//const pool = require('../d'); // Adjust the path if necessary
const dotenv = require('dotenv');
dotenv.config();

//const Property = require('../models/property'); // Assuming Property model is defined here
//const { uploadToS3 } = require('../services/s3Service');
const { uploadImagesToS3  } = require('../utils/imageUploadToS3'); // Assuming s3Service is

// Create Property and upload images to S3
const createProperty = async (req, res) => {
  try {
    const propertyData = JSON.parse(req.body.propertyData);
    

    // Prepare the parameters for the stored procedure
    const params = [
      propertyData.user_id,
      propertyData.city_id,
      propertyData.builder_id,
      propertyData.community_id,
      propertyData.eat_preference_id,
      propertyData.tenant_type_id,
      propertyData.description,
      propertyData.flat_no,
      propertyData.floor_no,
      propertyData.bedrooms,
      propertyData.bathrooms,
      propertyData.balconies,
      propertyData.parking,
      propertyData.rent,
      propertyData.deposit
    ];
    console.log(params);

    // Initialize the output parameter
    //const outputParam = [0]; // Placeholder for the output parameter (property_id)
    //console.log("out1",outputParam);

    // Call the stored procedure
    const [result] = await db.query(
      "CALL create_property(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @p_property_id)",
      [...params]
    );
    console.log('r1',result[0]);

    // Retrieve the output parameter value
    const [output] = await db.query("SELECT @p_property_id as property_id");
    console.log('output',output);

    const propertyId = output[0].property_id;
    console.log("p1",propertyId);

    // Step 2: Upload images to S3
    if (req.files && req.files.length > 0) {
      console.log("bheema");
      const folderUrl = await uploadImagesToS3 (req.files, propertyId); // Upload using property_id
      console.log("folderUrl",folderUrl);

      // Step 3: Update the property with the images folder URL
      const query = 'UPDATE dyn_properties SET images_folder = ? WHERE property_id = ?';
      const [updatedRows] = await db.query(query, [folderUrl, propertyId]);
      console.log(updatedRows);

      return res.status(201).json({
        message: 'Property created successfully',
        propertyId,
        imagesFolder: folderUrl,
      });
    } else {
      return res.status(400).json({ message: 'No images uploaded' });
    }
  } catch (error) {
    console.error('Error creating property:', error);
    return res.status(500).json({ message: 'Error creating property', error: error.message });
  }
};










/*const getproperties = async (req, res) => {
  const { property_id, user_id, page = 1, limit = 10 } = req.query; // Default to page 1 and limit 10

  try {
    // Call the stored procedure
    const sql = `CALL GetProperties(?, ?)`;
    const [result] = await db.query(sql, [
      property_id || null,
      user_id || null,
    ]);
    console.log("result",result);

    const properties = result[0]; // The first element contains the property data

    if (!properties.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    // Implement pagination
    const startIndex = (page - 1) * limit;
    console.log("get3",startIndex);
    const endIndex = startIndex + parseInt(limit);
    console.log("get4",endIndex);
    const paginatedProperties = properties.slice(startIndex, endIndex);
    console.log("get5",paginatedProperties)

    // Fetch images for paginated properties
    const imageResults = await Promise.all(
      paginatedProperties.map(async (property) => {
        if (!property.images_folder) return [];
        const folderName = new URL(property.images_folder).pathname.substring(1);
        console.log("get6",folderName);

        const listParams = {
          Bucket: process.env.AWSS3_BUCKET_NAME,
          Prefix: folderName,
        };
        console.log("get7",listParams);

        const listedObjects = await s3.listObjectsV2(listParams).promise();
        return listedObjects.Contents.map((object) =>
          `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${object.Key}`
        );
      })
    );
    console.log("get8",imageResults);

    // Attach images to their respective properties
    const propertiesWithImages = paginatedProperties.map((property, index) => ({
      ...property,
      images: imageResults[index] || [],
    }));
    console.log("get9",propertiesWithImages);

    res.status(200).json({
      message: 'Properties retrieved successfully',
      totalProperties: properties.length,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: propertiesWithImages,
    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};*/



/*const getproperties = async (req, res) => {
  const { property_id, user_id, page = 1, limit = 10 } = req.query; // Default to page 1 and limit 10
  const offset=(page -1)*limit
  try {
    const query1=`SELECT 
    dp.property_id,                           
    sc.name AS city,                          
    sb.name AS builder,                       
    sm.name AS community,                     
    sep.preference AS eat_preference,         
    stt.type AS tenant_type,                  
    dp.description,                           
    dp.flat_no,                               
    dp.floor_no,                             
    dp.bedrooms,                             
    dp.bathrooms,                             
    dp.balconies,                          
    dp.parking,                               
    dp.rent,                                
    dp.deposit,                             
    dp.images_folder,                        
    dp.created_at,                           
    dp.updated_at                           
FROM dyn_Properties dp
LEFT JOIN sta_City sc ON dp.city_id = sc.city_id
LEFT JOIN sta_Builder sb ON dp.builder_id = sb.builder_id
LEFT JOIN sta_Community sm ON dp.community_id = sm.community_id
LEFT JOIN sta_EatPreference sep ON dp.eat_preference_id = sep.preference_id
LEFT JOIN sta_TypeOfTenant stt ON dp.tenant_type_id = stt.tenant_id
limit ? offset ?;`

    const [properties1] =await db.query(query1,[Number(limit),offset]);
    console.log("p1",properties1);
    // Call the stored procedure
    


    if (!properties1.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    // Implement pagination
    
    // Fetch images for paginated properties
    const imageResults = await Promise.all(
      properties1.map(async (property) => {
        if (!property.images_folder) return [];
        const folderName = new URL(property.images_folder).pathname.substring(1);
        console.log("get6",folderName);

        const listParams = {
          Bucket: process.env.AWSS3_BUCKET_NAME,
          Prefix: folderName,
        };
        console.log("get7",listParams);

        const listedObjects = await s3.listObjectsV2(listParams).promise();
        return listedObjects.Contents.map((object) =>
          `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${object.Key}`
        );
      })
    );
    console.log("get8",imageResults);

    // Attach images to their respective properties
    const propertiesWithImages = properties1.map((property, index) => ({
      ...property,
      images: imageResults[index] || [],
    }));
    console.log("get9",propertiesWithImages);

    res.status(200).json({
      message: 'Properties retrieved successfully',
      totalProperties: properties1.length,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: propertiesWithImages,
    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};*/



const getproperties = async (req, res) => {
  const { property_id, user_id, page = 1, limit = 10 } = req.query;

  try {
    const offset = (page - 1) * limit;

    // Call the updated stored procedure
    const sql = `CALL GetProperties1(?, ?, ?, ?)`;
    const [result] = await db.query(sql, [
      property_id || null,
      user_id || null,
      offset,
      parseInt(limit),
    ]);
    console.log("get1",result);

    const properties = result[0]; // Fetch only the paginated properties
    console.log("get2",properties);

    if (!properties.length) {
      return res.status(404).json({ message: 'No properties found' });
    }

    // Fetch images for these properties
    const imageResults = await Promise.all(
      properties.map(async (property) => {
        if (!property.images_folder) return [];
        const folderName = new URL(property.images_folder).pathname.substring(1);
        console.log("get3",folderName);

        const listParams = {
          Bucket: process.env.AWSS3_BUCKET_NAME,
          Prefix: folderName,
        };
        console.log("get4",listParams);

        const listedObjects = await s3.listObjectsV2(listParams).promise();
        console.log("get5",listedObjects);
        return listedObjects.Contents.map((object) =>
          `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${object.Key}`
        );
      })
    );
    console.log("get6",imageResults);

    // Attach images to their respective properties
    const propertiesWithImages = properties.map((property, index) => ({
      ...property,
      images: imageResults[index] || [],
    }));
    console.log("get7",propertiesWithImages);

    // Total properties count (optional: could be fetched with a separate query)
    //const countSql = `SELECT COUNT(*) AS total FROM dyn_properties WHERE (property_id IS NULL OR property_id = ?) AND (user_id IS NULL OR user_id = ?)`;
    const countSql = `SELECT COUNT(*) as total FROM dyn_properties`;


    const [countResult] = await db.query(countSql);
    console.log("get8",countResult);
    const totalProperties = countResult[0]?.total || 0;
    console.log("get9",totalProperties);

    res.status(200).json({
      message: 'Properties retrieved successfully',
      totalProperties,
      page: parseInt(page),
      limit: parseInt(limit),
      properties: propertiesWithImages,
    });
  } catch (error) {
    console.error('Error retrieving properties:', error);
    res.status(500).json({ error: 'Failed to retrieve properties' });
  }
};


















const deleteproperty = async (req, res) => {
  const { id } = req.params;  // Make sure you're using `id` from the URL params

  try {
    // Retrieve images folder URL from the database
    const [property] = await db.query(
      'SELECT images_folder FROM dyn_Properties WHERE property_id = ?',
      [id]
    );

    if (property.length === 0) {
      return res.status(404).json({ message: 'Property not found' });
    }

    const folderUrl = property[0].images_folder;
    const folderName = new URL(folderUrl).pathname.substring(1); // Extract folder path

    // List objects in the S3 folder and delete them
    const listParams = {
      Bucket: process.env.AWSS3_BUCKET_NAME,
      Prefix: folderName, // Use the folder name as prefix
    };
    
    const listedObjects = await s3.listObjectsV2(listParams).promise();
    
    // If the folder contains images, delete them
    if (listedObjects.Contents.length > 0) {
      const deleteParams = {
        Bucket: process.env.AWSS3_BUCKET_NAME,
        Delete: {
          Objects: listedObjects.Contents.map(object => ({ Key: object.Key })),
        },
      };
      await s3.deleteObjects(deleteParams).promise();
    }

    // Call the stored procedure to delete the property from the database
    await db.query('CALL delete_property(?)', [id]);

    // Respond with success
    res.status(200).json({ message: 'Property and images deleted successfully' });

  } catch (error) {
    console.error('Error deleting property:', error);
    res.status(500).json({ error: 'Failed to delete property' });
  }
};


/**
 * Update Property
 */
const updateproperty = async (req, res) => {
  const { property_id } = req.params;
  const updateData = req.body; // Assume the data to update is sent in the request body

  try {
    // Call the stored procedure with the update data
    const sql = `
      CALL UpdateDynProperties(
        ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
      )
    `;

    const params = [
      Number(property_id),
      updateData.city_id || null,
      updateData.builder_id || null,
      updateData.community_id || null,
      updateData.eat_preference_id || null,
      updateData.tenant_type_id || null,
      updateData.description || null,
      updateData.flat_no || null,
      updateData.floor_no || null,
      updateData.bedrooms || null,
      updateData.bathrooms || null,
      updateData.balconies || null,
      updateData.parking || null,
      updateData.rent || null,
      updateData.images_folder || null,
    ];

    await db.query(sql, params);

    res.status(200).json({ message: 'Property updated successfully' });
  } catch (error) {
    console.error('Error updating property:', error);
    res.status(500).json({ error: 'Failed to update property' });
  }
};



module.exports = { createProperty, getproperties,deleteproperty,updateproperty};

