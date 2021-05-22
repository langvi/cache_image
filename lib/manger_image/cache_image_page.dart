import 'package:flutter/material.dart';
import 'package:manager_image/main.dart';
import 'package:manager_image/manger_image/custom_manager.dart';

class CacheImagePage extends StatefulWidget {
  CacheImagePage({Key? key}) : super(key: key);

  @override
  _CacheImagePageState createState() => _CacheImagePageState();
}

class _CacheImagePageState extends State<CacheImagePage> {
  String str1 =
      "https://icdn.dantri.com.vn/zoom/1200_630/2019/08/27/tuan-chau-1566861427217.jpg";
  String str2 =
      "https://www.morningstarhotel.vn/morninghotel-images/product/photo/_NBP0402_FILEminimizer_.jpg";
  @override
  void initState() {
    int? timeImage = preferences!.getInt(KEY_TIME);
    if (timeImage == null) {
      preferences!.setInt(KEY_TIME, DateTime.now().millisecondsSinceEpoch);
    } else {
      int timeNow = DateTime.now().millisecondsSinceEpoch;
      if (timeNow - timeImage > 30000) {
        print('Xóa hình');
        CustomCacheManager.instance.emptyCache();
        preferences!.setInt(KEY_TIME, DateTime.now().millisecondsSinceEpoch);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache Image'),
      ),
      body: Center(
        child: Column(
          children: [
            buildImage(str2),
            buildImage(str1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomCacheManager.instance.emptyCache();
        },
      ),
    );
  }
}
