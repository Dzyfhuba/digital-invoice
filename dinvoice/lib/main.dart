import 'package:dinvoice/layouts/layout.dart';
import 'package:dinvoice/pages/account_page.dart';
import 'package:dinvoice/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinvoice',
      theme: ThemeData(
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          shape: const LinearBorder(),
        ),
      ),
      home: const AppControl(),
    );
  }
}

class AppControl extends StatefulWidget {
  const AppControl({super.key});

  @override
  State<AppControl> createState() => _AppControlState();
}

class _AppControlState extends State<AppControl> {
  int currentPage = 0;

  var pages = [const HomePage(), const AccountPage()];

  void setCurrentPage(int pageIndex) {
    setState(() {
      currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Layout(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: Colors.black,
          onTap: (idx) {
            setCurrentPage(idx);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
              activeIcon: Icon(Icons.person),
            ),
          ],
        ));
  }
}
