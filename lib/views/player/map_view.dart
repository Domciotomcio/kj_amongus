import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset('assets/images/floor1.png')),
            SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset('assets/images/floor2.png'),
            ),
          ],
        ),
      ),
    );
  }
}
