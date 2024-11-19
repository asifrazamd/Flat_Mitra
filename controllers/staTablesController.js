const db=require("../config/db");

const getAllCommunities=async(req,res)=>{
    try{
        const [communities]=await db.query("SELECT * FROM sta_community");
        res.json(communities);
        }catch(err){
            console.error(err.message);
                res.status(500).json({message:"Error in fetching communities"});
                }
}
module.exports={getAllCommunities};