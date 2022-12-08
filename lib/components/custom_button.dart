import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/utils/custom_theme.dart';

import 'loader.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool loading;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomTheme.orange,
      ),
      child: MaterialButton(
          onPressed: loading ? null : onPress,
          child: loading
              ? const Loader()
              : Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
    );
  }
}
