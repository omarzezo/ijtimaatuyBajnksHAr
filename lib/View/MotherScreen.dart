import 'package:flutter/material.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/View/AllMeetingsScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/HomeScreen.dart';
import 'package:itimaaty/View/NotGoingScreen.dart';


class MotherScreen extends StatefulWidget {
 final int childIndex;
  MotherScreen(this.childIndex);


  @override
  MotherScreenState createState() => new MotherScreenState();
}

class MotherScreenState extends State<MotherScreen> {


  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

  PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {

    // = GlobalKey<ScaffoldState>();
    super.initState();
    _pageController = new PageController();
    if(widget.childIndex!=null){
      _pageIndex=widget.childIndex;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  
  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (_pageIndex) {
      case 0:
        child = HomeScreen();
        break;
      case 1:
        child = AllMeetingsScreen();
        // child = DemoDropdown();
        break;
      case 2:
        child = NotGoingScreen();
        break;
      case 3:
        child = Home("3");
        break;
      case 4:
        child = Home("4");
        break;
    }

    return WillPopScope(
      onWillPop: () {
        if(_pageIndex==0){
          print("Inside");
          _onWillPop();
        }else{
          setState(() {
            _pageIndex=0;
            child=HomeScreen();
            print("child"+child.toStringShort());
            print("Outside");
          });
        }
      },
      child: new Scaffold(
        key: scaffoldKeyDrawer,
        body: child,
        drawer: DrawerWidget(0),
        // bottomNavigationBar: new CustomNavigationBar(
        //   elevation: 20,
        //   iconSize: 24.0,
        //   selectedColor: yellowColor,
        //   strokeColor: Color(0x30040307),
        //   unSelectedColor: Color(0xffacacac),
        //   backgroundColor: Colors.white,
        //   items: [
        //     CustomNavigationBarItem(
        //       icon: Icons.home
        //       // icon: Icon(Icons.home),
        //       // title: Text("Home"),
        //     ),
        //     CustomNavigationBarItem(
        //       icon:Icons.meeting_room,
        //       // title: Text("Cart"),
        //     ),
        //     CustomNavigationBarItem(
        //       icon: Icons.calendar_today,
        //       // title: Text("Explore"),
        //     ),
        //     CustomNavigationBarItem(
        //       icon: Icons.notification_important_outlined,
        //       // title: Text("Search"),
        //     ),
        //     CustomNavigationBarItem(
        //       icon: Icons.short_text_rounded,
        //       // title: Text("Me"),
        //     ),
        //   ],
        //   currentIndex: _pageIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _pageIndex = index;
        //     });
        //   },
        // ),


      ),
    );
  }
}



class Home extends StatelessWidget {

  Home(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              listType,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}