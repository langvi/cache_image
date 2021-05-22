import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

const KEY_TIME = 'key_time';
Widget buildImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    fadeInDuration: Duration(milliseconds: 200),
    cacheManager: CustomCacheManager.instance,
  );
}

class CustomCacheManager {
  static const key = 'cacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      maxNrOfCacheObjects: 40,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );
}
