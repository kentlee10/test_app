import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app/widgets/icon_text.dart';
import '../../model/country.dart';

class CountryBody extends StatelessWidget {

  final RefreshController refreshController;
  final Function onRefresh;
  final List<Country> list;
  const CountryBody({required this.refreshController, required this.onRefresh, required this.list, super.key});

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
              Country countryData = list[index];
              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network('https://flagcdn.com/160x120/${(countryData.alpha_2 ?? '').toLowerCase()}.png',
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
                title: Text(countryData.name ?? 'N/A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(icon: Icons.location_on_sharp, text: (countryData.region ?? '') != '' ? countryData.region ?? '' : 'N/A'),
                    IconText(icon: Icons.info_outline, text: (countryData.sub_region ?? '') != '' ? countryData.sub_region ?? '' : 'N/A')
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        )
    );
  }
}