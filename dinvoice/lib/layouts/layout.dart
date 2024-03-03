import 'package:dinvoice/pages/account_page.dart';
import 'package:dinvoice/pages/home_page.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final Widget body;
  final AppBar? appBar;
  final BottomNavigationBar? bottomNavigationBar;

  const Layout(
      {super.key, required this.body, this.appBar, this.bottomNavigationBar});

  @override
  State<StatefulWidget> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                shape: const LinearBorder(),
              )),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.blueAccent, width: 0),
        ),
        width: double.infinity,
        child: widget.body,
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
