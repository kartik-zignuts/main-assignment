// ignore: file_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController emailcontroller;

  const EmailFieldWidget({Key? key, required this.emailcontroller})
      : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      // onSaved: (newValue) => print(newValue),
      validator: (email) =>
          !EmailValidator.validate(email!) ? 'Please Enater Your Email' : null,
      controller: widget.emailcontroller,
      decoration: InputDecoration(
        labelText: 'Your Email',
        prefixIcon: const Icon(Icons.mark_email_read),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1.4, color: Colors.grey.shade800)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1.4, color: Colors.grey.shade800)),
      ),
    );
  }
}
