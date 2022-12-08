import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final bool password;

  const CustomTextInput({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.icon,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          SizedBox(
            height: 50,
            child: TextField(
              obscureText: password,
              autocorrect: !password,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 22, end: 20),
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: placeholder,
                  fillColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
