import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameTextEditingController = TextEditingController();
  var _username = '';

  //drpe down menu
  final _itemsOfDropdownmenu = ['He', 'She', 'Other', 'Not Prefer to Say'];
  String? selectedValue;

  //radio
  // int? _radioGroup;
  int? selectedLang;

  //swich
  bool isSwiched = false;

//check box
  var checkBoxValue = false;

  void onofShowtext(bool val) {}
  @override
  void initState() {
    // _radioGroup = 0;
    selectedLang = 0;
    super.initState();
  }

  void liveUserName(String usernamtext) {
    setState(() {
      _username = usernameTextEditingController.text;
    });
  }

  void selectedLanguge(int val) {
    setState(() {
      selectedLang = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome $_username!!',
                  style: GoogleFonts.fjordOne(
                    textStyle: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),

              //username text field
              SizedBox(
                height: 49,
                child: TextFormField(
                  controller: usernameTextEditingController,
                  onChanged: (value) => liveUserName(value),
                  decoration: InputDecoration(
                      hintText: 'Your Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              //dropdown menu
              const SizedBox(
                height: 25,
              ),

              Text(
                '#1 What we call you?',
                style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              Container(
                margin: const EdgeInsets.only(top: 5),
                // width: 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green.shade900,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    iconEnabledColor: Colors.green.shade900,
                    iconDisabledColor: Colors.green.shade900,
                    iconSize: 30,
                    elevation: 6,
                    hint: const Text('Xander'),
                    value: selectedValue,
                    items: _itemsOfDropdownmenu
                        .map(buildDropdownmenuItem)
                        .toList(),
                    onChanged: (value) {
                      selectedValue = value as String?;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //redio buttons

              Text(
                '#2 Which language are you learning?',
                style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Column(children: [
                RadioListTile(
                  selected: false,
                  value: 0,
                  groupValue: selectedLang,
                  activeColor: Colors.green.shade900,
                  onChanged: (val) {
                    selectedLanguge(val as int);
                  },
                  title: const Text('Java'),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedLang,
                  activeColor: Colors.green.shade900,
                  onChanged: (val) {
                    selectedLanguge(val as int);
                  },
                  title: const Text('Kotlin'),
                ),
                RadioListTile(
                  value: 3,
                  groupValue: selectedLang,
                  activeColor: Colors.green.shade900,
                  onChanged: (val) {
                    selectedLanguge(val as int);
                  },
                  title: const Text('Dart'),
                ),
              ]),

              //swich code
              // const SizedBox(
              //   height: 25,
              // ),

              // Row(
              //   children: [
              // Text(
              //   '#3 Product Update Notificatons',
              //   style: TextStyle(
              //       color: Colors.green.shade900,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold),
              // ),
              SwitchListTile(
                  // secondary: const Icon(
                  //   Icons.notification_add,
                  //   size: 26,
                  // ),
                  activeColor: Colors.green.shade900,
                  title: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          const TextSpan(text: '#3 Product Notificatons '),
                          TextSpan(text: isSwiched ? 'on' : 'off')
                        ]),
                  ),
                  value: isSwiched,
                  onChanged: (onoff) {
                    setState(() {
                      isSwiched = onoff;
                    });
                  }),

              //chek box

              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Transform.scale(
                    scale: 1.1,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'I have read all the T&C cairfully\nand  I am fully agree with it.',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.w500),
                      ),
                      activeColor: Colors.green.shade900,
                      value: checkBoxValue,
                      onChanged: (yesno) {
                        setState(() {
                          checkBoxValue = yesno as bool;
                        });
                      },
                    ),
                  ),
                ],
              ),

              // show dialog
              Container(
                margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Are you sure?',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'This data will be store in our server',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.w500),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Cancle',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green.shade900,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () => Navigator.popAndPushNamed(
                                      context, 'register'),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green.shade900,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 9),
                        primary: Colors.green.shade900,
                        onPrimary: Colors.green.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text('Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildDropdownmenuItem(String item) =>
      DropdownMenuItem(
        child: Text(item,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.green.shade900,
                fontSize: 20)),
        value: item,
      );
}
