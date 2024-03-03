import 'package:dinvoice/components/gap.dart';
import 'package:dinvoice/pages/account/account2_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
              ),
              Text(
                'Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const VerticalGap(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            children: [
              Card(
                color: Colors.white,
                child: ListTile(
                  title: const Text('Account'),
                  leading: const Icon(Icons.account_circle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    debugPrint('account');
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const Account2Page(),
                            type: PageTransitionType.rightToLeft));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Setting'),
                  leading: const Icon(Icons.settings),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    debugPrint('setting');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Contact'),
                  leading: const Icon(Icons.info),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    debugPrint('setting');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
