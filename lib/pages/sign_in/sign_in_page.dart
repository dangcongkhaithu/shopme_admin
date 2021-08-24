import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopme_admin/blocs/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:shopme_admin/blocs/get_user_profile_bloc/get_user_profile_state.dart';
import 'package:shopme_admin/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopme_admin/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:shopme_admin/data/schemas/request/sign_in/request_sign_in.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/pages/homepage/home_page.dart';
import 'package:shopme_admin/resources/app_colors.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  late SharedPref _sharedPref;
  late SignInBloc _signInBloc;
  late GetUserProfileBloc _getUserProfileBloc;
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    _sharedPref = getIt<SharedPref>();
    _signInBloc = getIt<SignInBloc>();
    _getUserProfileBloc = getIt<GetUserProfileBloc>();

    _signInBloc.stream.listen((event) {
      if(event is SignInSuccessState) {
        _sharedPref.storeToken(event.response.token);
        _getUserProfileBloc.getUserProfile(_sharedPref.token);
      }
    });

    _getUserProfileBloc.stream.listen((event) {
      if(event is GetUserProfileSuccessState) {
        if(event.userProfile.user.role == "admin") {
          Navigator.of(context).push(HomePage.getRoute());
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _signInBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  width: 100,
                  height: 100,
                  child: FlutterLogo(),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              SizedBox(
                width: 286,
                child: _buildForm(),
              ),
              const SizedBox(
                height: 64,
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: 286,
      height: 35,
      child: TextButton(
        onPressed: () {
          RequestSignIn request = new RequestSignIn(
            email: email,
            password: password,
          );
          _signInBloc.signIn(request);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: Text(
          "Sign In",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) => email = value,
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              labelText: 'Email',
              hintText: 'Enter valid mail id as abc@gmail.com',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) => password = value,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              labelText: 'Password',
              hintText: 'Enter your secure password',
            ),
          ),
        ),
      ],
    );
  }
}
