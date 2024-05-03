import 'package:flutter/material.dart';
import 'package:kimchee/home_page/web_socket/webSocket.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, Kimchee'),),
      body: FutureBuilder(
        future: initializeWebSocket(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return CircularProgressIndicator();
          }
          else{
            return Center(
              child: Column(
                children: [
                  IconButton(
                      onPressed: (){sendCommand(snapshot.data!, 'comfy led 26 1');},
                      icon: Icon(Icons.lightbulb_outline_rounded)
                  ),
                  IconButton(
                      onPressed: (){sendCommand(snapshot.data!, 'comfy led 26 0');},
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
