import 'package:flutter/material.dart';
import 'package:itimaaty/Models/libary_response_model.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:intl/intl.dart';

class LibraryScreen extends StatefulWidget {
  List<LibaryDirs> libraryDirs;
  List<LibaryFiles> libraryFiles;
  LibraryScreen(this.libraryDirs,this.libraryFiles);

  @override
  LibraryScreenState createState() => LibraryScreenState();
}

class LibraryScreenState extends State<LibraryScreen> {
  int sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    // this.users = List.of(allUsers);
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
    // print("format"+format.toString());
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-ddTkk:mm','en').format(dateTime);
    // print("formattedDate"+formattedDate.toString());
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

      rows: getRows(widget.libraryDirs,widget.libraryFiles),
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


  // List<DataRow> getRows(List<LibaryDirs> users) => users.map((LibaryDirs user) {
  //   return DataRow(cells: getCells(user));
  // }).toList();

  List<DataRow> getRows(List<LibaryDirs> users,List<LibaryFiles> files){
    List<DataRow> datsList=[];
    users.forEach((json) async {
      print(json);
      datsList.add(DataRow(cells: getCells(json)));
    });

    files.forEach((json) async {
      print(json);
      datsList.add(DataRow(cells: getCellsForFiles(json)));
    });
    // for (var user in users) {
    //   datsList.add(DataRow(cells: getCells(user)));
    // }
    return datsList;
  }


  List<DataCell> getCells(LibaryDirs cells) {
    List<DataCell>dtsList=[];
    String icon='';
    if(cells.name.contains('pdf')){
      icon="assets/images/ic_pdf.png";
    }else if(cells.name.contains('docx')){
      icon="assets/images/ic_word.png";
    }else if(cells.name.contains('pot')){
      icon="assets/images/ic_power_point.png";
    }else{
      icon="assets/images/ic_folder.png";
    }
      dtsList.add(DataCell(Row(
        // mainAxisAlignment: MainAxisAlignment.,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,width: 31,height: 36,fit: BoxFit.fill,),
          const SizedBox(width: 8,),
          Text('${cells.name}',style: blueColorStyleMedium(20)),
        ],
      )));
      dtsList.add(DataCell(Text('You',style: blueColorStyleMedium(20))));
      dtsList.add(DataCell(Text(getFormattedDateNew(stringToDateTimeNew(cells.createdAt)),style: blueColorStyleregular(20))));
      dtsList.add(DataCell(Text("---",style: blueColorStyleregular(20),)));


    return dtsList;
  }
  List<DataCell> getCellsForFiles(LibaryFiles files) {
    List<DataCell>dtsList=[];
    String icon='';
    if(files.name.contains('pdf')){
      icon="assets/images/ic_pdf.png";
    }else if(files.name.contains('docx')||files.name.contains('doc')){
      icon="assets/images/ic_word.png";
    }else if(files.name.contains('pot')){
      icon="assets/images/ic_power_point.png";
    }else{
      icon="assets/images/ic_folder.png";
    }
    dtsList.add(DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon,width: 31,height: 36,fit: BoxFit.fill,),
        const SizedBox(width: 12,),
        Text('${files.name}',style: blueColorStyleMedium(20)),
      ],
    )));
    dtsList.add(DataCell(Text('You',style: blueColorStyleMedium(20))));
    dtsList.add(DataCell(Text(getFormattedDateNew(stringToDateTimeNew(files.createdAt)),style: blueColorStyleregular(20))));
    dtsList.add(DataCell(Text(files.size!=null?files.size:"",style: blueColorStyleregular(20),)));

    return dtsList;
  }
  // void onSort(int columnIndex, bool ascending) {
  //   if (columnIndex == 0) {
  //     users.sort((user1, user2) =>
  //         compareString(ascending, user1.firstName, user2.firstName));
  //   } else if (columnIndex == 1) {
  //     users.sort((user1, user2) =>
  //         compareString(ascending, user1.lastName, user2.lastName));
  //   } else if (columnIndex == 2) {
  //     users.sort((user1, user2) =>
  //         compareString(ascending, '${user1.age}', '${user2.age}'));
  //   }
  //
  //   setState(() {
  //     this.sortColumnIndex = columnIndex;
  //     this.isAscending = ascending;
  //   });
  // }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
