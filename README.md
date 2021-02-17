# tshock_server_rest

A Dart wrapper for TShock Terraria Servers REST APIs

## [App Client](https://github.com/KohlsAdrian/tshock_server_rest_client)

<details>
<summary>App Client Screenshots</summary>
    
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.09.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.12.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.16.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.18.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.23.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.26.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.28.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.33.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.36.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.38.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.43.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.52.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.41.58.png)
   ![](https://github.com/KohlsAdrian/tshock_server_rest_client/blob/master/sss/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202021-02-17%20at%2014.42.00.png)
    
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
