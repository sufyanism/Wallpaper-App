import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../model/wallpaper_model.dart';

class WallpaperDetailScreen extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperDetailScreen({super.key, required this.wallpaper});

  Future<void> downloadWallpaper(BuildContext context, String url, String name) async {
    try {
      Directory appDir = await getApplicationDocumentsDirectory();
      String savePath = '${appDir.path}/$name.jpg';

      await Dio().download(url, savePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wallpaper saved to $savePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving wallpaper: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: wallpaper.id,
              child: CachedNetworkImage(
                imageUrl: wallpaper.url,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 50, color: Colors.red),
              ),
            ),
          ),
          // Top AppBar overlay
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () => Share.share(wallpaper.url),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom overlay info
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          wallpaper.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Backdrops', // author placeholder
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'download_${wallpaper.id}',
                    backgroundColor: Colors.white,
                    mini: true,
                    child: const Icon(Icons.download, color: Colors.black),
                    onPressed: () => downloadWallpaper(
                      context,
                      wallpaper.url,
                      "wallpaper_${wallpaper.id}_${DateTime.now().millisecondsSinceEpoch}",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
