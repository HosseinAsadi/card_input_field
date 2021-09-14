import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInputField extends StatefulWidget {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  FocusNode? nextFocusNode;
  Function? onChanged;

  CardInputField({this.onChanged, this.nextFocusNode});

  @override
  _CardInputFieldState createState() => _CardInputFieldState();
}

class _CardInputFieldState extends State<CardInputField> {
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  Widget input(
    FocusNode? before,
    FocusNode self,
    FocusNode? next,
    TextEditingController controller,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: SizedBox(
          width: 70.0,
          height: 35.0,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 4,
            style: const TextStyle(fontSize: 14.0, letterSpacing: 5.0),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.only(top: -10.0),
            ),
            // textInputAction: TextInputAction.next,
            focusNode: self,
            // onSubmitted: (String value) {
            //   self.unfocus();
            //   if (next != null) FocusScope.of(context).requestFocus(next);
            // },
            onChanged: (val) {
              if (val.length == 4 && next != null) {
                self.unfocus();
                FocusScope.of(context).requestFocus(next);
              } else if (before != null && val.length == 0) {
                self.unfocus();
                FocusScope.of(context).requestFocus(before);
              } else if (next == null && val.length == 4 && widget.nextFocusNode != null) {
                self.unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
              if (widget.onChanged != null) widget.onChanged!();
            },
          ),
        ),
      );

  Widget box(
    FocusNode? before,
    FocusNode self,
    FocusNode? next,
    TextEditingController controller,
  ) =>
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.only(bottom: 8.0),
        child: input(before, self, next, controller),
      );

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      for (int i = 0; i < widget.controllers.length; i++)
        if (widget.controllers[i].text.length < 4) {
          focusNodes[i].requestFocus();
          break;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          box(null, focusNodes[0], focusNodes[1], widget.controllers[0]),
          box(
            focusNodes[0],
            focusNodes[1],
            focusNodes[2],
            widget.controllers[1],
          ),
          box(
            focusNodes[1],
            focusNodes[2],
            focusNodes[3],
            widget.controllers[2],
          ),
          box(focusNodes[2], focusNodes[3], null, widget.controllers[3]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNodes.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}
