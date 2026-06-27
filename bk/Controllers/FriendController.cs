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
	private MySqlConnection _connection;

        public FriendController(IConfiguration config)
        {
            _config = config;
	    _connection = connection();
        }

	private MySqlConnection connection() 
	{
	 string myConnectionString = _config.GetConnectionString("Connection") ?? "server=localhost;uid=root;pwd=caio;database=amigos";

         var connection = new MySqlConnection(myConnectionString);
         connection.Open();
         return connection;
	}


        [HttpGet]
        public ActionResult<List<Friend>> GetAllFriends()
        {	
	  	
	  var sql = "select * from amigos where amigos.birth is not null order by(name)";
	  List<Friend> friends = _connection.Query<Friend>(sql).ToList();
	  return Ok(friends);
        }

	[HttpGet("birthday/")]
	public ActionResult<List<Friend>> getBirthday()
	{
	       var sql = "select * from amigos where amigos.birth is not null and month(birth) = month(now()) and day(birth) >= day(now()) order by(birth)";
	       List<Friend> friends = _connection.Query<Friend>(sql).ToList();
	       return Ok(friends);
	}
    }
}
