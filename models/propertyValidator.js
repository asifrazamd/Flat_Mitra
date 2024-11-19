const Joi = require('joi');

// Define validation schema for property data
const propertySchema = Joi.object({
  user_id: Joi.number().integer().required().messages({
    'any.required': 'User ID is required',
    'number.base': 'User ID must be a number',
  }),
  city_id: Joi.number().integer().required(),
  builder_id: Joi.number().integer().required(),
  community_id: Joi.number().integer().required(),
  eat_preference_id: Joi.number().integer().required(),
  tenant_type_id: Joi.number().integer().required(),
  description: Joi.string().max(500).required(),
  flat_no: Joi.number().integer().required(),
  floor_no: Joi.number().integer().required(),
  bedrooms: Joi.number().integer().min(1).required(),
  bathrooms: Joi.number().integer().min(1).required(),
  balconies: Joi.number().integer().min(0).required(),
  parking: Joi.boolean().required(),
  rent: Joi.number().precision(2).positive().required(),
  deposit: Joi.number().precision(2).positive().required(),
});

// Export validation middleware
const validateProperty = (req, res, next) => {
  try {
    // Parse `propertyData` from the request body (expected as a JSON string)
    const propertyData = JSON.parse(req.body.propertyData);

    // Validate the parsed data against the schema
    const { error } = propertySchema.validate(propertyData, { abortEarly: false });
    if (error) {
      // Collect validation error messages
      const errorMessages = error.details.map((detail) => detail.message);
      return res.status(400).json({ message: 'Validation Error', errors: errorMessages });
    }

    // Attach validated data to the request object for downstream use
    req.propertyData = propertyData;
    next(); // Proceed to the next middleware
  } catch (error) {
    console.error('Error parsing or validating property data:', error.message);
    return res.status(400).json({ message: 'Invalid property data format' });
  }
};

module.exports = { validateProperty };
