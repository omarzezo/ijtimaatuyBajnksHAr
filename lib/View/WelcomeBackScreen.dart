import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/LocalDb/DbHelper.dart';
import 'package:itimaaty/LocalDb/OrganizationLocalModel.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/MyOrganizationsResponseModel.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/CheckYourMailScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

class WelcomeBackScreen extends StatefulWidget {


  @override
  WelcomeBackScreenScreenState createState() => WelcomeBackScreenScreenState();
}

class WelcomeBackScreenScreenState extends State<WelcomeBackScreen> {

  double width;
  double height;
  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var igtimaatiURLController = TextEditingController();
  // List<MyOrganizationsResponseModel> myList =new List<MyOrganizationsResponseModel>();
  // MyOrganizationsResponseModel model =new MyOrganizationsResponseModel();
  var dbHelper = DbHelper();
  List orgainzations;
  int orgainzationsCount = 0;

  @override
  void initState() {
    getProducts();
    // model.name="jumia";
    // myList.add(model);
    // model.name="700apps";
    // myList.add(model);
  }

  void getProducts() async {
    var orgainzationsFuture = dbHelper.getOrganizations();
    orgainzationsFuture.then((data) {
      setState(() {
        this.orgainzations = data;
        orgainzationsCount = data.length;
        print(""+"countIs>>"+orgainzationsCount.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget leaveRow(OrganizationLocalModel leave,int index) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
            border: Border.all(
                color: grayRoundedColor,// set border color
                width: 1.0
            )
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    // "https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Mahadev-Bhagwan-Photo-for-Devotee.jpg",
                    leave.logo,
                    height: width<600?40:60,
                    width: width<600?40:50,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 14,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(leave.name,style: blueColorBoldStyle(width<600?16:20),),
                    const SizedBox(height: 2,),
                    Text("Jumia@Jumia.com",style: grayTextColorStyleMedium(width<600?14:18),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Container(
              // padding: EdgeInsets.only(top: 4,bottom: 2),
              width: MediaQuery.of(context).size.width,
              // height: 43.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
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
              child: FlatButton(
                child: Text(
                  AppLocalizations.of(context).lblLaunch,
                  style: yellowColorStyleBold(width<600?16:22),
                ),
                textColor: Colors.white,
                color: Colors.transparent,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  // if (formKey.currentState.validate()) {
                  //   cubit.userLoginFunc(
                  //     email: emailController.text,
                  //     password: passwordController.text,
                  //   );
                  // }
                },
              ),
            ),
            const SizedBox(height: 8,),
          ],
        ),
      );
    }

    final makeBody = Container(
        margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child:
        Expanded(
          child: SizedBox(
            child: orgainzations!=null? orgainzations.isNotEmpty?ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: orgainzations.length,
              itemBuilder: (context, index) {
                return leaveRow(orgainzations[index],index);
              },
            ):Center(
              child: Text("No Organizations",style: TextStyle(
                  color: blueColor,
                  fontSize: width<600?16:22,
                  fontWeight: FontWeight.bold,
                  fontFamily:'black'
              ),),
            ):Container(),
          ),
        )

    );

    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) async {
          if (state is ForgotPasswordSuccessState) {

            if (state.forgotPasswordResponseModel!=null) {
              print("EmailIs>>"+state.forgotPasswordResponseModel.message);
              if(state.forgotPasswordResponseModel.message=="Reset link send to your email,please check it"){
                navigateTo(context, CheckYourMailScreen(igtimaatiURLController.text));
              }else{

              }
              //
              // CacheHelper.saveData(
              //   key: 'token',
              //   value: state.loginModel.data.token,
              // ).then((value) {
              //   token = state.loginModel.data.token;
              //
              //   navigateAndFinish(context, HomeLayout());
              // });

            } else {

              // flutterToast(
              //   message: state.loginModel.message,
              //   state: ToastStates.ERROR,
              // );

            }
          }else{
            hasNetwork().then((value) {
              if(value){
                // if(EasyLoading.isShow){
                //   EasyLoading.showError("Check Network");
                // }
              }else{
                print("errorHere");
              }
            });


          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);

          return  Scaffold(
            // resizeToAvoidBottomInset: true,
            backgroundColor: grayColor,
            body: Container(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height:60,),
                        Center(child: Text(AppLocalizations.of(context).lblWelcomeBack,style: blueColorBoldStyle(width<600?22:30),)),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 0.3,color: grayTextColor,),
                        const SizedBox(height:28,),

                        Center(child: Text(AppLocalizations.of(context).lblAlready,style: grayTextColorStyleMedium(width<600?16:22),)),
                        // const SizedBox(height:20,),
                        makeBody
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}