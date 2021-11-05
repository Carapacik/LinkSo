using Application.Tools.Common;

namespace Application.Tools.Jwt
{
    public class JwtSettings
    {
        public const string Name = "JwtSettings";

        public string SecurityKey { get; init; }

        public string ValidIssuer => CommonSettings?.BackendAddress;

        public string ValidAudience { get; init; }

        public int ExpiryInMinutes { get; init; }

        public void SetCommonSettings(CommonSettings commonSettings)
        {
            CommonSettings = commonSettings;
        }
        private CommonSettings CommonSettings { get; set; }
    }
}