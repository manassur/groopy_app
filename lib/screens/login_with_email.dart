
import 'package:flutter/material.dart';
import 'package:groopy_app/screens/mail_login.dart';

import 'mail_register.dart';

class LoginWithMailScreen extends StatefulWidget {
  @override
  _LoginWithMailScreenState createState() => _LoginWithMailScreenState();
}

class _LoginWithMailScreenState extends State<LoginWithMailScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex=0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(top:50),
      child: Container(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

          child:Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(90),
                  child: Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      primaryColor: Colors.white
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 5,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Color(0xFF2E313C),
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: AppBar(
                            elevation: 0,
                            leading: Container(),
                            bottom: TabBar(
                              isScrollable: false,
                              onTap: (index) {
                                //your currently selected index
                                setState(() {
                                  currentTabIndex = index;
                                });
                                _tabController.animateTo(currentTabIndex);
                              },
                              controller: _tabController,
                              labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),
                              indicatorColor: Colors.transparent,
                              unselectedLabelColor: Colors.grey[500],

                              tabs: [
                                Tab(
                                    child: Column(
                                  children: [
                                    Text('Signin'),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 120,
                                      height: 2,
                                      color: currentTabIndex==0? Colors.black:Colors.grey[400],
                                    )
                                  ],
                                )),
                                Tab(child: Column(
                                  children: [
                                    Text('Register'),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 120,
                                      height: 2,
                                      color: currentTabIndex==1? Colors.black:Colors.grey[400],
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    MailLoginScreen(),
                    MailRegisterScreen(),
                  ],
                ),
              ),
            ),
          )),
      ),
    );
  }
}

