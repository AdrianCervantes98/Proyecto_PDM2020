import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graphs extends StatefulWidget {
  final List<Map<String, dynamic>> listadoDeDatos;
  final bool showBarChart;
  Graphs({
    Key key,
    @required this.listadoDeDatos,
    @required this.showBarChart,
  }) : super(key: key);

  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    var _colors =
        charts.MaterialPalette.getOrderedPalettes(widget.listadoDeDatos.length);
    return Scaffold(
      appBar: AppBar(
        title: new Text("Estadísticas"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 400,
         child: _simple(_colors),
        ),
      ),
    );
  }

  Widget _simple(dynamic _colors) {
    var _chartElements = List<charts.Series<_ChartObject, String>>();
    var chartData = widget.listadoDeDatos
        .map(
          (item) => _ChartObject(
            xAxis: item["producto"],
            yAxis: item["cantidad"],
          ),
        )
        .toList();

    _chartElements.add(
      charts.Series<_ChartObject, String>(
        id: "Grafica132",
        data: chartData,
        measureFn: (object, index) => object.yAxis,
        domainFn: (object, index) => object.xAxis,
        colorFn: (object, index) => _colors[index].shadeDefault,
        labelAccessorFn: (object, index) => "${object.xAxis} : ${object.yAxis}",
      ),
    );

    if (widget.showBarChart) {
      return charts.BarChart(
        _chartElements,
        animate: true,
        behaviors: [
          charts.ChartTitle("Productos"),
          charts.DatumLegend(desiredMaxRows: 2),
        ],
      );
    } else {
      return charts.PieChart(
        _chartElements,
        animate: true,
        behaviors: [
          charts.ChartTitle("Venta de productos"),
          charts.DatumLegend(
            desiredMaxRows: 2,
            position: charts.BehaviorPosition.bottom,
          ),
        ],
        defaultRenderer: charts.ArcRendererConfig(
          arcRatio: 0.6,
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto,
            ),
          ],
        ),
      );
    }
  }
}

class _ChartObject {
  final String xAxis;
  final int yAxis;

  _ChartObject({@required this.xAxis, @required this.yAxis});
}