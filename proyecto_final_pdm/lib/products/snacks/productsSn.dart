import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/comida/item_snack.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';
import 'package:proyecto_final_pdm/products/hamburgers/products.dart';
import 'package:proyecto_final_pdm/products/hotdogs/productshg.dart';
import 'package:proyecto_final_pdm/products/snacks/add_snack/add_snack.dart';
import 'package:proyecto_final_pdm/products/snacks/bloc/snacks_bloc.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

class ProductsSn extends StatefulWidget {
  final List<ProductHamburguesas> hamburguesasList;
  final List<ProductHotdog> hotdogList;
  final List<ProductSnacks> snakcList;
  ProductsSn(
      {Key key,
      @required this.hotdogList,
      @required this.hamburguesasList,
      @required this.snakcList})
      : super(key: key);

  @override
  _ProductsSnState createState() => _ProductsSnState();
}

class _ProductsSnState extends State<ProductsSn> {
  SnacksBloc bloc;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: bloc,
                child: AddSnack(),
              ),
            ),
          );
        },
        label: Text("Agregar"),
        icon: Icon(Icons.add_box),
      ),
      drawer: _drawer(),
      body: BlocProvider(
        create: (context) {
          bloc = SnacksBloc()..add(GetDataEvent());
          return bloc;
        },
        child: BlocListener<SnacksBloc, SnacksState>(
          listener: (context, state) {
            if (state is CloudStoreGetData) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Obteniendo lista de productos..."),
                  ),
                );
            } else if (state is CloudStoreGetDataError) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("${state.errorMessage}"),
                  ),
                );
            } else if (state is CloudStoreSaved) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Se ha guardado el elemento."),
                  ),
                );
            } else if (state is CloudStoreRemoved) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Se ha eliminado el elemento."),
                  ),
                );
            }
          },
          child:
              BlocBuilder<SnacksBloc, SnacksState>(builder: (context, state) {
            if (state is SnacksInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    "Snacks",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.666,
                  child: ListView.builder(
                    itemCount: bloc.getSnacksList.length != null
                        ? bloc.getSnacksList.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemSnack(
                        snacks: bloc.getSnacksList[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "El pichi",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.restaurant),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Products(
                    hamburguesasList: hamburguesasList,
                    hotdogList: hotdogList,
                    snakcList: bloc.getSnacksList,
                  );
                }));
              },
              title: new Text(
                "Hamburguesas",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductsHG(
                      hamburguesasList: hamburguesasList,
                      hotdogList: hotdogList,
                      snackList: bloc.getSnacksList);
                }));
              },
              title: new Text(
                "Hotdogs",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: new Text(
                "Snacks",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),
          ],
        ),
      ),
    );
  }
}
