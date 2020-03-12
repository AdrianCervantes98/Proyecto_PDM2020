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
          backgroundImage: NetworkImage(
                      "https://scontent.fgdl5-1.fna.fbcdn.net/v/t1.0-9/80284418_104483557732906_7111122384995745792_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=ANsbVegZ7D0AX96TLtE&_nc_ht=scontent.fgdl5-1.fna&oh=a0fe576bb47911e12449559db8f03e81&oe=5E94C508",
                    ),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'About us.',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final info = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
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
                      "Go Back",
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