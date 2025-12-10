import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/wallpaper_model.dart';

class WallpaperService {
  Future<List<Wallpaper>> getWallpapers() async {
    final String response = await rootBundle.loadString('assets/wallpaper.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Wallpaper.fromJson(json)).toList();
  }
}
