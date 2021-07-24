using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanSach.Models
{
    public class PaypalConfiguration
    {
        public readonly static string ClientId;
        public readonly static string ClientSecret;
        static PaypalConfiguration()
        {
            var config = GetConfig();
            //ClientId = config["clientId"];
            //ClientSecret = config["clientSecret"];
            ClientId = "AffvaipnP0ZfQuG9Y-i6RpFK_GyJbaYF5SkUBfQiJ6wBPJ_vIDTDect1llKNlB8ELniMHnasL114ScF4";
            ClientSecret = "ECn-7KODZlkt4Ku45JmXsBAWDf5mAezoE_xaczp8vz8_iUZfOWh3cSxEqrFPreECCsbw30vQyQ4-n7aH";

        }

        public static Dictionary<string, string> GetConfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }

        private static string GetAccessToken()
        {
            string accessToken = new OAuthTokenCredential(ClientId, ClientSecret, GetConfig()).GetAccessToken();
            return accessToken;
        }

        public static APIContext GetAPIContext()
        {
            var apiContext = new APIContext(GetAccessToken());
            apiContext.Config = GetConfig();
            return apiContext;
        }
    }
}