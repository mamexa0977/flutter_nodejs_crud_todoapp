const mongoose = require("mongoose")


const userSchema = new mongoose.Schema(
   { title: String,
    describtion: String,
    
    uploaddate: {
        type: Date,
        default: ()=> Date.now(),
    },
}
)

module.exports = mongoose.model("Crud", userSchema)