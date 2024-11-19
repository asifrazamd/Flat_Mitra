const AWS = require('aws-sdk');
const sharp = require('sharp'); // Import sharp for image resizing

// Initialize the AWS S3 instance
const s3 = new AWS.S3();

const uploadToS3 = async (files) => {
  const timestamp = Date.now(); // Unique timestamp for the folder
  const folderName = `property-images/${timestamp}`; // Folder with timestamp to ensure uniqueness

  const uploadPromises = files.map(async (file) => {
    try {
      // Resize the image and get the buffer
      const resizedImageBuffer = await sharp(file.buffer) // Ensure we await the promise from sharp
        .resize(800, 600) // Resize to 800x600, adjust as needed
        .toBuffer(); // Resolves to a buffer

      const params = {
        Bucket: process.env.AWSS3_BUCKET_NAME,
        Key: `${folderName}/${file.originalname}`, // Store images under the new folder
        Body: resizedImageBuffer,  // Pass the actual buffer to S3
        ContentType: file.mimetype,
      };

      // Upload the image to S3 and return the result
      return s3.upload(params).promise();
    } catch (error) {
      console.error('Error resizing or uploading image:', error);
      throw new Error('Error uploading to S3: ' + error.message);
    }
  });

  try {
    // Wait for all images to be uploaded
    await Promise.all(uploadPromises);
    
    // Generate folder URL
    const folderUrl = `https://${process.env.AWSS3_BUCKET_NAME}.s3.amazonaws.com/${folderName}/`;
    return folderUrl;
  } catch (error) {
    throw new Error('Error uploading to S3: ' + error.message);
  }
};

module.exports = { uploadToS3 };
