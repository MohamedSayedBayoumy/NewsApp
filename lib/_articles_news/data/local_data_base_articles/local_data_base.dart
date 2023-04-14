import 'package:hive/hive.dart';

abstract class BaseLocalArticlesData {
  Future<List> fetchLocalArticlesData();
}

class LocalArticlesData implements BaseLocalArticlesData {
  @override
  Future<List> fetchLocalArticlesData() async {
    print("object");
    var box = await Hive.openBox('CacheData');

    return box.get("CacheData");
  }
}
