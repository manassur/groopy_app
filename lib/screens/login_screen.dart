import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/choose_language_dialog.dart';
import 'package:groopy_app/widgets/dialogs/enter_mobile_number_dialog.dart';
import 'package:groopy_app/widgets/dialogs/message_dialog.dart';
import '../constants/UIColors.dart';
import 'login_with_email.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(color: Colors.white,height: 420,),
                Image(image: AssetImage('assets/png/bg.png')),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 25,right: 25,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(UITexts.WELCOME,style: TextStyle(color:UIColors.PrimaryColor,fontSize: 20,fontWeight: FontWeight.w100),),
                    Text(UITexts.GROOPY,style: TextStyle(color:UIColors.PrimaryColor,fontSize: 37,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),),
                    SizedBox(height: 20,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    print('message dialog opened');
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        isDismissible: true,
                                        backgroundColor:Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return MessageDialog();
                                        });
                    },
                                  child: Text(UITexts.CONNECT,style: TextStyle(color:UIColors.PrimaryColor,fontSize: 16),)),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: true,
                                            backgroundColor:Colors.transparent,
                                            context: context,
                                            builder: (BuildContext context)
                                            {
                                              return EnterMobileNumberDialog();
                                            });
                                      },
                                      height: 50,
                                      color: UIColors.ButtonBackgroundColor,
                                      elevation: 0,
                                      textColor:UIColors.PrimaryColor,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                      ),
                                      child: Text(UITexts.MOBILE),
                                    ),
                                  ),
                                  SizedBox(width: 25,),
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: (){
                                        print('email button clicked');
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: true,
                                            backgroundColor:Colors.transparent,
                                            barrierColor: Colors.white.withOpacity(0),
                                            context: context,
                                            builder: (BuildContext context)
                                            {
                                              return LoginWithMailScreen();
                                            });
                                      },
                                      height: 50,
                                      color: UIColors.ButtonBackgroundColor,
                                      elevation: 0,
                                      textColor:UIColors.PrimaryColor,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                      ),
                                      child: Text(UITexts.EMAIL),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(UITexts.USE_SOCIAL_LOGIN,style: TextStyle(color: Color(0xFF22215B),fontSize: 12),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/google.svg',color:Color(0xFF22215B)),
                              SizedBox(width: 50,),
                              SvgPicture.asset('assets/svg/twitter.svg',color:Color(0xFF22215B)),
                              SizedBox(width: 50,),
                              SvgPicture.asset('assets/svg/facebook.svg',color:Color(0xFF22215B)),
                              // show the apple login button if platforom is ios
                              Platform.isIOS ?
                              SizedBox(width: 50,):
                              Container(),
                              Platform.isIOS ?
                              SvgPicture.asset('assets/svg/apple.svg',color:Color(0xFF22215B)):
                                  Container()

                              // iOS-specific cod
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              print('choose language clicked');
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  backgroundColor:Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context)
                                  {
                                    return ChooseLanguageDialog();
                                  });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(UITexts.ENGLISH,style: TextStyle(color: Color(0xFF22215B),fontSize: 16),),
                                SizedBox(width: 20,),
                                SvgPicture.asset('assets/svg/arrow_drop_down.svg',color:Color(0xFF22215B)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
