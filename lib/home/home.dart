import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   String userlatitude = '';
  String userlongitude = '';

  Future <Position> determinePosition () async {
   LocationPermission permission;
   permission = await Geolocator.checkPermission();
   if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      return Future.error('error');
    }
   }
   return await Geolocator.getCurrentPosition();
  }

  void getCurrentPosition () async {
    Position position  = await determinePosition();
      userlatitude = position.latitude.toString();
      userlongitude = position.longitude.toString();
       print(userlatitude);
    print(userlongitude);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
        centerTitle: true,
        
      ),
      //backgroundColor: Colors.blueAccent,
      body: Center(
        child: ElevatedButton(onPressed: () {
          getCurrentPosition();
        }, child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Latitude: $userlatitude"),
              Text("Longitude: $userlongitude"),
              
            ],
          ),
        )),
      ),
    );
  }
}
