import 'package:flutter/material.dart';
import 'package:insta_clone/Utilities/colors.dart';
import 'package:insta_clone/Utilities/dimensions.dart';
import 'package:insta_clone/providers/user_providers.dart';
import 'package:provider/provider.dart';

class Responsivelayout extends StatefulWidget {
  final Widget mobileScreenLayout;

  const Responsivelayout({Key? key, required this.mobileScreenLayout})
      : super(key: key);

  @override
  State<Responsivelayout> createState() => _ResponsivelayoutState();
}

class _ResponsivelayoutState extends State<Responsivelayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData() async {
    UserProvider _userprovider = Provider.of(context, listen: false);
    await _userprovider.refreshUser();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreenlayout) {
          return widget.mobileScreenLayout;
        } else {
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
