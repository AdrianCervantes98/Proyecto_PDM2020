import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/authentication/bloc/authentication_bloc.dart';
import 'package:proyecto_final_pdm/mapa/mapa.dart';
import 'package:proyecto_final_pdm/photos/photos.dart';
import 'package:proyecto_final_pdm/products/hamburgers/products.dart';
import 'package:proyecto_final_pdm/profile/aboutUs.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

import '../login/startup.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 130,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/pichi.png",
                    ),
                    minRadius: 33,
                    maxRadius: 73,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "El pichi",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("elpichi@gmail.com"),
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  title: Text("Información"),
                  leading: Icon(Icons.info),
                  onTap: () {
                    Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AboutUs();
                      }));
                  },
                ),
                ListTile(
                  title: Text("Productos"),
                  leading: Icon(Icons.bookmark),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Products(
                        hamburguesasList: hamburguesasList,
                        hotdogList: hotdogList,
                        snakcList: snackList,
                      );
                    }));
                  },
                ),
                ListTile(
                  title: Text("Fotos"),
                  leading: Icon(Icons.photo_camera),
                  onTap: () {
                    Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Photos();
                      }));
                  },
                ),
                ListTile(
                  title: Text("Ubicación"),
                  leading: Icon(Icons.map),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Mapa();
                    }));
                  },
                ),
                ListTile(
                  title: Text("Estadísticas"),
                  leading: Icon(Icons.monetization_on),
                  onTap: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 38,
                    minWidth: 370,
                    color: Colors.grey[300],
                    child: Text("Cerrar sesión"),
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                        .add(LogOut());
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Startup();
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
