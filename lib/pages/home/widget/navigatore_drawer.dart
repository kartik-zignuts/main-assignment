import 'package:assignment_app/pages/drawerPgaes/addresses/adresses_screen.dart';
import 'package:assignment_app/pages/drawerPgaes/paymentMethod/payment_mathod.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Navigation_drawer extends StatelessWidget {
  const Navigation_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.green.shade800,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 1,
                      right: 1,
                      child: IconButton(
                          iconSize: 34,
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                    ),
                    const ProfilrHeader()
                  ],
                ),
                height: 130,
                color: Colors.green.shade900,
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                height: 20,
              ),
              buildmenu(
                icon: Icons.monetization_on,
                text: 'Payment Method',
                onclick: () => selectitemnextpage(context, 0),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.location_on,
                text: 'Addresses',
                onclick: () => selectitemnextpage(context, 1),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.lock,
                text: 'Password',
                onclick: () => selectitemnextpage(context, 2),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.people,
                text: 'Household',
                onclick: () => selectitemnextpage(context, 3),
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Divider(
                  thickness: 1.1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              buildmenu(
                icon: Icons.info,
                text: 'User info',
                onclick: () => selectitemnextpage(context, 4),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.chat,
                text: 'Contact us',
                onclick: () => selectitemnextpage(context, 5),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.file_copy,
                text: 'Terms & conditions',
                onclick: () => selectitemnextpage(context, 6),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.question_answer,
                text: 'FAQ',
                onclick: () => selectitemnextpage(context, 7),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.photo_album_outlined,
                text: 'About the App',
                onclick: () => selectitemnextpage(context, 8),
              ),
              const SizedBox(
                height: 4,
              ),
              buildmenu(
                icon: Icons.logout,
                text: 'Logout',
                onclick: () => selectitemnextpage(context, 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildmenu({
  required IconData icon,
  required String text,
  VoidCallback? onclick,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
      hoverColor: Colors.white70,
      onTap: onclick,
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

void selectitemnextpage(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddressesPage(),
      ));

      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;

    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 8:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
    case 9:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PaymentMethodPge(),
      ));

      break;
  }
}

class ProfilrHeader extends StatelessWidget {
  const ProfilrHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 55),
      child: InkWell(
        onTap: null,
        // height: 60,
        child: ListTile(
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295429_960_720.png'),
          ),
          title: Text(
            'Kartik Patel',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          subtitle: Text(
            'Edit',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
