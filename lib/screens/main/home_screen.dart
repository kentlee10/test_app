import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app/provider/main_provider.dart';
import 'package:test_app/utilities/helpers.dart';
import 'package:test_app/widgets/main_screen_body/body_country.dart';
import 'package:test_app/widgets/main_screen_body/body_user.dart';
import 'package:test_app/widgets/main_screen_body/body_website.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  RefreshController userRefreshController = RefreshController();
  RefreshController websiteRefreshController = RefreshController();
  RefreshController countryRefreshController = RefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: true);
    if(!provider.isInitialized){
      Future.delayed(Duration.zero, () async {
        provider.initialized();
      });
    }
    if(!provider.isLoading){
      userRefreshController.refreshCompleted();
      userRefreshController.loadNoData();
      websiteRefreshController.refreshCompleted();
      websiteRefreshController.loadNoData();
      countryRefreshController.refreshCompleted();
      countryRefreshController.loadNoData();
    }
    return  DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration:
            const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tab_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: null,
          title: Column(

            children: [
            Row(
              children: [
                Expanded(child: Text(
                  " If the endless dream guides your spirit, conquer them under the flag of you belief! ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.w600, backgroundColor: Colors.red.withOpacity(.5)),
                ),)
              ],
            )
          ],),
          bottom: const TabBar(
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Users',),
              Tab(icon: Icon(Icons.web), text: 'Websites',),
              Tab(icon: Icon(Icons.flag), text: 'Countries',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserBody(
                refreshController: userRefreshController,
                onRefresh: (){
                  provider.refreshUserList();
                },
                list: provider.userList,
            ),
            WebsiteBody(
              refreshController: websiteRefreshController,
              onRefresh: (){
                provider.refreshUserList();
              },
              list: provider.websiteList,
            ),
            CountryBody(
              refreshController: countryRefreshController,
              onRefresh: (){
                provider.refreshCountryList();
              },
              list: provider.countryList,
            ),
          ],
        ),
    ));
  }

}