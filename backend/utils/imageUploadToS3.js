const { S3Client, PutObjectCommand } = require('@aws-sdk/client-s3');
const sharp = require('sharp'); // For image resizing

const s3 = new S3Client({ region: process.env.AWS_REGION });

const uploadImagesToS3 = async (files) => {
  const timestamp = Date.now();
  const folderName = `property-images/${timestamp}`;

  const uploadImagePromises = files.map(async (file) => {
    try {
      const resizedImageBuffer = await sharp(file.buffer)
        .resize(800, 600)
        .toBuffer();

      const command = new PutObjectCommand({
        Bucket: process.env.AWSS3_BUCKET_NAME,
        Key: `${folderName}/${file.originalname}`,
        Body: resizedImageBuffer,
        ContentType: file.mimetype,
      });

      await s3.send(command);
    } catch (error) {
      console.error('Error resizing or uploading image:', error);
      throw new Error(`Error processing image ${file.originalname}: ${error.message}`);
    }
  });

  try {
    await Promise.all(uploadImagePromises);
    const folderUrl = `https://${process.env.AWSS3_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/${folderName}/`;
    //console.log("Folder URL:", folderUrl);
    return folderUrl;
  } catch (error) {
    console.error('Error during batch upload:', error);
    throw new Error('Failed to upload images to S3: ' + error.message);
  }
};

module.exports = { uploadImagesToS3 };
