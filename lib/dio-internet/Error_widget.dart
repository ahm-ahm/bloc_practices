import 'package:flutter/material.dart';

class SingleErrorTryAgainWidget extends StatelessWidget {
  final VoidCallback onClick;
  final double bottomMargin;
  final String? message;

  const SingleErrorTryAgainWidget({required this.onClick, required this.bottomMargin,this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: bottomMargin),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(message??'NO_CONNECTION', style: TextStyle(fontSize: 17)),
              const SizedBox(height: 10),
              SizedBox(
                  width: 110,
                  height: 35,
                  child: AppButton(
                      text:  Text('TRY_AGAIN',
                          style: TextStyle( fontSize: 15)),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(width: 1), borderRadius: BorderRadius.all(Radius.circular(30))),
                      onClick: onClick, backgroundColor: Colors.red,
                     ))
            ],
          )),
    );
  }
}



class AppButton extends StatelessWidget {
  final RoundedRectangleBorder shape;
  final Color? borderColor;
  final VoidCallback onClick;
  final Color backgroundColor;
  final Text text;

  const AppButton(
      {required this.text,
        required this.shape,
        required this.onClick,
        required this.backgroundColor,
        this.borderColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: const BoxConstraints(maxHeight: 44),
        onPressed: onClick,
        shape: shape,
        padding: const EdgeInsets.all(0),
        child: Ink(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: shape.borderRadius,
              border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null),
          child: Align(child: text),
        ));
  }
}
