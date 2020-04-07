import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_pdm/authentication/authentication_provider.dart';
import 'package:proyecto_final_pdm/authentication/bloc/authentication_bloc.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final AuthenticationProvider _auth = AuthenticationProvider();
  bool _isTextHidden = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  String user = '';
  String pw = '';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedSuccessfully) {
            return Profile();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Inicio de sesión"),
              centerTitle: true,
            ),
          key: scaffoldKey,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: _loginBody(),
                  ),
                ),
              ),
            ],
          ),
        );
        },
      );
  }

  Column _loginBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _userTextField(),
        SizedBox(height: 24),
        _passwordTextField(),
        SizedBox(height: 48),
        _loginButton(),
        SizedBox(height: 8),
        _googleButton(),
      ],
    );
  }

  // username
  Widget _userTextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          user = value;
        });
      },
      controller: _usernameController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff94d500),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff94d500),
          ),
        ),
        errorStyle: TextStyle(
          color: Color(0xff94d500),
        ),
        labelText: "Usuario",
        labelStyle: TextStyle(color: Colors.grey[300]),
      ),
      validator: (contenido) {
        if (contenido.isEmpty) {
          return "Ingrese nombre";
        } else {
          return null;
        }
      },
    );
  }

  // password
  Widget _passwordTextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          pw = value;
        });
      },
      controller: _passwordController,
      obscureText: _isTextHidden,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff94d500),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff94d500),
          ),
        ),
        errorStyle: TextStyle(
          color: Color(0xff94d500),
        ),
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.grey[300]),
        suffixIcon: IconButton(
          icon: _isTextHidden
              ? Icon(Icons.visibility_off, color: Colors.grey[300])
              : Icon(Icons.visibility, color: Colors.grey[300]),
          onPressed: () {
            setState(() {
              _isTextHidden = !_isTextHidden;
            });
          },
        ),
      ),
      validator: (contenido) {
        if (contenido.isEmpty) {
          return "Ingrese password";
        } else {
          return null;
        }
      },
    );
  }

  // login button
  Widget _loginButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.grey[200],
                ),
                Expanded(
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ),
              ],
            ),
            onPressed: _login,
          ),
        ),
      ],
    );
  }

  // google button
  Widget _googleButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.grey[200],
                ),
                Expanded(
                  child: Text(
                    "Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ),
              ],
            ),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(LoginWithGoogle());
            },
          ),
        ),
      ],
    );
  }

  _login() async {
    if (_formKey.currentState.validate()) {
      dynamic val = await _auth.signInWithEmailAndPassword(user, pw);
      if(val != null)
        BlocProvider.of<AuthenticationBloc>(context).add(LoginWithEmail(username: user, password: pw));
      else
        scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(
          content: Text("Usuario y/o contraseña inválidos."),
        ),);
    } else {
      scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(
          content: Text("Usuario y/o contraseña inválidos."),
        ),);
    }
  }
}
