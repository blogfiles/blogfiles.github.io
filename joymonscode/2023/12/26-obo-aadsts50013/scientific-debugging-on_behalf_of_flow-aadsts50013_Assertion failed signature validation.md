# Status - Closed
# Overview
- Reported on - 2023-12-18
- Last updated on - 2023-12-26
- Environment - All
- Investigators
  - Joy George Kunjikkuru

# Description

"AADSTS50013: Assertion failed signature validation" error reported when trying to obtain an on behalf of token from Microsoft Entra.

Below is the design trying to achive.

[![](https://github.com/blogfiles/blogfiles.github.io/blob/master/joymonscode/2023/12/26-obo-aadsts50013/01-cookie.png?raw=true)](https://github.com/blogfiles/blogfiles.github.io/blob/master/joymonscode/2023/12/26-obo-aadsts50013/01-cookie.png?raw=true)

The middle tier API specs are below.
- Using .Net 6
- Hosted in Azure App Service (Linux)
- Uses EasyAuth to protect
- Reads the access token that is given by EasyAuth via header

# Reproduction steps

1. Get the access token from the header "X-MS-TOKEN-AAD-ACCESS-TOKEN"
2. Using the access token obtain the on behalf of token with the help of [OnBehalfOfCredential](https://learn.microsoft.com/en-us/dotnet/api/azure.identity.onbehalfofcredential?view=azure-dotnet) class and [GetTokenAsync](https://learn.microsoft.com/en-us/dotnet/api/azure.identity.onbehalfofcredential.gettokenasync?view=azure-dotnet)

## Expected Result
The method GetTokenAsync return the JWT
## Actual Result

Exception MsalUiRequierdException with below message
"OnBehalfOfCredential authentication failed: AADSTS50013: Assertion failed signature validation. [Reason - Key was found, but use of the key to verify the signature failed., Thumbprint of key used by client: 'E41DE<cert thumbprint>D91', Found key 'Start=12/05/2023 17:16:57, End=12/05/2028 17:16:57', Please visit the Azure Portal, Graph Explorer or directly use MS Graph to see configured keys for app Id '00000000-0000-0000-0000-000000000000'. Review the documentation at https://docs.microsoft.com/en-us/graph/deployments to determine the corresponding service endpoint and https://docs.microsoft.com/en-us/graph/api/application-get?view=graph-rest-1.0&tabs=http to build a query request URL, such as 'https://graph.microsoft.com/beta/applications/00000000-0000-0000-0000-000000000000']. Trace ID: <guid> Correlation ID: <guid> Timestamp: 2023-12-22 16:15:05Z

# Observations
There is no certificate we are using with the thumbprint in the error. We use secret while obtaining the OBO token.
  
# Workaround
n/a
# Debugging

|Hypothesis| Prediction | Experiment | Results | Conclusion |
|---|:---|:---|:---|:---|
|The permissions are wrong|It should not work outside of .Net| Postman to get first and OBO token |Postman worked| Rejected as permissions are correct|
|The cookie from browser is traslated wrong by EasyAuth before setting to "X-MS-TOKEN-AAD-ACCESS-TOKEN" header |If we use JWT from client side, it should work|Postman to sent JWT in Authorization header|Failed| Cookie / JWT is same|
| The "X-MS-TOKEN-AAD-ACCESS-TOKEN" header set by EasyAuth is different than the bearer token in "Authorization|If we use bearer token it will work|Read Authorization header and extrack bearer token and use it for OBO|Worked|Easy auth is setting wrong token on ""X-MS-TOKEN-AAD-ACCESS-TOKEN"|


# Root cause
"X-MS-TOKEN-AAD-ACCESS-TOKEN" set by Easy auth is not the bearer token we sent from client side. Also the audient of "X-MS-TOKEN-AAD-ACCESS-TOKEN" is to Graph not to our middle tier API.

# Solution
  - Middle tier API to read token from Authorization header and cut the 'bearer ' from it to be used for OBO.
  - Since we need to send bearer token from client side, we cannot use OBO auth when the request is authenticated using Cookie.

Below goes the new design

[![](https://github.com/blogfiles/blogfiles.github.io/blob/master/joymonscode/2023/12/26-obo-aadsts50013/05-jwt-authorization-header.png?raw=true)](https://github.com/blogfiles/blogfiles.github.io/blob/master/joymonscode/2023/12/26-obo-aadsts50013/05-jwt-authorization-header.png?raw=true)

Or do not depend on EasyAuth provided by App Service and setup authentication ourselves.

# Next steps

- Change client side code to use JWT while making API calls
- Change middle tier to read the JWT from 'Authorization' header than from EasyAuth provided "X-MS-TOKEN-AAD-ACCESS-TOKEN"


# References
- [Using Postman for full OBO flow](https://learn.microsoft.com/en-us/answers/questions/1162541/middle-tier-access-token-request-and-getting-the-i)
- [OAuth tokens provided by EasyAuth](https://learn.microsoft.com/en-us/azure/app-service/configure-authentication-oauth-tokens#retrieve-tokens-in-app-code)
- https://learn.microsoft.com/en-us/graph/auth-v2-user?tabs=http
