import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _businessController = TextEditingController();
  final _bankController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatpwController = TextEditingController();
  String _giro;
  String _bank;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://www.iteso.mx/documents/27014/202031/Logo-ITESO-MinimoV.png"),
            Container(
              width: 370,
              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Snacks'),
                    value: 'snacks',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Comida mexicana'),
                    value: 'mexicana',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Pizza'),
                    value: 'pizza',
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    _giro = value;
                  });
                },
                hint: Text('Giro del restaurante'),
                value: _giro,
              ),
            ),
            Container(
              height: 40,
              width: 370,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Correo electrónico',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 370,
              child: TextField(
                controller: _telephoneController,
                decoration: InputDecoration(
                  hintText: 'Número de teléfono',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 370,
              child: TextField(
                controller: _businessController,
                decoration: InputDecoration(
                  hintText: 'Nombre del negocio',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 370,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              width: 370,
              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Santander'),
                    value: 'santander',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('BBVA'),
                    value: 'bbva',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Banorte'),
                    value: 'banorte',
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    _bank = value;
                  });
                },
                hint: Text('Banco'),
                value: _bank,
              ),
            ),
            Container(
              height: 40,
              width: 370,
              child: TextField(
                controller: _bankController,
                decoration: InputDecoration(
                  hintText: 'Cuenta de banco',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              width: 370,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
              ),
            ),
            Container(
              width: 370,
              child: TextField(
                controller: _repeatpwController,
                decoration: InputDecoration(
                  hintText: 'Repetir contraseña',
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
