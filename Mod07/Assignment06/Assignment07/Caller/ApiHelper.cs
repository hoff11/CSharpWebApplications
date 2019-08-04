using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Assignment07
{
    public class ApiHelper
    {
        public static HttpClient Client { get; set; } 

        public void InitializeClient()
        {
            Client = new HttpClient();
            //Client.BaseAddress = new Uri("https://na1.api.riotgames.com");
            Client.DefaultRequestHeaders.Accept.Clear();
            Client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        }

    }
}