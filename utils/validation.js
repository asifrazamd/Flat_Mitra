const validatePropertyData = (propertyData) => {
    const { city_id, builder_id, description, flat_no } = propertyData;
  
    if (!city_id || !builder_id || !description || !flat_no) {
      return 'Missing required fields';
    }
  
    return null; // No error
  };
  
  module.exports = { validatePropertyData };
  