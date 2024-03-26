import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text = 'Stop Service';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
/*
            ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke('setAsForeground');
            }, child: Text('Forground Service')),
            ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke('setAsBackground');
            }, child: Text('Background Service')),
*/
            ElevatedButton(onPressed: () async{
              final service = FlutterBackgroundService();
              bool isRuning = await service.isRunning();
              if(isRuning){
                service.invoke('stopService');
                text = 'Start Service';
              }else{
                service.startService();
                text = 'Stop Service';
              }
              setState(() {});
            }, child: Text('$text')),
          ],
        ),
      ),
    );
  }
}
