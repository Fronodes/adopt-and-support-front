import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/core_shelf.dart';
import '../../core/services/user/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserApiService api = UserApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _error_text = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            backgroundColor: context.primary,
            pinned: true,
            expandedHeight: context.height * 40,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Lottie.asset('assets/images/pug.json'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: context.horizontalExtreme,
              width: context.width * 60,
              height: context.height * 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.canvas,
                        boxShadow: [BoxShadow(color: context.disabled)]),
                    padding: context.lowPadding,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'email'.translate,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: context.lowPadding,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'password'.translate,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  if (_error_text != '')
                    Text(
                      _error_text!,
                      style: context.bodyText1.copyWith(color: context.error),
                    ),
                  SizedBox(
                    height: context.height * 5,
                  ),
                  ElevatedButton(
                      onPressed: () => api
                              .loginUser(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            var _userProvider = UserProvider();
                            _userProvider.login(value);
                            Navigator.pushReplacementNamed(context, '/home');
                          }).catchError((onError) {
                            setState(() {
                              _error_text = onError.toString();
                            });
                          }),
                      child: Text('login'.translate))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
