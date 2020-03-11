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
      child: Container(
        child: new ListView(

          children: <Widget>[
            new UserAccountsDrawerHeader(
            accountName: Text("",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
            "https://scontent.fgdl5-1.fna.fbcdn.net/v/t1.0-9/80284418_104483557732906_7111122384995745792_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=ANsbVegZ7D0AX96TLtE&_nc_ht=scontent.fgdl5-1.fna&oh=a0fe576bb47911e12449559db8f03e81&oe=5E94C508"
            ),
                    fit: BoxFit.cover)),
            ),
            Divider(),
            ListTile(
              onTap: () {
                _goToPichi();
                Navigator.of(context).pop();
              },
              title: new Text("El pichi",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              trailing: new Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
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


