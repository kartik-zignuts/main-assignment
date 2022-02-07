import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatefulWidget {
  AddressesPage({Key? key}) : super(key: key);

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  var sliderval = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Addresses'),
        ),
        body: Column(children: [
          Center(
            child: Slider(
              value: sliderval,
              onChanged: (value) => setState(() {
                sliderval = value;
              }),
            ),
          ),
          Transform.rotate(
            angle: sliderval,
            child: Transform.scale(
              scale: sliderval,
              child: Container(
                decoration: BoxDecoration(
                    // image: const DecorationImage(
                    //     image: NetworkImage(
                    //         'https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png')),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.shade900),
                width: 40,
                height: 100,
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            child: GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, 'register'),
              child: Container(
                height: 200,
                width: 200,
                child: const Hero(
                    tag: '10D',
                    child: Image(
                        image: NetworkImage(
                            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png"))),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade900,
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                        spreadRadius: 4,
                      )
                    ]),
              ),
            ),
            duration: const Duration(seconds: 3),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: value * 30,
                  ),
                  child: child,
                ),
              );
            },
          )
        ]));
  }
}
