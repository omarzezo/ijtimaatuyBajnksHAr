import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/pie_chart_sections.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/pie_data.dart';

import 'indicators_widget.dart';

class PieChartPage extends StatefulWidget {
  List<DataForPicChart>data;
  PieChartPage(this.data);

  @override
  PieChartPageState createState() => PieChartPageState();
}
class PieChartPageState extends State<PieChartPage>{
// class PieChartPageState extends State {

  int touchedIndex;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (p0, pieTouchResponse) {
                    },
                    // touchCallback: (pieTouchResponse) {
                    //   setState(() {
                    //     if (pieTouchResponse.touchInput is FlLongPressEnd ||
                    //         pieTouchResponse.touchInput is FlPanEnd) {
                    //       touchedIndex = -1;
                    //     } else {
                    //       touchedIndex = pieTouchResponse.touchedSectionIndex;
                    //     }
                    //   });
                    // },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(widget.data,touchedIndex),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.data
                        .map(
                          (data) => Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: buildIndicator(
                            color: data.color,
                            text: data.name,
                            // isSquare: true,
                          )),
                    )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
