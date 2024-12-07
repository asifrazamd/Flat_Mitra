// Import the database connection
const db = require("../config/db");

/**
 * @function getAllStateList
 * @description Retrieves a list of all states by calling the `get_state_list` stored procedure.
 * @access Public
 * @route GET /api/stateList
 */
const getAllStateList = async (req, res) => {
  try {
    const [state_list] = await db.query(`CALL get_state_list()`);
    return res.status(200).json(state_list[0]); // Respond with the first result set
  } catch (error) {
    return res.status(500).json({ message: 'Error getting state list', error: error.message });
  }
};

/**
 * @function getCityListBasedOnStateId
 * @description Retrieves a list of cities based on the provided state ID by calling the `get_city_list_based_on_stateId` stored procedure.
 * @access Public
 * @route GET /api/cityList
 * @query {number} state_id - The ID of the state to filter cities.
 */
const getCityListBasedOnStateId = async (req, res) => {
  const { state_id } = req.query; // Extract state ID from query parameters
  try {
    const [city_list] = await db.query(`CALL get_city_list_based_on_stateId(?)`, [state_id]);
    return res.status(200).json(city_list[0]); // Respond with the first result set
  } catch (error) {
    return res.status(500).json({ message: 'Error getting city list', error: error.message });
  }
};

/**
 * @function getBuildersListBasedOnCityId
 * @description Retrieves a list of builders based on the provided city ID by calling the `get_builders_list_based_on_cityId` stored procedure.
 * @access Public
 * @route GET /api/buildersList
 * @query {number} city_id - The ID of the city to filter builders.
 */
const getBuildersListBasedOnCityId = async (req, res) => {
  const { city_id } = req.query; // Extract city ID from query parameters
  try {
    const [builders_list] = await db.query(`CALL get_bulders_list_based_on_cityId(?)`, [city_id]);
    return res.status(200).json(builders_list[0]); // Respond with the first result set
  } catch (error) {
    return res.status(500).json({ message: 'Error getting builders list', error: error.message });
  }
};

/**
 * @function getCommunitiesListBasedOnBuilderId
 * @description Retrieves a list of communities based on the provided builder ID by calling the `get_community_list_based_on_builderId` stored procedure.
 * @access Public
 * @route GET /api/communitiesList
 * @query {number} builder_id - The ID of the builder to filter communities.
 */
const getCommunitiesListBasedOnBuilderId = async (req, res) => {
  const { builder_id } = req.query; // Extract builder ID from query parameters
  try {
    const [communities_list] = await db.query(`CALL get_community_list_based_on_builderId(?)`, [builder_id]);
    return res.status(200).json(communities_list[0]); // Respond with the first result set
  } catch (error) {
    return res.status(500).json({ message: 'Error getting communities list', error: error.message });
  }
};

/**
 * @function getStaticTablesData
 * @description Retrieves data from multiple static tables using a single stored procedure `getStaticTables`.
 * The result is mapped to meaningful keys for easy usage on the client side.
 * @access Public
 * @route GET /api/stTablesData
 */
const getStaticTablesData = async (req, res) => {
  try {
    const dbConnection = await db.getConnection(); // Get a database connection
    await dbConnection.beginTransaction(); // Begin a transaction

    try {
      // Call the `getStaticTables` stored procedure
      const [results] = await dbConnection.query('CALL getStaticTables()');
      await dbConnection.commit(); // Commit the transaction

      // Destructure the results into meaningful keys
      const [
        prop_type_list,
        home_type_list,
        property_description_list,
        bedrooms_list,
        bathrooms_list,
        balcony_list,
        tenant_type_list,
        tenant_eat_prefence_list,
        rental_range_list,
        parking_type_list,
        parking_count_list,
        deposit_range_list,
        gender_preference_list
      ] = results;

      // Map the results into an object
      const result = {
        prop_type_list,
        home_type_list,
        property_description_list,
        bedrooms_list,
        bathrooms_list,
        balcony_list,
        tenant_type_list,
        tenant_eat_prefence_list,
        rental_range_list,
        parking_type_list,
        parking_count_list,
        deposit_range_list,
        gender_preference_list
      };

      return res.status(200).json(result); // Respond with the structured data
    } catch (error) {
      await dbConnection.rollback(); // Rollback the transaction on error
      throw error;
    } finally {
      dbConnection.release(); // Release the connection
    }
  } catch (error) {
    return res.status(500).json({ message: 'Error getting static tables data', error: error.message });
  }
};

// Export all controller functions for use in routes
module.exports = {
  getAllStateList,
  getCityListBasedOnStateId,
  getBuildersListBasedOnCityId,
  getCommunitiesListBasedOnBuilderId,
  getStaticTablesData
};
