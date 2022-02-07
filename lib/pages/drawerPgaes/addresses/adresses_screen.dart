import 'package:flutter/material.dart';
import 'dart:math';

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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.shade900),
                width: 40,
                height: 100,
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            child: Container(
              height: 200,
              width: 200,
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
