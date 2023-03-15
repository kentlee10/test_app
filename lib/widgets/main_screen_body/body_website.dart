import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/website.dart';

class WebsiteBody extends StatelessWidget {

  final RefreshController refreshController;
  final Function onRefresh;
  final List<Website> list;
  const WebsiteBody({required this.refreshController, required this.onRefresh, required this.list, super.key});

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
              Website websiteData = list[index];
              return ListTile(
                onTap: (){
                  _launchInWebViewOrVC(Uri.parse(websiteData.pwa_url ?? ''));
                },
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(websiteData.icon ?? '',
                    fit: BoxFit.contain,
                    errorBuilder:
                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },

                  ),
                ),
                title: Text(websiteData.name ?? 'N/A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        )
    );
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          enableDomStorage: true,
          enableJavaScript: true,
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}