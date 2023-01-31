import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Models/my_library_response_model.dart';
import 'package:itimaatysoharsohar/Repository/LibraryRepository.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';

class BasicTilePage extends StatefulWidget {
  @override
  BasicTilePageTest createState() => BasicTilePageTest();

}


class BasicTilePageTest extends State<BasicTilePage> {

  LibraryRepository libraryRepository;
  MyLibraryResponseModel libaryResponseModel =new MyLibraryResponseModel();

  String userToken="";
  String baseUrl="";

  @override
  void initState() {
    Constants.draweItem="Library";
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
        String baseUri= Constants.BASE_URL;
        setState(() {
          baseUrl=baseUri;
        });
        getLibrary(baseUrl,value);
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

  Widget _buildTiles(Dirs root) {
    if(root.dirs==null){
      root.dirs=[];
    }
    // if (root.dirs.isEmpty) {
    //   return Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 10.0),
    //         child: ListTile(title: Text(root.name)),
    //       ),
    //       SizedBox(
    //         child: ListView.builder(
    //           shrinkWrap: true,
    //           itemBuilder: (BuildContext context, int index) =>
    //               _buildFiles(root.files[index]),
    //           itemCount: root.files.length,
    //         ) ,
    //       )
    //     ],
    //   );
    // }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ExpansionTile(
            key: PageStorageKey<Dirs>(root),
            title: Text(root.name),
            children: root.dirs.map(_buildTiles).toList(),
          ),
        ),
        // SizedBox(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     itemBuilder: (BuildContext context, int index) =>
        //         _buildFiles(root.files[index]),
        //     itemCount: root.files.length,
        //   ) ,
        // )
      ],
    );
  }

  Widget _buildFiles(Files root) {
    // if(root.dirs==null){
    //   root.dirs=[];
    // }
   return Text(root.name);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body:libaryResponseModel.dirs!=null?
    // ListView(
    //   children: libaryResponseModel.dirs.map((tile) => BasicTileWidget(tile: tile)).toList(),
    // )
    Column(
      children: [
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                _buildTiles(libaryResponseModel.dirs[index]),
            itemCount: libaryResponseModel.dirs.length,
          ),
        ),
        // SizedBox(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     itemBuilder: (BuildContext context, int index) =>
        //         _buildFiles(libaryResponseModel.files[index]),
        //     itemCount: libaryResponseModel.files.length,
        //   ) ,
        // )

      ],
    )
        :Container(),
  );
}


