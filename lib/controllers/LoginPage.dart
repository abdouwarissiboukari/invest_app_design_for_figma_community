import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/CreateAccountPage.dart';
import 'package:invest_app/controllers/Home.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/models/Account.dart';
import 'package:invest_app/models/Gender.dart';
import 'package:invest_app/models/User.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomScaffoldWithIcon.dart';
import 'package:invest_app/views/CustomSnackbar.dart';
import 'package:invest_app/views/CustomTextFormField.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

import '../data/SvgData.dart';
import '../views/CustomIconButtonSvg.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final strTitle = "Login";
  final strDescription = "Invest and double your income now";
  final strEmail = "Email Address";
  final strPassword = "Password";
  final strFormValationError = "Please fill the inputs";
  final strConnexioxErrorText = "Email or password incerrect";
  final strButtonTex = "Connexion";
  final strNotHaveText = "Not have an account?";
  final strErrorText = "Please enter your";
  bool isPassWordShow = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey.currentState?.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithIcon(
        drawer: const SizedBox(
          height: 0,
          width: 0,
        ),
        leadingIcon: CustomIconButtonSvg(
          onPressed: () => Navigator.pop(context),
          icon: backArrowSvg,
          color: context.watch<DataProvider>().appTextColor_dp,
        ),
        trailingIcon: const SizedBox(
          height: 0,
          width: 0,
        ),
        bodyWidget: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomTitleTextView(
                textValue: strTitle,
                textColor: context.watch<DataProvider>().appTextColor_dp,
                textSize: 32,
              ),
              CustomTitleTextView(
                textValue: strDescription,
                textColor: context.watch<DataProvider>().appTextColor_dp,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 70,
                    horizontal: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Email Address
                      CustomTextFormField(
                          suffixIcon: const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                          obscureText: false,
                          onTextFormFieldValidation: onEmailValidation,
                          textEditingController: emailController,
                          strLabelText: strEmail),
                      // Password
                      CustomTextFormField(
                          suffixIcon: CustomIconButton(
                              onPressed: onShowPasswordPressed,
                              icon: (isPassWordShow)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: appInputBorderColor),
                          obscureText: isPassWordShow,
                          onTextFormFieldValidation: onPasswordValidation,
                          textEditingController: passwordController,
                          strLabelText: strPassword),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 44),
                        child: CustomButton(
                          onButtonPressed: onConnexionPressed,
                          buttonTex: strButtonTex,
                          width: deviceSize.width,
                          buttonColor: appPrimaryColor,
                          textColor: appButtonTextColor,
                          textSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext ctx) =>
                                    CreateAccountPage(),
                              ),
                            );
                          },
                          child: Text(
                            strNotHaveText,
                            style: GoogleFonts.signika(
                                color: appPrimaryColor, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  onBackPressed() {
    Navigator.pop(context);
  }

  onShowPasswordPressed() {
    setState(() {
      isPassWordShow = !isPassWordShow;
    });
  }

  String? onEmailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '$strErrorText $strEmail';
    }

    return null;
  }

  String? onPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '$strErrorText $strPassword';
    }

    return null;
  }

  Future<void> onConnexionPressed() async {
    if (formKey.currentState!.validate()) {
      if (emailController.text == 'x7log' &&
          passwordController.text == 'rush7') {
        context.read<DataProvider>().setIsConnect(true);

        userConnected = User(
          id: 1,
          fullName: "Warren Buffet",
          gender: Gender.male,
          birthdate: DateTime(1987, 4, 7),
          email: "warren.buff@invest.ai",
          urlProfile: "assets/profil.png",
          level: "Expert",
        );

        defaultAccount = Account(
          userId: 1,
          accountNumber: "70009899443X",
          accountName: "House Investment",
          accountBalance: 203935,
        );

        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx) => Home(),
          ),
          (_) => false,
        ).then((value) => formKey.currentState?.reset());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar(strTextValue: strConnexioxErrorText, context: context),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbar(strTextValue: strFormValationError, context: context),
      );
    }
  }
}
