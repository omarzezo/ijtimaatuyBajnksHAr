// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// // import 'package:geocoding/geocoding.dart';
// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:itimaaty/Utils/Constants.dart';
// import 'package:itimaaty/View/FontsStyle.dart';
// import 'package:itimaaty/network/end_points.dart';
// import 'AppColors.dart';
//
//
// class GetLocation extends StatefulWidget {
//   bool isRegister ;
//   bool isPop ;
//
//   GetLocation({this.isRegister =false ,this.isPop=false});
//
//   @override
//   _GetLocationState createState() {
//     return _GetLocationState();
//   }
// }
//
// class _GetLocationState extends State<GetLocation> {
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
//   Completer<GoogleMapController> _controller = Completer();
//   GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: Constants.GOOGLE_MAPS_API_KEY);
//   GlobalKey<ScaffoldState> _scaffoldKey =
//   new GlobalKey<ScaffoldState>();
//   String locationString = "" ;
//   bool isGettingLocation = false ;
//   bool updateLocationApi = false ;
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   LatLng selectedPosition ;
//   void _addMarker(LatLng latLang) async {
//     var markerIdVal = "50";
//     setState(() {
//       this.selectedPosition = latLang ;
//     });
//     final MarkerId markerId = MarkerId(markerIdVal);
//     // creating a new MARKER
//     final Marker marker = Marker(
//       markerId: markerId,
//       position: latLang,
//       infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
//     );
//     setState(() {
//       // adding a new marker to map
//       markers[markerId] = marker;
//     });
//     setState(() {
//       this.isGettingLocation = true ;
//     });
//
//     // var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLang.latitude, latLang.longitude)) ;
//     List<Placemark> address = await  Geolocator().placemarkFromCoordinates(latLang.latitude, latLang.longitude);
//
//     setState(() {
//       // this.locationString = address.first.addressLine ;
//       this.locationString = address.first.name ;
//       this.isGettingLocation = false ;
//     });
//   }
//   Future<void> _redirctCameraPosition(CameraPosition cameraPosition ) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//   }
//
//   Future<Null> displayPrediction(Prediction p) async {
//     if (p != null) {
//       PlacesDetailsResponse detail =
//       await _places.getDetailsByPlaceId(p.placeId);
//
//       var placeId = p.placeId;
//       double lat = detail.result.geometry.location.lat;
//       double lng = detail.result.geometry.location.lng;
//
//       // var address = await Geocoder.local.findAddressesFromQuery(p.description);
//
//       _addMarker(new LatLng(lat, lng));
//       _redirctCameraPosition(
//           CameraPosition(
//               bearing: 192.8334901395799,
//               target: new LatLng(lat, lng),
//               tilt: 59.440717697143555,
//               zoom: 15)
//       );
//     }
//   }
//
//   getCurrentPosition () async{
//     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     print("my Location Long :${position.longitude}");
//     print("my Location lat :${position.latitude}");
//     _addMarker(new LatLng(position.latitude, position.longitude));
//     _redirctCameraPosition( CameraPosition(
//         bearing: 192.8334901395799,
//         target: new LatLng(position.latitude, position.longitude),
//         tilt: 59.440717697143555,
//         zoom: 15));
//   }
//
//   initLocation()async{
//
//     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     print("my Location Long :${position.longitude}");
//     print("my Location lat :${position.latitude}");
//     _addMarker(new LatLng(position.latitude, position.longitude));
//     _redirctCameraPosition( CameraPosition(
//         bearing: 192.8334901395799,
//         target: new LatLng(position.latitude, position.longitude),
//         tilt: 59.440717697143555,
//         zoom: 15));
//
//     _addMarker(new LatLng(position.latitude, position.longitude));
//   }
//
//
//   @override
//   void initState() {
//     // getPermission();
//     super.initState();
//
//     setState(() {
//       initLocation();
//       this.isGettingLocation = true ;
//       this.isGettingLocation = false ;
//     });
//   }
//   //User user ;
//   void saveUserLocation(LatLng position ){
//     setState(() {
//       this.updateLocationApi = true ;
//     });
//   }
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   Future<bool> _onWillPop() async {
//     widget.isRegister ? saveUserLocation(selectedPosition) : Navigator.pop(context,selectedPosition);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar:  AppBar(
//           leading: new Container(),
//           title: Text('Choose Location',style: blueColorBoldStyle(26),),
//           backgroundColor: grayColor,
//           centerTitle: true,
//         ),
//         floatingActionButton: this.updateLocationApi ? FloatingActionButton(
//         onPressed: (){ },
//         child: Container(
//           decoration: BoxDecoration(color: grayColor,shape: BoxShape.circle),
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       ):FloatingActionButton.extended(
//         onPressed: (){
//           widget.isRegister ? saveUserLocation(selectedPosition) : Navigator.pop(context,selectedPosition);
//         },
//         label: Text('Choose Location',style: TextStyle(
//           color: Colors.white ,
//           fontFamily: "black",
//           fontSize: 22,
//           // fontWeight: FontWeight.bold
//         ),),
//         icon: Icon(Icons.check),
//         backgroundColor: yellowColor,
//       ),
//         body: Stack(
//           children: <Widget>[
//             Positioned(
//               top: 0 ,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Container(
//                 child: GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: _kGooglePlex,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                   },
//                   onTap: (latLang){
//                     print(latLang);
//                     _addMarker(latLang);
//                   },
//                   markers: Set<Marker>.of(markers.values),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//               ),
//
//             ),
//             Positioned(
//               top: 16,
//               left: 16,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.width/10 ),
//                   width: MediaQuery.of(context).size.width/2,
//                   color: Color(0x44000000),
//                   child: Row(
//                     children: <Widget>[
//
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.width/10 ),
//                           width: MediaQuery.of(context).size.width/2,
//                           child:isGettingLocation ? Center(child:CircularProgressIndicator()): Text(locationString,style: TextStyle(
//                             color: blueColor ,
//                             fontFamily: "black",
//                             fontSize: 22,
//                             // fontWeight: FontWeight.bold
//                           ),),
//                         ),
//
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           child: Align(alignment: Alignment.topRight,
//                             child: IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () async{
//                               Prediction p = await PlacesAutocomplete.show(
//                                 context: context, apiKey: Constants.GOOGLE_MAPS_API_KEY ,
//                                 mode: Mode.overlay,
//                               );
//                               displayPrediction(p);
//                             }),),),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ),
//             Positioned(
//                 bottom: MediaQuery.of(context).size.height/9,
//                 left: 16,
//                 child: InkWell(
//                   onTap: (){
//                     this.getCurrentPosition();
//                   },
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(color:yellowColor , shape: BoxShape.circle),
//                     child: Center(child: Icon(Icons.location_searching ,color:Colors.white , size: 25,),),
//
//                   ),
//                 )
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
