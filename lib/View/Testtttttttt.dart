import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/my_library_response_model.dart';
import 'package:itimaatysoharsohar/Repository/LibraryRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/Widgets/MyExpanation.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'DrawerWidget.dart';
import 'FontsStyle.dart';

class BasicTilePage2 extends StatefulWidget {
  @override
  BasicTilePageTest createState() => BasicTilePageTest();

}


class BasicTilePageTest extends State<BasicTilePage2> {

  LibraryRepository libraryRepository;
  MyLibraryResponseModel libaryResponseModel =new MyLibraryResponseModel();
  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  String userToken="";
  String baseUrl="";
  int indexClick=0;

  @override
  void initState() {
    Constants.draweItem="Library";
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
        String baseUri= Constants.BASE_URL;
        setState(() {
          baseUrl=baseUri;
          getLibrary(baseUrl,userToken);
        });
    });
  }

  void getLibrary(String baseUrl ,String token) {
    load();
    libraryRepository = new LibraryRepository();
    Future<MyLibraryResponseModel> allList = libraryRepository.getLibrary(baseUrl,token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          libaryResponseModel = value;
        }else{
          showError();
          if(value==null){
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }


  var isExpanded = false;
  _onExpansionChanged(bool val) {
    setState(() {
      isExpanded = val;
    });
  }

  Widget _buildTiles(Dirs root,int index) {
    if(root.dirs==null){
      root.dirs=[];
    }
    return Column(
      children: [
        // ExpansionTile(
        MyExpansionTile(
          onExpansionChanged: _onExpansionChanged,
          // key: PageStorageKey<Dirs>(root),
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Image.asset("assets/images/ic_folder.webp",width: 24,height: 24,),
                    const SizedBox(width: 14,),
                    Text(root.name),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {

                  },
                  child: Text("You",style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'medium'
                  ),),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {

                  },
                  child: Text(getFormattedDate(stringToDateTime(root.updatedAt)).toString(),style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'medium'
                  ),),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {

                  },
                  child: Text("-",style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'medium'
                  ),),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    print("njbjbj"+index.toString());
                    openDialogForDire(root);
                  },
                  child: Icon(Icons.more_vert,size: 30,),
                ),
              )
            ],
          ),
          // trailing: Icon(Icons.image),
          children:[
            Container(
              margin:EdgeInsets.only(left: 10) ,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) =>
                    _buildTiles(root.dirs[index],index),
                itemCount: root.dirs.length,
              ),
            ),
            root.files!=null? Container(
              margin:EdgeInsets.only(left: 10) ,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  String icon='';
                    if(root.files[index].name.contains(".xlsx")){
                      icon="assets/images/ic_excel.webp";
                    }else if(root.files[index].name.contains(".pptx")){
                      icon="assets/images/ic_power_point.webp";
                    }else if(root.files[index].name.contains('pdf')){
                      icon="assets/images/ic_pdf.webp";
                    }else if(root.files[index].name.contains('docx')||root.files[index].name.contains('doc')){
                      icon="assets/images/ic_word.webp";
                    }else if(root.files[index].name.contains('.pot')||root.files[index].name.contains('.ppt')){
                      icon="assets/images/ic_power_point.webp";
                    }else if(root.files[index].name.contains(".xlsx")){
                      icon="assets/images/ic_excel.webp";
                    }else if(root.files[index].name.contains(".html")){
                      icon="assets/images/ic_html.png";
                    }else if(root.files[index].name.contains(".png")){
                      icon="assets/images/ic_image.png";
                    }else {
                      icon="assets/images/ic_pdf.webp";
                    }
                  return Container(
                      margin: EdgeInsets.only(bottom: 18,top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print("UrlIs>>"+root.files[index].fileUrl);
                                // launch("http://test.app.ijtimaati.com/doc-view?doc="+root.files[index].fileUrl);
                              },
                              child: Row(
                                children: [
                                  Image.asset(icon,width: 24,height: 24,),
                                  const SizedBox(width: 10,),
                                  Text(root.files[index].name,style: TextStyle(
                                      fontFamily: 'medium',
                                      color: Colors.black,
                                      fontSize: 16
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Text("You",style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'medium'
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Text(getFormattedDate(stringToDateTime(root.files[index].updatedAt)).toString(),style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'medium'
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Text(root.files[index].size.toString(),style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'medium'
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                // print("njbjbj"+index.toString());
                              },
                              child: Icon(Icons.more_vert,size: 30,),
                            ),
                          )
                        ],
                      ));
                   },
                itemCount: root.files.length,
              ),
            ):Container()
          ],
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildFiles(Files root) {
    // String icon='assets/images/ic_excel.png';
    String icon='';
    if(root.name.contains(".xlsx")){
      icon="assets/images/ic_excel.webp";
    }else if(root.name.contains(".pptx")||root.name.contains('.ppt')){
      icon="assets/images/ic_power_point.webp";
    }else if(root.name.contains('pdf')){
      icon="assets/images/ic_pdf.webp";
    }else if(root.name.contains('docx')){
      icon="assets/images/ic_word.webp";
    }else if(root.name.contains('pot')){
      icon="assets/images/ic_power_point.webp";
    }else if(root.name.contains(".xlsx")){
      icon="assets/images/ic_excel.webp";
    }else if(root.name.contains(".html")){
      icon="assets/images/ic_html.png";
    }else if(root.name.contains(".png")){
      icon="assets/images/ic_image.png";
    }else {
      icon="assets/images/ic_pdf.webp";
    }
    return Container(
        margin: EdgeInsets.only(bottom: 18,top: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  print("UrlIs>>"+root.fileUrl);
                  // launch("http://test.app.ijtimaati.com/doc-view?doc="+root.fileUrl);
                },
                child: Row(
                  children: [
                    Image.asset(icon,width: 24,height: 24,),
                    const SizedBox(width: 10,),
                    Text(root.name,style: TextStyle(
                      fontFamily: 'medium',
                      color: Colors.black,
                      fontSize: 16
                    ),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {

                },
                child: Text("You",style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'medium'
                ),),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {

                },
                child: Text(getFormattedDate(stringToDateTime(root.updatedAt)).toString(),style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'medium'
                ),),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {

                },
                child: Text(root.size.toString(),style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'medium'
                ),),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  // print("njbjbj"+index.toString());
                },
                child: Icon(Icons.more_vert,size: 30,),
              ),
            )
          ],
        ));
  }


  openDialogForDire(Dirs root) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Color(0x00ffffff),
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 200),
              padding: EdgeInsets.only(left: 20),
              height: 180,
              width: MediaQuery.of(context).size.width/4-60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(14)),
                border: Border.all(
                  width: 0.4,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
               Row(
                 children: [
                   Icon(Icons.star_half,size: 22,),
                   const SizedBox(width: 10,),
                   Container(
                     margin: EdgeInsets.only(top: 6),
                     child: Text("Add to Favorite",style: TextStyle(
                       fontSize: 16,
                       color: grayTextColor,
                       fontFamily: "medium"
                     ),),
                   )
                 ],
               ),
                  Row(
                    children: [
                      Image.asset('assets/images/ic_details.webp',width: 20,height: 20,),
                      const SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Text("Show Details",style: TextStyle(
                            fontSize: 16,
                            color: grayTextColor,
                            fontFamily: "medium"
                        ),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/ic_history.webp',width: 20,height: 20,),
                      const SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Text("Versions History",style: TextStyle(
                            fontSize: 16,
                            color: grayTextColor,
                            fontFamily: "medium"
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        key: scaffoldKeyDrawer,
        backgroundColor: grayColor,
        drawer: DrawerWidget(5),
        body:Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print("sddsd");

                            if (scaffoldKeyDrawer.currentState.isDrawerOpen) {
                              scaffoldKeyDrawer.currentState.openEndDrawer();
                            } else {
                              scaffoldKeyDrawer.currentState.openDrawer();
                            }
                          },
                          child: Icon(Icons.menu,color: Colors.black,size: 26,)),
                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblLibrary
                          ,
                          style: blueColorBoldStyle(26),
                        ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            // openBottomSheetForFilter();
                          },
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 24,
                            color: grayTextColor,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async{
                          // this.check =  await Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => CreateMeetingScreen()));
                          // if (check != null) {
                          //   getAllMeetings(userToken);
                          //   print("omarrrrr");
                          // }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color(0xffeaeaea),
                                width: 0.6
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.1, 0.9],
                              colors: [
                                yellowLightColor,
                                yellowLightColor,
                              ],
                            ),
                          ),
                          child: Text(
                            "+",
                            style: yellowColorStyleBold(28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              height: 0.4,color: grayTextColor,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  indexClick=0;
                                });
                              },
                              child: Text(
                                "Library",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==0?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==0?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  indexClick=1;
                                });
                              },
                              child: Text(
                                "Shared with me",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==1?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor:indexClick==1?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  indexClick=2;
                                });
                              },
                              child: Text(
                                "Organization Library",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==2?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==2?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  indexClick=3;
                                });
                              },
                              child: Text(
                                "Approved Documents",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==3?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==3?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  indexClick=4;
                                });
                              },
                              child: Text(
                                "Favorite",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==4?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==4?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // fontFamily: "medium",
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 0,left: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                "File Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                "Owner",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                "Last Modified",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                "File Size",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                "",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      libaryResponseModel.dirs!=null?
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) =>
                                    _buildTiles(libaryResponseModel.dirs[index],index),
                                itemCount: libaryResponseModel.dirs.length,
                              ),
                            ),
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) =>
                                    _buildFiles(libaryResponseModel.files[index]),
                                itemCount: libaryResponseModel.files.length,
                              ) ,
                            )

                          ],
                        ),
                      )
                          :Container(),

                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        )


    );
  }
}


