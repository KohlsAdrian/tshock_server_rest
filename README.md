# tshock_server_rest

A Dart wrapper for TShock Terraria Servers REST APIs

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
