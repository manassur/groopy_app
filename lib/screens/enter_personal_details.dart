import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UIStyles.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/select_country_dialog.dart';
import 'package:groopy_app/widgets/dialogs/verify_code_dialog.dart';

class EnterPersonalDetailsScreen extends StatefulWidget {
  const EnterPersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _EnterPersonalDetailsScreenState createState() => _EnterPersonalDetailsScreenState();
}

class _EnterPersonalDetailsScreenState extends State<EnterPersonalDetailsScreen> {
  String text = '';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(top: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 5,
                width: 135,
                decoration: BoxDecoration(
                    color: Color(0xFF2E313C),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              SizedBox(height: 20,),
              Text(UITexts.ENTER_PERSONAL_DETAILS, style: TextStyle(
                  color: Color(0xFF22215B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
              Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          UITexts.FIRSTNAME_TITLE,
                          style: UIStyles.textInputTitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: 'John'),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          UITexts.LASTNAME_TITLE,
                          style: UIStyles.textInputTitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: 'Doe'),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          UITexts.BIRTHDAY_TITLE,
                          style: UIStyles.textInputTitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: '19/07/1997'),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          UITexts.COUNTRY_TITLE,
                          style: UIStyles.textInputTitle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            print('open countries clicked');
                            showDialog(
                                context: context,
                                builder: (BuildContext context)
                                {
                                  return SelectCountryDialog();
                                });
                          },
                          child: TextFormField(
                            readOnly: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintText: 'France'),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  // show the dialog to enter verification code
                  // showDialog(context: context, builder: (BuildContext context) {
                  //   return VerifyCodeDialog();
                  // });
                },
                height: Platform.isIOS ?80:62,
                minWidth: double.infinity,
                color: UIColors.NextButtonColor,
                elevation: 0,
                textColor: Colors.black,
                shape: new RoundedRectangleBorder(),
                child: Text(
                  UITexts.REGISTER,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          )),
    );
  }
}
