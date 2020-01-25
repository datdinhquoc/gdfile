//Libs
import express from "express";
import request from "request";

//Make a lock
function new_lock(){
  var Unlock,Lock=new Promise((Resolve,Reject)=>{ Unlock=Resolve; });
  return [Lock,Unlock];
}

//PROGRAMME ENTRY POINT=========================================================
var Server = express();

Server.get("/gd/*",async (Req,Res)=>{
  var Url     = Req.url;
  var Id      = Url.replace("/gd/","");
  var Gd_Url  = `https://drive.google.com/uc?id=${Id}`;

  //make request to Google Drive
  var Content       = "no-contents";
  var [Lock,Unlock] = new_lock();

  request(Gd_Url,(Err,Gdres,Body)=>{
    Content = Body;
    Unlock();
  });

  await Lock;
  Res.send(Content);
});

Server.listen(process.env.PORT);
//EOF