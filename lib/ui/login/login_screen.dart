import 'package:flutter/material.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/bloc/provider.dart';
import 'package:app/bloc/notifier/loginnotifier.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _fnEmail = FocusNode();
  final FocusNode _fnPassword = FocusNode();
  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Consumer(builder: (context, watch, child) {
              final state = watch(loginNotifierProvider);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  TextFormField(
                    controller: _email,
                    focusNode: _fnEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.isEmpty ? 'Silahkan isi email' : null,
                    decoration: InputDecoration(),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _password,
                    focusNode: _fnPassword,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.isEmpty ? 'Silahkan isi password' : null,
                    decoration: InputDecoration(),
                  ),
                  const SizedBox(height: 30),
                  Container(
                      width: sizer.width / 2,
                      height: 60,
                      child: RaisedButton(
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              context.read(loginNotifierProvider.notifier).storeData(
                                    _email.text.trim(),
                                    _password.text.trim(),
                                  );
                            }
                          },
                          child: TextDesign(
                            data: 'Sign in',
                            fontWeight: FontWeight.w600,
                          ))),
                  state is LoginLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                  state is LoginComplete ? TextDesign(data: 'Berhasil') : Container(),
                ]),
              );
            }),
          ),
        )));
  }
}
