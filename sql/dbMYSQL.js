

module.exports = function(db){

  db.connect((error)=>{
    if (error) throw error;
    console.log("dbconnect\n");

  });
  
}
