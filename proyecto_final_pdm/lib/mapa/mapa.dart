import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

CameraPosition _initialPosition = CameraPosition(target: LatLng(10, 30.8025));
Completer<GoogleMapController> _controller = Completer();

void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

final double _zoom = 10;
final Set<Marker> _markers = Set();


class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicación'),
          centerTitle: true,
        ),
        drawer: _drawer(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: _initialPosition,
            ),
          ],
        ));
  }

  Widget _drawer() {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("xyz"),
            accountEmail: Text("xyz@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("xyz"),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("abc"),
              )
            ],
          ),
          ListTile(
            title: new Text("Ubicación"),
            leading: new Icon(Icons.flight),
          ),
          Divider(),
          ListTile(
            onTap: () {
              _goToPichi();
              Navigator.of(context).pop();
            },
            title: new Text("El pichi"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPichi() async {
  double lat = 21.034598;
  double long = -104.371707;
  GoogleMapController controller = await _controller.future;
  controller
      .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
      setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('pichi'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'El pichi', snippet: 'Morelos #143 pte.'),
        ),
      );
    });
}

}


