import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('En Yakındaki Hizmetler'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Hakkında'),
                    content: Text('Created by Mehmet Kesimalioğlu'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Kapat'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          serviceButton('AVM', Icons.shopping_cart, 'avm', Colors.blue),
          serviceButton('Ambulans', Icons.local_hospital, '112', Colors.red),
          serviceButton('İtfaiye', Icons.local_fire_department, '110', Colors.orange),
          serviceButton('Polis', Icons.local_police, '155', Colors.green),
          serviceButton('Eczane', Icons.medical_services, 'eczaneler', Colors.purple),
          serviceButton('Veteriner', Icons.pets, 'veteriner', Colors.brown),
          serviceButton('Benzin İstasyonu', Icons.local_gas_station, 'benzin+istasyonu', Colors.grey),
          serviceButton('Restorantlar', Icons.restaurant, 'restorantlar', Colors.yellow),
        ],
      ),
    );
  }

  Widget serviceButton(String label, IconData icon, String query, Color color) {
    return ElevatedButton(
      onPressed: () {
        openMaps(query);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 50.0), // You can adjust the size of the icon here.
          Text(label),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color, // This changes the color of the button
        onPrimary: Colors.white, // This changes the color of the icon and text
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // This gives the button rounded corners.
        ),
      ),
    );
  }

  void openMaps(String query) {
    final AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull('geo:0,0?q=$query'),
      package: 'com.google.android.apps.maps',
    );
    intent.launch();
  }
}
