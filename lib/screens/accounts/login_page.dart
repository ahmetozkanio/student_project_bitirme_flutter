import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/screens/home.dart';
import '/apis/auth/login_services.dart';
import '/apis/auth/progress_hud.dart';
import '/screens/accounts/utils/Form_helper.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  bool hidePassoword = true;
  bool isApiCallProcess = false;
  bool? responseThis;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        body: ProgressHUD(
          child: _loginUiSetup(context),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ), //Bekle Progress hud kullandik direk yuklemek yerine
      ),
    );
  }

  Widget _loginUiSetup(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFormKey,
          child: _loginUi(context),
        ),
      ),
    );
  }

  Widget _loginUi(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: FormHelper.inputFieldWidget(
              context,
              Icon(Icons.verified_user),
              "username",
              "username",
              (onValudateValue) {
                if (onValudateValue.isEmpty) {
                  return "Username giriniz";
                }
                return null;
              },
              (onSavedValue) {
                _username = onSavedValue.toString().trim();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: FormHelper.inputFieldWidget(
                context,
                Icon(
                  Icons.lock,
                ),
                "password",
                "password", (onValudateValue) {
              if (onValudateValue.isEmpty) {
                return "password giriniz";
              }
              return null;
            }, (onSavedValue) {
              _password = onSavedValue.toString().trim();
            },
                initialValue: "",
                obscureText: hidePassoword,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassoword = !hidePassoword;
                      });
                    },
                    color: Colors.blue.withOpacity(0.4),
                    icon: Icon(hidePassoword
                        ? Icons.visibility_off
                        : Icons.visibility))),
          ),
          SizedBox(
            height: 20,
          ),
          if (responseThis == false)
            Center(
              child: Column(
                children: [
                  Text(
                    "Parola veya Kullanici adiniz yanlis!!",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          Center(
            child: FormHelper.saveButton("Login", () {
              if (validateAndSave()) {
                print("username : $_username");
                print("password : $_password");

                setState(() {
                  this.isApiCallProcess = true;
                });
                LoginApiServices.loginUser(_username, _password)
                    .then((response) {
                  responseThis = response;
                  setState(() {
                    this.isApiCallProcess = false;
                  });
                  print(response);
                  if (response) {
                    globalFormKey.currentState?.reset();
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {}
                });
              }
            }),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        return true;
      }
    }
    return false;
  }
}
