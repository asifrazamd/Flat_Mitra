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

module.exports={getAllStateList,getCityListBasedOnStateId,getBuildersListBasedOnCityId};