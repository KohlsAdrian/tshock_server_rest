# tshock_server_rest

A Dart wrapper for TShock Terraria Servers REST APIs

<details>
    <summary>App Client</summary>

[![](https://github.com/KohlsAdrian/tshock_server_rest_client/raw/master/sss/tshock_server_header.png)](https://github.com/KohlsAdrian/tshock_server_rest_client)
 
[Google Play App Client](https://play.google.com/store/apps/details?id=br.com.adriankohls.tshock_server_rest_client)

</details>

## Getting Started

    TShockServerRESTServer tssr = TShockServerRESTServer.instance;
    
    tssr.init(
      '127.0.0.1',      // server address
      7878,             // server rest api port
      token,            // token created from reast api
      isHttps: false,   // if the address has certificate protocol
    );
    
    /// Checks server status
    TShockServerStatus status = await tssr.status();
    
    /// retrive all users from the server
    final users = await tssr.users.getAllUsers();
    
## Structure

TShockServerRESTServer has contexts of functionalities

  * Users
  
  * Bans
  
  * Players
  
  * World
  
  * Groups
  
Each context has it own REST API functions

  TShockServerStatus.instance.(context).MyFunctions();
  
Geral context is just

  TShockServerStatus.instance.MyFunctions();
