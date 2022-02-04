import 'package:assignment_app/pages/home/widget/navigatore_drawer.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      drawer: const Navigation_drawer(),
    );
  }
}
