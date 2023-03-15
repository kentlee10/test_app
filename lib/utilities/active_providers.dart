import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_app/provider/main_provider.dart';

import 'data_repositories.dart';

class ActiveProviders {
  static List<SingleChildWidget> list = [
    ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(),
    ),
  ];
}
