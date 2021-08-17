import 'dart:io';

import 'package:flutter/material.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UIStyles.dart';
import 'package:groopy_app/constants/UITexts.dart';

import 'enter_personal_details.dart';

class MailRegisterScreen extends StatefulWidget {
  const MailRegisterScreen({Key? key}) : super(key: key);

  @override
  _MailRegisterScreenState createState() => _MailRegisterScreenState();
}

class _MailRegisterScreenState extends State<MailRegisterScreen> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Text('Enter Email',style: UIStyles.textInputTitle,),
              SizedBox(height: 20,),
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
                    hintText: 'Mail@demo.com'
                ),
              ),
              SizedBox(height: 50,),
              Text(UITexts.ENTER_PASSWORD,style:UIStyles.textInputTitle,),
              SizedBox(height: 20,),
              TextFormField(
                style:TextStyle(fontWeight: FontWeight.bold,fontSize: _obscureText==true? 25:17),
                obscureText: _obscureText,
                cursorColor: Colors.black,
                cursorHeight: 15,
                decoration: InputDecoration(
                    suffix: GestureDetector(
                        onTap: (){
                          _toggle();
                        },
                        child: Text('Show',style: TextStyle(color: Colors.black54,fontSize: 16),)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: ''
                ),
              ),
              SizedBox(height: 50,),
              Text(UITexts.RE_ENTER_PASSWORD,style:UIStyles.textInputTitle,),
              SizedBox(height: 20,),
              TextFormField(
                style:TextStyle(fontWeight: FontWeight.bold,fontSize: _obscureText==true? 25:17),
                obscureText: _obscureText,
                cursorColor: Colors.black,
                cursorHeight: 15,
                decoration: InputDecoration(
                    suffix: GestureDetector(
                        onTap: (){
                          _toggle();
                        },
                        child: Text('Show',style: TextStyle(color: Colors.black54,fontSize: 16),)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: ''
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
        Spacer(),
        MaterialButton(
          onPressed: (){
            showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor:Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext context)
                {
                  return EnterPersonalDetailsScreen();
                });
            print('personal details clicked');
          },
          height: Platform.isIOS ?80:62,
          minWidth: double.infinity,
          color: UIColors.NextButtonColor,
          elevation: 0,
          textColor:Colors.black,
          shape: new RoundedRectangleBorder(
          ),
          child: Text(UITexts.REGISTER,style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700),),
        ),
      ],
    );
  }
}
