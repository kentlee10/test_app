import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app/widgets/icon_text.dart';
import 'package:test_app/widgets/profile_logo.dart';

import '../../model/user.dart';
import '../../utilities/helpers.dart';


class UserBody extends StatelessWidget {

  final RefreshController refreshController;
  final Function onRefresh;
  final List<User> list;
  const UserBody({required this.refreshController, required this.onRefresh, required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const WaterDropHeader(waterDropColor: Colors.green,),
          controller: refreshController,
          onRefresh: () => onRefresh(),
          onLoading: (){},
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              List colors = ["#5d59d9", "#e88be8", "#f72545", "#74ed53", "#f5ca73" , "#7accf0"];
              User userData = list[index];
              String initials = getInitials(userData.name ?? '');
              String address = '';
              address += userData.address!['suite'];
              address += ", ${userData.address!['street']}";
              address += ", ${userData.address!['city']}";
              return ListTile(
                  leading: ProfileImage(dimensions: 50, initials: initials, bgColor: HexColor(colors[(userData.id ?? 0) % 6]),),
                  title: Text(userData.name ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(icon: Icons.work_sharp, text: userData.company!['name'] ?? 'N/A'),
                      IconText(icon: Icons.email_sharp, text: userData.email ?? ''),
                      IconText(icon: Icons.location_on_sharp, text: address),
                    ],
                  )
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          ),
        )
    );
  }

  String getInitials(String userName) {
    List<String> names = userName.split(" ");
    String initials = "";
    int numWords = 2;
    for(var i = 0; i < numWords; i++){
      initials += names[i][0];
    }
    return initials;
  }
}