﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace Assignment06
{
    public class GetData
    {
        public static async Task<DataModel> LoadData()
        {
            //ApiHelper apiHelper = new ApiHelper();

            string url = "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/cheaptrixxx?api_key=RGAPI-70055004-e669-4832-8e90-c1adbda8a7be";

            using (HttpResponseMessage response = await ApiHelper.Client.GetAsync(url))
            {
                if (response.IsSuccessStatusCode)
                {
                    DataModel data = await response.Content.ReadAsAsync<DataModel>();
                    return data;
                }
                else
                {
                    throw new Exception(response.ReasonPhrase);
                }
            }
        }
    }
}