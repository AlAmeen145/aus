using Microsoft.EntityFrameworkCore;
using P2WebMVC.Data;
using P2WebMVC.Interfaces;
using P2WebMVC.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddDistributedMemoryCache();

// dependency injection
builder.Services.AddSingleton<ITokenService , TokenService>();
builder.Services.AddSingleton<IMailService , EmailService>();
builder.Services.AddScoped<ICloudinaryService, CloudinaryService>();

// service injection 
builder.Services.AddDbContext<SqlDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("main")));

var app = builder.Build();

if (app.Environment.IsProduction())
{
    app.UseHsts();
}

app.UseExceptionHandler("/Error");
app.UseSession();
app.UseHttpsRedirection();
app.UseStaticFiles();   
app.UseRouting();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();