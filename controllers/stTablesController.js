const db=require("../config/db");

const getAllStateList=async(req,res)=>{
    try{
        const [state_list]=await db.query(`call get_state_list()`)
        return res.status(200).json(state_list[0])
    }
    catch(error){
        return res.status(500).json({ message: 'Error getting state list', error: error.message });
    }
    

}

const getCityListBasedOnStateId=async(req,res)=>{
    const {state_id}=req.query
    try{
        const [city_list]=await db.query(`call get_city_list_based_on_stateId(?)`,[state_id])
        return res.status(200).json(city_list[0])
    }
    catch(error){
        return res.status(500).json({ message: 'Error getting state list', error: error.message });
    }
}


const getBuildersListBasedOnCityId=async(req,res)=>{
    const {city_id}=req.query
    try{
        const [builders_list]=await db.query(`call get_bulders_list_based_on_cityId(?)`,[city_id])
        console.log(builders_list)
        return res.status(200).json(builders_list[0])
    }
    catch(error){
        return res.status(500).json({ message: 'Error getting builders list', error: error.message });
    }
}
const getCommunitiesListBasedOnBuilderId=async(req,res)=>{
    const {builder_id}=req.query
    try{
        const [communities_list]=await db.query(`call get_community_list_based_on_builderId(?)`,[builder_id])
        return res.status(200).json(communities_list[0])
    }
    catch(error){
        return res.status(500).json({ message: 'Error getting communities list', error: error.message });
    }
  }





  const getStaticTablesData = async (req, res) => {
    try {
      const dbConnection = await db.getConnection();
      await dbConnection.beginTransaction();
  
      try {
        // Call the single stored procedure
        const [results] = await dbConnection.query('CALL getStaticTables()');
        console.log("results",results);
        await dbConnection.commit();
  
        // Map the results to meaningful keys
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
  
        return res.status(200).json(result);
      } catch (error) {
        await dbConnection.rollback();
        throw error;
      } finally {
        dbConnection.release();
      }
    } catch (error) {
      return res
        .status(500)
        .json({ message: 'Error getting static tables data', error: error.message });
    }
  };
  

module.exports={getAllStateList, getCityListBasedOnStateId,getBuildersListBasedOnCityId,getCommunitiesListBasedOnBuilderId,getStaticTablesData};