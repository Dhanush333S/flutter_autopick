import 'package:auto_pick/responsive/mobile_layout.dart';
import 'package:auto_pick/responsive/web_layout.dart';
import 'package:auto_pick/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<600)
      return SignUpScreen();
      else
      return WebLayout();
    });
  }
}