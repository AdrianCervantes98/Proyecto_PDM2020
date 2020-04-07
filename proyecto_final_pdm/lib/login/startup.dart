import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/login/login.dart';

class Startup extends StatelessWidget {
  const Startup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  "https://www.iteso.mx/documents/27014/202031/Logo-ITESO-MinimoV.png",
                ),
              ],
            ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "INICIAR SESIÓN",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  },
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width*0.8,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
