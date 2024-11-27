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

const getStaticTablesData=async(req,res)=>{
    try{
        const [depositeRangeList]=await db.query(`call GetDepositRanges()`)
        const [conversationModesList]=await db.query(`call GetConversationModes`)
        const [bedroomsList]=await db.query(`call GetBedrooms`)
        const [bathroomsList]=await db.query(`call GetBathrooms`)
        const [balconiesList]=await db.query(`call GetBalconies`)
        const [floorRangesList]=await db.query(`call GetFloorRanges`)
        const [homeTypesList]=await db.query(`call GetHomeTypes`)
        const [propertyDescriptionList]=await db.query(`call GetPropertyDescriptions`)
        const [propertyTypesList]=await db.query(`call GetPropertyTypes`)
        const [rentalRangesList]=await db.query(`call GetRentalRanges`)
        const [TenantEatPreferencesList]=await db.query(`call GetTenantEatPreferences`)  
        const [GetTenantTypesList]=await db.query(`call GetTenantTypes`)

        const result={
            "depositeRangeList":depositeRangeList[0],
            "conversationModesList":conversationModesList[0],
            "bedroomsList":bedroomsList[0],
            "bathroomsList":bathroomsList[0],
            "balconiesList":balconiesList[0],
            "floorRangesList":floorRangesList[0],
            "homeTypesList":homeTypesList[0],
            "propertyDescriptionList":propertyDescriptionList[0],
            "propertyTypesList":propertyTypesList[0],
            "rentalRangesList":rentalRangesList[0],
            "TenantEatPreferencesList":TenantEatPreferencesList[0],
            "GetTenantTypesList":GetTenantTypesList[0]

        }
        console.log("4",result);
        return res.status(200).json(result)
    }
    catch(error){
        return res.status(500).json({ message: 'Error getting builders list', error: error.message });
    }
}

/*const getBuildersListBasedOnCityId=async(req,res)=>{
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

const callStoredProcedure = (procedureName) => (req, res) => {
    db.query(`CALL ${procedureName}()`, (error, results) => {
      if (error) {
        console.error(`Error executing procedure ${procedureName}:`, error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
      res.json(results[0]);
    });
  };*/

module.exports={getAllStateList,getCityListBasedOnStateId,getBuildersListBasedOnCityId,getStaticTablesData};