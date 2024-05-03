import 'package:flutter/material.dart';
import 'package:kimchee/home_page/web_socket/webSocket.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, Kimchee'),),
      body: FutureBuilder(
        future: initializeWebSocket(context),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('initiaizing web socket')));
            return CircularProgressIndicator();
          }
          else{
            return Center(
              child: Column(
                children: [
                  Text('result: ${snapshot.data?.ready == true}'),
                  IconButton(
                      onPressed: (){sendCommand(context, snapshot.data!, 'comfy led 26 1');},
                      icon: Icon(Icons.lightbulb_outline_rounded)
                  ),
                  IconButton(
                      onPressed: (){
                        sendCommand(context, snapshot.data!, 'comfy led 26 0');
                        },
                      icon: Icon(Icons.dark_mode)
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
