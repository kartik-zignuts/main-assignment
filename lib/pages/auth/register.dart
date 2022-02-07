import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);
  final textcontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //API CALLING
  // callLoginApi() {
  //   final service = ApiServices();

  //   service.apiCallLogin(
  //     {
  //       "EMAIL": "email",
  //       "PASSWORD": "password",
  //       "DEVICE_TOKEN": "device_token",
  //       "DEVICE_TYPE": "device_type",
  //       "CATEGORY_ID": "2",
  //     },
  //   ).then((value) {
  //     if (value.error != null) {
  //       print("get data >>>>>> " + value.error!);
  //     } else {
  //       print(value.token!);
  //       //push
  //     }
  //   });
  // }

  static final baseURL = Uri.parse(
      "https://e3-qkmountain.qkinnovations.com/qkm-andermatt-backend/api/user/appLogin");
  // static final postsEndpoint = baseURL + "user/appLogin";
  // int device_token = 1;
  // String? device_type = "A";
  // int category_id = 2;
  Future createPost() async {
    // final url = Uri.parse(postsEndpoint);
    final response = await http.post(baseURL,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': widget.textcontroller.text,
          'password': widget.emailcontroller.text,
          'device_token': "1",
          'device_type': 'A',
          'category_id': "2"
        }));
    print(response.body);
    return jsonDecode(response.body);
  }

// //
//   savetext(String? savedtext) async {
//     final SharedPreferences text = await SharedPreferences.getInstance();
//     text.setString('textkey', savedtext!);
//   }

//   readtext() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? currentText = prefs.getString('textkey');
//     if (currentText != null) {
//       widget.textcontroller.text = currentText;
//     }
//     return;
//   }

//   @override
//   void initState() {
//     super.initState();
//     readtext();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                    tag: '10D',
                    child: Image(
                        image: NetworkImage(
                            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png"))),
                TextField(
                  controller: widget.textcontroller,
                  // onChanged: (value) => savetext(value),
                ),
                TextField(
                  controller: widget.emailcontroller,
                ),
                const SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                    child: const Icon(Icons.next_plan),
                    onPressed: () => {
                          Navigator.popAndPushNamed(context, 'dashBoard'),
                          createPost(),
                          // createPost(widget.textcontroller.text,
                          //     widget.emailcontroller.text)
                          // callLoginApi(),
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// @JsonSerializable()
// class Post {
//   Post({
//     this.id,
//     this.userId,
//     this.title,
//     this.body,
//   });

//   int? id;
//   int? userId;
//   String? title;
//   String? body;
//   factory Post.fromJson(Map<String, String> json) => _$PostFromJson(json);

//   Map<String, String> toJson() => _$PostToJson(this);
// }

// Widget buildButton()=>ButtoneWidget(text: 'Login', onclicked: (){final form=formKey.cu})
