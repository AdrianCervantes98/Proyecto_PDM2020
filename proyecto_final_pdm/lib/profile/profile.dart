import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/authentication/bloc/authentication_bloc.dart';
import 'package:proyecto_final_pdm/graphs/graphs.dart';
import 'package:proyecto_final_pdm/mapa/mapa.dart';
import 'package:proyecto_final_pdm/photos/photos.dart';
import 'package:proyecto_final_pdm/products/hamburgers/products.dart';
import 'package:proyecto_final_pdm/profile/aboutUs.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;

import '../login/startup.dart';

class Profile extends StatelessWidget {
  List<Map<String, dynamic>> get datos => [
        {
          "cantidad": 26,
          "producto": "Hamburguesas",
          "descripcion": "Bacon",
          "color": "0xff32a852",
          "altura": 3.5
        },
        {
          "cantidad": 16,
          "producto": "Snacks",
          "descripcion": "Nachos",
          "color": "0xffeb0e49",
          "altura": 0.5
        },
        {
          "cantidad": 6,
          "producto": "Hotdgos",
          "descripcion": "Especial",
          "color": "0xff6532a8",
          "altura": 3.1
        },
      ];
      
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
                  title: Text("Fotos del lugar"),
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
                  onTap: () {
                    Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Graphs(listadoDeDatos: datos,showBarChart: false,)),
              );
                  },
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
