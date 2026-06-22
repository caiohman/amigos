using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Dapper;

namespace bk.Controllers
{
    [ApiController]
    [Route("/")]
    public class FriendController : ControllerBase
    {
        private readonly IConfiguration _config;

        public FriendController(IConfiguration config)
        {
            _config = config; 	    
        }


        [HttpGet]
        public ActionResult<List<Friend>> GetAllFriends()
        {
	    string myConnectionString = _config.GetConnectionString("Connection") ?? "server=localhost;uid=root;pwd=caio;database=amigos";

	    try{
	       var connection = new MySqlConnection(myConnectionString);
	       connection.Open();
	       var sql = "select * from amigos limit 10";
	       List<Friend> friends = connection.Query<Friend>(sql).ToList();
      	       connection.Close();
	       return Ok(friends);


	    }
	    catch (MySqlException ex)
	    {
	        Console.WriteLine(ex);	
	        return NotFound();
	    }	
        }
    }
}
