import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeScreenOfHome extends StatefulWidget {
  const HomeScreenOfHome({Key? key}) : super(key: key);

  @override
  _HomeScreenOfHomeState createState() => _HomeScreenOfHomeState();
}

class _HomeScreenOfHomeState extends State<HomeScreenOfHome> {
  bool load = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      load = true;
    });
    await Future.delayed(Duration(seconds: 5), () {
      setState(() {
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: load
            ? SkeletonAnimation(child: Container())
            : CachedNetworkImage(
                imageUrl:
                    "https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
      ),
    );
  }
}
