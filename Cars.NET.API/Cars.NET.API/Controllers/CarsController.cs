using Cars.NET.API.Model;
using Microsoft.AspNetCore.Mvc;

namespace Cars.NET.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarsController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetHello()
        {
            return Ok("Olá, mundo! Este é o meu primeiro endpoint!");
        }

        [HttpPost("Login")]
        public IActionResult Login([FromBody] LoginModel loginModel)
        {
            // Lógica de autenticação (exemplo)
            if (loginModel.Login == "admin" && loginModel.Password == "pass")
            {
                return Ok("Login bem-sucedido!");
            }

            return Unauthorized("Credenciais inválidas");
        }
    }
}
