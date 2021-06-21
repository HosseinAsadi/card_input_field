import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInputField extends StatefulWidget {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  _CardInputFieldState createState() => _CardInputFieldState();
}

class _CardInputFieldState extends State<CardInputField> {
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  Widget input(
      FocusNode self,
      FocusNode next,
      TextEditingController controller,
      ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: SizedBox(
          width: 12.0,
          height: 35.0,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 1,
            showCursor: false,
            style: TextStyle(fontSize: 14.0),
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
              self.unfocus();
              if (next != null) FocusScope.of(context).requestFocus(next);
              return val;
            },
          ),
        ),
      );

  Widget box(
      FocusNode self1,
      FocusNode next1,
      FocusNode self2,
      FocusNode next2,
      FocusNode self3,
      FocusNode next3,
      FocusNode self4,
      FocusNode next4,
      TextEditingController controller1,
      TextEditingController controller2,
      TextEditingController controller3,
      TextEditingController controller4,
      ) =>
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            input(self1, next1, controller1),
            input(self2, next2, controller2),
            input(self3, next3, controller3),
            input(self4, next4, controller4),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          box(
            focusNodes[0],
            focusNodes[1],
            focusNodes[1],
            focusNodes[2],
            focusNodes[2],
            focusNodes[3],
            focusNodes[3],
            focusNodes[4],
            widget.controllers[0],
            widget.controllers[1],
            widget.controllers[2],
            widget.controllers[3],
          ),
          box(
            focusNodes[4],
            focusNodes[5],
            focusNodes[5],
            focusNodes[6],
            focusNodes[6],
            focusNodes[7],
            focusNodes[7],
            focusNodes[8],
            widget.controllers[4],
            widget.controllers[5],
            widget.controllers[6],
            widget.controllers[7],
          ),
          box(
            focusNodes[8],
            focusNodes[9],
            focusNodes[9],
            focusNodes[10],
            focusNodes[10],
            focusNodes[11],
            focusNodes[11],
            focusNodes[12],
            widget.controllers[8],
            widget.controllers[9],
            widget.controllers[10],
            widget.controllers[11],
          ),
          box(
            focusNodes[12],
            focusNodes[13],
            focusNodes[13],
            focusNodes[14],
            focusNodes[14],
            focusNodes[15],
            focusNodes[15],
            null,
            widget.controllers[12],
            widget.controllers[13],
            widget.controllers[14],
            widget.controllers[15],
          ),
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
