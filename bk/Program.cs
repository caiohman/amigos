var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () =>  
{
    var people = new [] { 
        new { Name = "Caio Ohman"},
        new { Name = "Gael Gaudencio"}
    };
    return Results.Json(people);
});

app.Run("http://+:8081");
