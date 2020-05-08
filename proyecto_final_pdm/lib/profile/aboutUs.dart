import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';

class AboutUs extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final about = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
                      "assets/pichi.png",
                    ),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'El Pichi',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final info = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Somos una empresa dedicada a la venta de alimentos de comida rápida. Contamos con más de 5 años de experiencia en el negocio de la comida rápida, además de ser responsables con el medio ambiente mediante la utlización de materiales reciclables. ',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );


    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.black,
        ]),
      ),
      child: Column(
        children: <Widget>[about, welcome, info, 
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: MaterialButton(
                    child: Text(
                      "REGRESAR",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    },
                    height: 50,
                    minWidth: 370,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10)),
                  ),
        ),],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}