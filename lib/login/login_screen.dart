import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/login/login_controller.dart';

import '../app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: LoginController.to.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const Text('Online Shop',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: LoginController.to.usernameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  if (value.length < 5) {
                    return 'Username must be atleast 5 letters';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: LoginController.to.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  if (value.length < 5) {
                    return 'Password must be atleast 5 letters';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  GetX<LoginController>(builder: (logic) {
                    return Checkbox(
                        value: logic.rememberMe.value,
                        onChanged: (value) {
                          logic.rememberMe.value = !logic.rememberMe.value;
                          print(logic.rememberMe.value);
                        });
                  }),
                  const Text('Remember Me')
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        if (LoginController.to.formKey.currentState!.validate()) {
                          LoginController.to.login();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Login'),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
