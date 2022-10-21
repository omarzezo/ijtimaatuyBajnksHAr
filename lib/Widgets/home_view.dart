// import 'package:flutter/material.dart';
// import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
// import 'package:itimaaty/Models/news_response_model.dart';
// import 'package:itimaaty/Repository/NewsRepository.dart';
//
// import '../Utils/Constants.dart';
//
// class NewsScreen extends StatefulWidget {
//
//   @override
//   NewsScreenState createState() => NewsScreenState();
// }
//
// DateTime dateTime;
//
// class NewsScreenState extends State<NewsScreen> {
//
//   List<String> names =
//   [
//     'Ahmed',
//     'Mohamed',
//     'Ibrahim',
//   ];
//   NewsRepository  newsRepository ;
//   List<NewsResponseModel> newsList;
//
//   void getNewsData(String baseUrl ,String token){
//     newsRepository=NewsRepository();
//     Future<List<NewsResponseModel>> newsData = newsRepository.getNewsData(baseUrl,token);
//     newsData.then((value) {
//       setState(() {
//         newsList=value;
//       });
//     });
//   }
//
//   String baseUrl="";
//
//   @override
//   void initState() {
//     SharedPreferencesHelper.getLoggedToken().then((value) {
//       SharedPreferencesHelper.getDomainName().then((value) {
//         String baseUri= Constants.first+value+Constants.third+Constants.fourth;
//         setState(() {
//           baseUrl=baseUri;
//         });
//         getNewsData(baseUrl,value);
//       });
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home View'),centerTitle: true,),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView.separated(
//             itemBuilder: (context , index) => Row(
//               children: [
//                 // Expanded(
//                 //   child: Container(
//                 //   width: 200,height: 550,
//                 //   clipBehavior: Clip.antiAlias,
//                 //   decoration: BoxDecoration(
//                 //   borderRadius: BorderRadius.circular(15),
//                 //   color: Colors.grey.shade100,
//                 // ),
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children:  [
//                 //       const Image(image: AssetImage('assets/view1.jpg'),width: double.infinity,height: 225,fit: BoxFit.cover,),
//                 //       const SizedBox(height: 25),
//                 //       Padding(
//                 //         padding: const EdgeInsets.only(left: 20.0),
//                 //         child: Row(
//                 //           children:   [
//                 //            const CircleAvatar(backgroundImage:  AssetImage('assets/view1.jpg'),),
//                 //           const SizedBox(width: 15,),
//                 //           Text(newsList[index].name, style : const TextStyle(
//                 //             fontWeight: FontWeight.bold,
//                 //             fontSize: 15,
//                 //           ),),
//                 //         ],),
//                 //       ),
//                 //       const SizedBox(height: 25),
//                 //       const Padding(
//                 //         padding: EdgeInsets.only(left:  20.0),
//                 //         child: Text('Text Task',style: TextStyle(
//                 //           fontWeight: FontWeight.w700,
//                 //           fontSize: 15,
//                 //         ),),
//                 //       ),
//                 //       const SizedBox(height: 20),
//                 //       const SizedBox(height: 20),
//                 //       Padding(
//                 //         padding: const EdgeInsets.only(left: 20.0),
//                 //         child: Row(
//                 //           children:  const  [
//                 //             Icon(Icons.date_range,color: Colors.grey,),
//                 //             SizedBox(width: 15,),
//                 //             Text('25 / Jan 2020', style : TextStyle(
//                 //               fontWeight: FontWeight.bold,
//                 //               fontSize: 15,
//                 //               color: Colors.grey
//                 //             ),),
//                 //           ],),
//                 //       ),
//                 //       const SizedBox(height: 20),
//                 //       Padding(
//                 //         padding: const EdgeInsets.only(left: 20.0),
//                 //         child: Row(
//                 //           children:   const [
//                 //             Icon(Icons.group,color: Colors.grey,),
//                 //             SizedBox(width: 15,),
//                 //             Text('Person', style : TextStyle(
//                 //                 fontWeight: FontWeight.bold,
//                 //                 fontSize: 15,
//                 //                 color: Colors.grey
//                 //             ),),
//                 //           ],),
//                 //       ),
//                 //       const SizedBox(height: 20),
//                 //        Divider(color: Colors.blueGrey.shade100,),
//                 //       Padding(
//                 //         padding: const EdgeInsets.all(10.0),
//                 //         child: Row(
//                 //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //           children: [
//                 //             Row(
//                 //               crossAxisAlignment: CrossAxisAlignment.start,
//                 //               children: [
//                 //                 Padding(
//                 //                   padding: const EdgeInsets.only(left:  10.0),
//                 //                   child: Row(
//                 //                     children: const [
//                 //                       Text('5', style : TextStyle(
//                 //                           fontWeight: FontWeight.bold,
//                 //                           fontSize: 15,
//                 //                           color: Colors.blueGrey,
//                 //                       ),),
//                 //                       SizedBox(width: 5,),
//                 //                       Text('Like', style : TextStyle(
//                 //                           fontWeight: FontWeight.bold,
//                 //                           fontSize: 15,
//                 //                           color: Colors.blueGrey
//                 //                       ),),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //                 const SizedBox(width: 7),
//                 //                 const Text(' -'),
//                 //                 Padding(
//                 //                   padding: const EdgeInsets.only(left:  10.0),
//                 //                   child: Row(
//                 //                     children: const [
//                 //                       Text('5', style : TextStyle(
//                 //                         fontWeight: FontWeight.bold,
//                 //                         fontSize: 15,
//                 //                         color: Colors.blueGrey,
//                 //                       ),),
//                 //                       SizedBox(width: 5,),
//                 //                       Text('Comment', style : TextStyle(
//                 //                           fontWeight: FontWeight.bold,
//                 //                           fontSize: 15,
//                 //                           color: Colors.blueGrey
//                 //                       ),),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //             Container(
//                 //               width: 90,
//                 //               height: 40,
//                 //               decoration: BoxDecoration(
//                 //                 color: Colors.yellow.shade200,
//                 //                 borderRadius: BorderRadius.circular(10),
//                 //               ),
//                 //              child: MaterialButton(onPressed: (){},child: const Text('Like',style : TextStyle(
//                 //                  fontWeight: FontWeight.bold,
//                 //                  fontSize: 15,
//                 //                  color: Colors.orange
//                 //              ),),)),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   )
//                 // )
//                 // ),
//                 const SizedBox(width: 20),
//
//                 Row(
//                   children: [
//                     Container(
//                         width: 200,height: 550,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.grey.shade100,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children:  [
//                             const Image(image: AssetImage('assets/6.jpg'),width: double.infinity,height: 225,fit: BoxFit.cover,),
//                             const SizedBox(height: 25),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: Row(
//                                 children:   [
//                                   const CircleAvatar(backgroundImage:  AssetImage('assets/6.jpg'),),
//                                   const SizedBox(width: 15,),
//                                   Text('${names[index]}', style : const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                   ),),
//                                 ],),
//                             ),
//                             SizedBox(height: 25),
//                             const Padding(
//                               padding: EdgeInsets.only(left:  20.0),
//                               child: Text('Text Task',style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15,
//                               ),),
//                             ),
//                             const SizedBox(height: 20),
//                             const SizedBox(height: 20),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: Row(
//                                 children:  const  [
//                                   Icon(Icons.date_range,color: Colors.grey,),
//                                   SizedBox(width: 15,),
//                                   Text('25 / Jan 2020', style : TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.grey
//                                   ),),
//                                 ],),
//                             ),
//                             const SizedBox(height: 20),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: Row(
//                                 children:   const [
//                                   Icon(Icons.group,color: Colors.grey,),
//                                   SizedBox(width: 15,),
//                                   Text('Person', style : TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.grey
//                                   ),),
//                                 ],),
//                             ),
//                             const SizedBox(height: 20),
//                             Divider(color: Colors.blueGrey.shade100,),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:  10.0),
//                                         child: Row(
//                                           children: const [
//                                             Text('5', style : TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15,
//                                               color: Colors.blueGrey,
//                                             ),),
//                                             SizedBox(width: 5,),
//                                             Text('Like', style : TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 15,
//                                                 color: Colors.blueGrey
//                                             ),),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(width: 7),
//                                       const Text(' -'),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:  10.0),
//                                         child: Row(
//                                           children: const [
//                                             Text('5', style : TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15,
//                                               color: Colors.blueGrey,
//                                             ),),
//                                             SizedBox(width: 5,),
//                                             Text('Comment', style : TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 15,
//                                                 color: Colors.blueGrey
//                                             ),),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                       width: 90,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         color: Colors.yellow.shade200,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: MaterialButton(onPressed: (){},child: const Text('Like',style : TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15,
//                                           color: Colors.orange
//                                       ),),)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             separatorBuilder:  (context , index) =>  const SizedBox(height: 20,),
//             itemCount: 3,
//         ),
//       )
//     );
//   }
// }
