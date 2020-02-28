import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Usuario y/o contraseña incorrectos."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
                child: Row(
                  children: <Widget>[
                    Text("Usuario o correo electrónico:",
                        style: Theme.of(context).textTheme.body2),
                  ],
                ),
              ),
              Container(
                width: 370,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'John Doe',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Contraseña:",
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
              Container(
                width: 370,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        "ENTRAR",
                        style: Theme.of(context).textTheme.body1,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return Profile();
                        }));
                      },
                      height: 50,
                      minWidth: 370,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("¿Olvidaste tu password?",
                      style: Theme.of(context).textTheme.body2),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("¿Aún no tienes una cuenta?",
                        style: Theme.of(context).textTheme.body2),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    child: Text("REGÍSTRATE",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
