using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using Firebase.Auth;
using Firebase.Storage;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace Api.Controllers
{
    public class UploadController : BaseApiController
    {
        private static string ApiKey = "AIzaSyDuwWIr_3jGeUwh5f3qswTCxyS852CJRdg";
        private static string Bucket = "pegoda-6de8a.appspot.com";
        private static string AuthEmail = "lehuuhieuak123@gmail.com";
        private static string AuthPassword = "123456";

        private readonly IWebHostEnvironment _webHostEnvironment;
        public UploadController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpPost]
        public async Task<ActionResult> Post(IFormFile file)
        {
            var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));
            var a = await auth.SignInWithEmailAndPasswordAsync(AuthEmail, AuthPassword);

            string fileName = DateTime.Now.Subtract(new DateTime(1970, 1, 1)).TotalMilliseconds + ".jpg";
            var stream = file.OpenReadStream();

            var task = new FirebaseStorage(Bucket, new FirebaseStorageOptions
            {
                AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken),
            })
                .Child("images")
                .Child(fileName)
                .PutAsync(stream);

            try
            {
                string link = await task;
                return Ok(new { urlImage = link });
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

    }
}