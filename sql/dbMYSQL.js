

module.exports = function(con){

  con.connect((error)=>{
    if (error) throw error;
    console.log("dbconnect\n");

  });
  
}
