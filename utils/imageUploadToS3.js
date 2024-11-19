const AWS = require('aws-sdk');
const sharp = require('sharp'); // Import sharp for image resizing

// Initialize the AWS S3 instance
const s3 = new AWS.S3();

/**
 * Upload multiple images to AWS S3 after resizing them
 * 
 * @param {Array} files - Array of image files to upload (must include buffer and mimetype)
 * @param {String} propertyId - Unique property ID to organize images in the S3 bucket
 * @returns {String} - URL of the folder containing the uploaded images
 */
const uploadImagesToS3 = async (files, propertyId) => {
  const timestamp = Date.now(); // Unique timestamp for better organization
  const folderName = `property-images/${propertyId}`; // Folder based on propertyId

  console.log("Folder Name:", folderName);

  const uploadImagePromises = files.map(async (file) => {
    try {
      // Resize the image using Sharp and convert it to a buffer
      const resizedImageBuffer = await sharp(file.buffer)
        .resize(800, 600) // Resize to dimensions 800x600
        .toBuffer();

      const s3UploadParams = {
        Bucket: process.env.AWSS3_BUCKET_NAME,
        Key: `${folderName}/${file.originalname}`, // S3 path: folderName + file name
        Body: resizedImageBuffer,  // Buffer of resized image
        ContentType: file.mimetype,
      };

      console.log("Uploading to S3 with params:", s3UploadParams);

      // Upload to S3 and return the result
      return s3.upload(s3UploadParams).promise();
    } catch (error) {
      console.error('Error resizing or uploading image:', error);
      throw new Error(`Error processing image ${file.originalname}: ${error.message}`);
    }
  });

  try {
    // Wait for all images to be uploaded
    await Promise.all(uploadImagePromises);

    // Generate and return the folder's URL
    const folderUrl = `https://${process.env.AWSS3_BUCKET_NAME}.s3.amazonaws.com/${folderName}/`;
    console.log("Folder URL:", folderUrl);
    return folderUrl;
  } catch (error) {
    console.error('Error during batch upload:', error);
    throw new Error('Failed to upload images to S3: ' + error.message);
  }
};

module.exports = { uploadImagesToS3 };
