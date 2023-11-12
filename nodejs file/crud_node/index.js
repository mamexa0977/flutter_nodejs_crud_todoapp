const express = require("express");
const req = require("express/lib/request");
const mongoose = require("mongoose");
// const mongoDB = require("mongdb")
const User = require("./user")


const app = express()

app.use(express.json());
// app.use("/", router);

const Port = 8080;
app.delete("/:id",async(req,res)=>{
  console.log(req.params.id);
  
  let data = await User.findOneAndDelete({_id: req.params.id})
  
  res.send(data)

});
  app.get("/all", (req,res)=>{

    User.find().then((result)=>{
      res.send(result)
      
    }).catch((e)=>{
      console.log(e)
    })
  });
  



app.post("/post", async(req,res)=>{
    console.log("post ready")
    // const  {user} = req.body;
    try {
        const userData = await User.create(req.body)
        console.log(userData)

        res.json(userData)
       
        
    } catch (error) {
        console.log(error)
        
    }
   

  
})
app.listen(Port,"192.168.8.104",async ()=>{
    try{
        mongoose.set("strictQuery", false);
        await mongoose.connect("mongodb+srv://yourname:yourpassword@cluster0.z65xuf6.mongodb.net/?retryWrites=true&w=majority");
        }catch (e){
        console.log(e)
    }
    console.log("Connected to mongoDB And listening on ",Port);
});





