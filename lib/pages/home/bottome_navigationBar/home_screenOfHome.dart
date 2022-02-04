import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreenOfHome extends StatefulWidget {
  const HomeScreenOfHome({Key? key}) : super(key: key);

  @override
  _HomeScreenOfHomeState createState() => _HomeScreenOfHomeState();
}

class _HomeScreenOfHomeState extends State<HomeScreenOfHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "http://via.placeholder.com/350x150",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
