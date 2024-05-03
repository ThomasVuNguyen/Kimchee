import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

Future<WebSocketChannel?> initializeWebSocket(BuildContext context) async {

  final wsUrl = Uri.parse('ws://192.168.1.7:5000/echo');
  final channel = WebSocketChannel.connect(
      wsUrl,
  );
  try{
    await channel.ready;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('socket connection success')));
    return channel;

  } catch (e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('socket connection failed')));
    print('error connecting to websocket');
  }
}

void sendCommand(BuildContext context, WebSocketChannel channel, String command){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('sending commnand')));
  try{
    channel.sink.add(command);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('command sent')));
  } catch (e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('command not sent')));
  }

}