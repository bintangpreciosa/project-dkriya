import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:project_dkriya/widget/notification_card.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  Widget videoTitleBar() {
    return Container(
        padding: EdgeInsets.fromLTRB(110, 20, 110, 20),
        child: Center(
          child: Text(
            "Notifikasi",
            style: MyStyle.appBarTitle.copyWith(fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget notificationList() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Column(children: [
              NotificationCard(),
              SizedBox(
                height: 15,
              ),
              NotificationCard(),
              SizedBox(
                height: 15,
              ),
              NotificationCard(),
              SizedBox(
                height: 15,
              ),
              NotificationCard(),
              SizedBox(
                height: 15,
              ),
              NotificationCard(),
            ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              videoTitleBar(),
              SizedBox(
                height: 0,
              ),
              notificationList()
            ],
          ),
        ),
      )),
    );
  }
}
