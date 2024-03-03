import 'dart:async';

import 'package:dinvoice/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Account2Page extends StatefulWidget {
  const Account2Page({super.key});

  @override
  State<StatefulWidget> createState() => _Account2PageState();
}

class _Account2PageState extends State<Account2Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordConfirmationController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isNewPasswordConfirmationVisible = false;

  bool _sendButtonEnabled = false;
  late Timer _resendTimer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _sendButtonEnabled = true;
      });
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _storeNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Store Name',
                          icon: Icon(
                            Icons.storefront,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          icon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          icon: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _pinController,
                              decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.key,
                                  ),
                                  labelText: 'PIN'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your PIN';
                                }
                                return null;
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _sendButtonEnabled
                                ? () {
                                    // Simulate resend action
                                    print('Send action triggered');
                                    setState(() {
                                      _sendButtonEnabled = false;
                                    });
                                    _startResendTimer();
                                  }
                                : null,
                            child: Text('Send PIN'),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: _currentPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_isCurrentPasswordVisible, // This property hides the entered text
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          icon: const Icon(
                            Icons.key,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_isNewPasswordVisible, // This property hides the entered text
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          icon: const Icon(
                            Icons.key,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isNewPasswordVisible = !_isNewPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _newPasswordConfirmationController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_isNewPasswordConfirmationVisible, // This property hides the entered text
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'New Password Confirmation',
                          icon: const Icon(
                            Icons.key,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isNewPasswordConfirmationVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isNewPasswordConfirmationVisible = !_isNewPasswordConfirmationVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
