import 'package:flutter/material.dart';
import 'package:itimaaty/Models/favourite_response_model.dart';
import 'package:itimaaty/Models/libary_response_model.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:intl/intl.dart';

class SharedWithMeScreen extends StatefulWidget {
  List<FavouriteResponseModel> favList;
  SharedWithMeScreen(this.favList);

  @override
  SharedWithMeScreenState createState() => SharedWithMeScreenState();
}

class SharedWithMeScreenState extends State<SharedWithMeScreen> {
  int sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
  }

  String getFormattedDateNew(DateTime day) {
    String formattedDate1 = DateFormat('kk:mm a','en').format(day);
    String formattedDate =
        getDoubleDigit(day.day.toString()) + " " +
            getDoubleDigit(monthNames[day.month-1]) + " " +
            getDoubleDigit(day.year.toString())+" "+formattedDate1
    ;
    return formattedDate;
  }

  DateTime stringToDateTimeNew(String dateString){
    final DateFormat format = new DateFormat('yyyy-MM-ddTkk:mm','en');
    // String formattedDate = format.parse(dateString);
    print("format"+format.toString());
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-ddTkk:mm','en').format(dateTime);
    print("formattedDate"+formattedDate.toString());
    return dateTime;
  }

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
              color: Color(0xffFAFAFB),
              margin: EdgeInsets.only(top: 14),
              child: buildDataTable()),
        ),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Owner', 'Last Modified','File Size'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      dataRowHeight: 60,
      // horizontalMargin: 60,

      rows: getRows(widget.favList),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    label: Container(
        width: MediaQuery.of(context).size.width/4-100,
        margin: EdgeInsets.only(bottom: 10,top: 10),
        child: Text(column,style: blueColorBoldStyle(20),)),
    // onSort: onSort,
  ))
      .toList();

  List<DataRow> getRows(List<FavouriteResponseModel> users){
    List<DataRow> datsList=[];

    users.forEach((json) async {
      print(json);
      datsList.add(DataRow(cells: getCells(json)));
    });
    return datsList;
  }


  List<DataCell> getCells(FavouriteResponseModel cells) {
    List<DataCell>dtsList = [];
    String icon = '';
    if(cells.type=="file"){
      if (cells.file.name.contains('pdf')) {
        icon = "assets/images/ic_pdf.png";
      } else if (cells.file.name.contains('docx')) {
        icon = "assets/images/ic_word.png";
      } else if (cells.file.name.contains('pot')) {
        icon = "assets/images/ic_power_point.png";
      } else {
        icon = "assets/images/ic_folder.png";
      }
    }else{
      if (cells.dir.name.contains('pdf')) {
        icon = "assets/images/ic_pdf.png";
      } else if (cells.dir.name.contains('docx')) {
        icon = "assets/images/ic_word.png";
      } else if (cells.dir.name.contains('pot')) {
        icon = "assets/images/ic_power_point.png";
      } else {
        icon = "assets/images/ic_folder.png";
      }
    }
    if(cells.type=="file"){
      dtsList.add(DataCell(Row(
        // mainAxisAlignment: MainAxisAlignment.,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,width: 31,height: 36,fit: BoxFit.fill,),
          const SizedBox(width: 8,),
          Text('${cells.file.name}',style: blueColorStyleMedium(20)),
        ],
      )));
      dtsList.add(DataCell(Text('You',style: blueColorStyleMedium(20))));
      dtsList.add(DataCell(Text(getFormattedDateNew(stringToDateTimeNew(cells.file.createdAt)),style: blueColorStyleregular(20))));
      dtsList.add(DataCell(Text('${cells.file.size}',style: blueColorStyleregular(20),)));

    }else{
      dtsList.add(DataCell(Row(
        // mainAxisAlignment: MainAxisAlignment.,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,width: 31,height: 36,fit: BoxFit.fill,),
          const SizedBox(width: 8,),
          Text('${cells.dir.name}',style: blueColorStyleMedium(20)),
        ],
      )));
      dtsList.add(DataCell(Text('You',style: blueColorStyleMedium(20))));
      dtsList.add(DataCell(Text(getFormattedDateNew(stringToDateTimeNew(cells.dir.createdAt)),style: blueColorStyleregular(20))));
      dtsList.add(DataCell(Text('--',style: blueColorStyleregular(20),)));
    }


    return dtsList;
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

