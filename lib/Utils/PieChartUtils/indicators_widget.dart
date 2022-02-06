import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/Utils/PieChartUtils/pie_data.dart';
import 'package:itimaaty/View/FontsStyle.dart';

class IndicatorsWidget extends StatefulWidget {
  List<DataForPicChart>data;
  IndicatorsWidget(this.data);

  @override
  IndicatorsWidgetState createState() => IndicatorsWidgetState();
}

class IndicatorsWidgetState extends State<IndicatorsWidget> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: widget.data
        .map((data) => Container(
      margin: EdgeInsets.only(bottom: 5,top: 5),
          // padding: EdgeInsets.symmetric(vertical: 2),
          child: buildIndicator(
            color: data.color,
            text: data.name,
            percent: data.percent
            // isSquare: true,
          )),
    )
        .toList(),
  );

  Widget buildIndicator({
    @required Color color,
    @required String text,
    @required double percent,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                  color: color,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  text,
                  style: blueColorStyleMedium(16),
                ),
              )
            ],
          ),
          Text(percent.toString() +" % ",style: blueColorStyleMedium(16),)
        ],
      );
}


Widget buildIndicator({
  @required Color color,
  @required String text,
  bool isSquare = false,
  double size = 16,
  Color textColor = const Color(0xff505050),
}) =>
    Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
