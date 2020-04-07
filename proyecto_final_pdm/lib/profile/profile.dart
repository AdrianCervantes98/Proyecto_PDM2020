import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/authentication/bloc/authentication_bloc.dart';
import 'package:proyecto_final_pdm/mapa/mapa.dart';
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
                    backgroundImage: NetworkImage(
                      "https://scontent.fgdl5-1.fna.fbcdn.net/v/t1.0-9/80284418_104483557732906_7111122384995745792_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=ANsbVegZ7D0AX96TLtE&_nc_ht=scontent.fgdl5-1.fna&oh=a0fe576bb47911e12449559db8f03e81&oe=5E94C508",
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
                Text("elpichi@outlookcom"),
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
                  onTap: () {},
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
                  title: Text("Pedidos"),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {},
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
