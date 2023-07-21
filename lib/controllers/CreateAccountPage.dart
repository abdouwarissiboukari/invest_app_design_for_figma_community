import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/LoginPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/models/Account.dart';
import 'package:invest_app/models/Gender.dart';
import 'package:invest_app/models/User.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomSnackbar.dart';
import 'package:invest_app/views/CustomTextFormField.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

import '../data/SvgData.dart';
import '../views/CustomIconButtonSvg.dart';
import '../views/CustomScaffold.dart';
import 'Home.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassWordShow = true;
  bool isDispose = true;

  final strTitle = "Create an account";
  final strDescription = "Invest and double your income now";
  final strFullName = "Full Name";
  final strEmail = "Email Address";
  final strPassword = "Password";
  final strFormValationError = "Please fill the inputs";
  final strButtonTex = "Create account";
  final strAlreadyText = "Already have an account?";
  final strErrorText = "Please enter your";

  @override
  void initState() {
    super.initState();
    formKey.currentState?.initState();
    // fullNameController.text = userConnected.fullName;
    // emailController.text = userConnected.email;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
    isDispose = false;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTitleTextView(
                  textValue: strTitle,
                  textColor: appTextColor,
                  textSize: 32,
                ),
                CustomTitleTextView(
                  textValue: strDescription,
                  textColor: appTextColor,
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
                        // Full Name
                        CustomTextFormField(
                          suffixIcon: const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                          obscureText: false,
                          onTextFormFieldValidation: onFullNameValidation,
                          textEditingController: fullNameController,
                          strLabelText: strFullName,
                        ),
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
                            onButtonPressed: onCreateAccountPressed,
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
                                  builder: (BuildContext ctx) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              strAlreadyText,
                              style: GoogleFonts.signika(
                                  color: appPrimaryColor, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onBackPressed() {
    Navigator.pop(context);
  }

  onShowPasswordPressed() {
    setState(() {
      isPassWordShow = !isPassWordShow;
    });
  }

  String? onFullNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '$strErrorText $strFullName';
    }
    return null;
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

  onCreateAccountPressed() async {
    if (formKey.currentState!.validate()) {
      //There must be implemented the logic of userAccount creation

      userConnected = User(
        id: 1,
        fullName: fullNameController.text,
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

      context
          .read<DataProvider>()
          .setUserInfo(isConnected: true, fullName: fullNameController.text);

      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext ctx) => Home(),
        ),
        (_) => false,
      ).then((_) {
        if (isDispose) {
          setState(() {
            formKey.currentState?.reset();
          });
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbar(strTextValue: strFormValationError, context: context),
      );
    }
  }
}
