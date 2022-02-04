import 'package:assignment_app/pages/home/widget/navigatore_drawer.dart';
import 'package:flutter/material.dart';

class PaymentMethodPge extends StatefulWidget {
  const PaymentMethodPge({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPge> createState() => _PaymentMethodPgeState();
}

class _PaymentMethodPgeState extends State<PaymentMethodPge> {
  double _opacity = 1;
  Color _color = Colors.green.shade900;
  double _width = 250;
  double _margin = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        color: _color,
        margin: EdgeInsets.all(_margin),
        width: _width,
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () {
                setState(() {
                  _color = Colors.red;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.high_quality),
              onPressed: () {
                setState(() {
                  _margin = 100;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
