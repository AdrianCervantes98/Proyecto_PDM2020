import 'package:flutter/material.dart';

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
                      "https://scontent-dfw5-1.xx.fbcdn.net/v/t1.0-9/12140561_1639793912940425_1492637472149929856_n.jpg?_nc_cat=111&_nc_sid=174925&_nc_ohc=Yh48JErR8TkAX_tW82u&_nc_ht=scontent-dfw5-1.xx&oh=e258120ddc2b675bcadbd8f6296e06ee&oe=5EFB4792",
                    ),
                    minRadius: 33,
                    maxRadius: 73,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Isaac Cabrera",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("isaac21@jaja.com"),
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  title: Text("Información"),
                  leading: Icon(Icons.favorite),
                  onTap: () {
                    
                  },
                ),
                ListTile(
                  title: Text("Productos"),
                  leading: Icon(Icons.bookmark),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Fotos"),
                  leading: Icon(Icons.photo_camera),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Ubicación"),
                  leading: Icon(Icons.map),
                  onTap: () {},
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return Startup();
                        }));
                      },
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
