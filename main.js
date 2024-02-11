const express =require('express');

const app= express();

const PORT =process.env.PORT ||8000

app.get('/',(req,res)=>{
    return  res.json({message:'Hey, i am node JS in container By Rahul'});
});

app.listen(PORT,()=>console.log(`Server started on PORT : ${PORT}`));


