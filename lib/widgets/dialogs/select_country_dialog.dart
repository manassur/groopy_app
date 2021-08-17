import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/verify_code_dialog.dart';

import '../numeric_keyboard.dart';

class SelectCountryDialog extends StatefulWidget {
  const SelectCountryDialog({Key? key}) : super(key: key);

  @override
  _SelectCountryDialogState createState() => _SelectCountryDialogState();
}

class _SelectCountryDialogState extends State<SelectCountryDialog> {
  String text='';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal:15,vertical: 60),
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
            Text(UITexts.SELECT_COUNTRY, style: TextStyle(
                color: Color(0xFF22215B),
                fontSize: 18,
                fontWeight: FontWeight.bold)),

            SizedBox(height: 20,),
            Container(
                height:40 ,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: textEditingController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  showCursor: true,
                  style:  TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      ),
                  cursorHeight: 20,
                  decoration: new InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical:12.0,horizontal:5),
                        child: SvgPicture.asset('assets/svg/search.svg',color: Colors.grey[600],),
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 5, bottom: 10, top: 10, right: 5),
                      hintText: UITexts.SEARCH_COUNTRY,
                      hintStyle: TextStyle(fontWeight: FontWeight.w200,color: Colors.grey[600])
                  ),
                ),
            ),
            SizedBox(height: 10,),
            Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Divider(),
                );
              },
              itemCount: UITexts.COUNTRIES.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${UITexts.COUNTRIES[index]}  +${UITexts.COUNTRY_CODES[index]} '),
                  ),
                );
              },
            ),
          ),
            MaterialButton(
              onPressed: (){
                Navigator.pop(context);
                // show the dialog to enter verification code
                showDialog(context: context, builder: (BuildContext context) {
                  return VerifyCodeDialog();
                });
              },
              height: 62,
              minWidth: double.infinity,
              color: UIColors.NextButtonColor,
              elevation: 0,
              textColor:Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)
                ),
              ),
              child: Text(UITexts.CLOSE,style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
