// import 'package:flutter/cupertino.dart';
// import 'package:innosof_task_omar/Localizations/localization/localizations.dart';
// import 'package:innosof_task_omar/Models/NewsModel.dart';
// import 'package:innosof_task_omar/Models/NextMatchModel.dart';
// import 'package:innosof_task_omar/Models/TweetsModel.dart';
// import 'package:innosof_task_omar/Models/VideoModel.dart';
// import 'package:innosof_task_omar/Models/WinnerModel.dart';
//
// class StaticData{
//
//
//   List<NextMatchModel> getnewxtMatchList(){
//     List<NextMatchModel> newxtMatchList =new List<NextMatchModel>();
//     newxtMatchList.add(new NextMatchModel("الاهلي", "الزمالك", "الخميس 15 يوليو", "22:0"));
//     newxtMatchList.add(new NextMatchModel("ريال مدريد", "برشلونه", "السبت 10 نوفمبر", "8:0"));
//     newxtMatchList.add(new NextMatchModel("تشيلسي", "ليفربول", "الاحد 8 اغسطس", "14:0"));
//     newxtMatchList.add(new NextMatchModel("اسبانيا", "مصر", "الاثنين 4 يناير", "17:0"));
//
//     return newxtMatchList;
//   }
//
//   List<TweetsModel> gettweetsList(){
//     List<TweetsModel> tweetsList =new List<TweetsModel>();
//     tweetsList.add(new TweetsModel("الدوري الرياضي",
//         "عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. ",
//         'assets/images/logo.png', "account@"));
//     tweetsList.add(new TweetsModel("الدوري السعودي",
//         "عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. ",
//         'assets/images/logo.png', "Omar@"));
//     return tweetsList;
//   }
//
//   List<WinnerModel> getwinnerList() {
//     List<WinnerModel> winnerList = new List<WinnerModel>();
//     winnerList.add(
//         new WinnerModel("الهلال", "20%", 'assets/images/icon_match.png'));
//     winnerList.add(
//         new WinnerModel("النصر", "30%", 'assets/images/icon_match.png'));
//     winnerList.add(
//         new WinnerModel("الاتحاد", "40%", 'assets/images/icon_match.png'));
//
//     return winnerList;
//   }
//
//   List<VideoModel> getVideos(){
//     List<VideoModel> videoList =new List<VideoModel>();
//     videoList.add(new VideoModel('assets/images/video_image.png', "الصحف العالميه تبرر تمديد العقد"));
//     videoList.add(new VideoModel('assets/images/video_image.png', "متابعه مباره ريال مدريد"));
//     return videoList;
//   }
//
//   List<NewsModel> getNewsList(){
//     List<NewsModel> newsList =new List<NewsModel>();
//     newsList.add(new NewsModel("الدوري الرياضي", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "12 يوليو 2018", 'assets/images/video_image.png'));
//
//     newsList.add(new NewsModel("الدوري الانجليزي", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "6 سبتمبر 2019", 'assets/images/news2.png'));
//
//     newsList.add(new NewsModel("الدوري المصري", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "4 يوليو 2018", 'assets/images/news1.png'));
//
//     newsList.add(new NewsModel("الدوري السعودي", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "14 مارس 2021", 'assets/images/image_banner.png'));
//
//     newsList.add(new NewsModel("الدوري الاماراتي", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "20 ابريل 2017", 'assets/images/video_image.png'));
//
//     newsList.add(new NewsModel("الدوري الاسباني", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "22 اغسطس 2014", 'assets/images/news1.png'));
//
//     newsList.add(new NewsModel("الدوري الايطالي", "من الملاعب السعودية إلى منصة التتويج بكأس العالم..",
//         "30 يناير 2011", 'assets/images/news2.png'));
//     return newsList;
//   }
//
//   //////////////////
//
//
// List<String> getExtraTiltles(BuildContext context){
//   List<String> extraTitleList =new List<String>();
//   extraTitleList.add(AppLocalizations.of(context).lblTeam);
//   extraTitleList.add(AppLocalizations.of(context).lblPlayGround);
//   extraTitleList.add(AppLocalizations.of(context).lblABoutUs);
//   extraTitleList.add(AppLocalizations.of(context).lblSystem);
//   extraTitleList.add(AppLocalizations.of(context).lblCommite);
//   extraTitleList.add(AppLocalizations.of(context).lblContactUs);
//   extraTitleList.add(AppLocalizations.of(context).lblShare);
//   extraTitleList.add(AppLocalizations.of(context).lblShareNew);
//   return extraTitleList;
// }
//
//
// //////////////////////////////
//
//
//
// List<String> geticonTypes(BuildContext context){
//   List<String> _iconTypes =new List<String>();
//   _iconTypes.add('assets/images/ic_facebook.png');
//   _iconTypes.add('assets/images/ic_twitter.png');
//   _iconTypes.add('assets/images/ic_insta.png');
//   _iconTypes.add('assets/images/ic_linkedin.png');
//   _iconTypes.add('assets/images/ic_youtube.png');
//   return _iconTypes;
// }
// }