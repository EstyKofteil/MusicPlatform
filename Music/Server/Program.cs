using BL.BlApi;
using BL.BlImplementaion;

using Microsoft.EntityFrameworkCore;
using DAL;
using Dal.DalApi;
using Dal.Do;
using Dal;
using Microsoft.Extensions.DependencyInjection.Extensions;
using DAL.DalImplementation;
using Dal.Dalimplementaion;
//using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
DBActions db = new DBActions(builder.Configuration);
string connStr = db.GetConnectionString("MusicDB");
builder.Services.AddDbContext<MusicContext>(opt => opt.UseSqlServer(connStr));
builder.Services.AddScoped<ISongRepoDal, SongRepo>();
builder.Services.AddScoped<ISongRepoBl, SongServiceBl>();
builder.Services.AddScoped<ISingerRepoDal,SingerRepo>();
builder.Services.AddScoped<ISingerRepoBl, SingerServiceBl>();
var app = builder.Build();
app.MapGet("/", () => "Hello World!");
app.MapControllers();
app.Run();

//var builder = WebApplication.CreateBuilder(args);
//builder.Services.AddControllers();
//builder.Services.AddScoped<ISongRepoBl,SongServiceBl>();
//var app = builder.Build();
//app.MapGet("/", () => "Hello World!");
//app.MapControllers();
//app.Run();


//var builder = WebApplication.CreateBuilder(args);
//builder.Services.AddControllers();
//builder.Services.AddScoped<IclinicRepo, ClinicRepo>();
////string connString=builder.Configuration.GetConnectionString("ClinicContext")
//DBActions db = new DBActions(builder.Configuration);
//string connstr = db.GetConnectionString("ClinicContext");
//builder.Services.AddDbContext<ClinicContext>(opt => opt.UseSqlServer(connstr));
//var app = builder.Build();
//app.MapGet("/", () => "Hello World!");
//app.MapControllers();
//app.Run();
