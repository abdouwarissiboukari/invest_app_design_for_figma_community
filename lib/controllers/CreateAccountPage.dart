import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/HomePage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomScaffoldWithIcon.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';

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

  String strTitle = "Create an account";
  String strDescription = "Invest and double your income now";
  String strFullName = "Full Name";
  String strEmail = "Email Address";
  String strPassword = "Passwaord";
  String strFormValationError = "Please fill the inputs";
  String strButtonTex = "Create account";
  String strAlreadyText = "Already have an account?";

  @override
  void initState() {
    super.initState();
    formKey.currentState?.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScaffoldWithIcon(
      leadingIcon: CustomIconButton(
        onPressed: onBackPressed,
        icon: Icons.arrow_back_ios,
        color: appIconColorGray,
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: TextFormField(
                            controller: fullNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: appPrimaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appInputBorderColor, width: 0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: strFullName,
                              labelStyle: GoogleFonts.signika(
                                color: appInputBorderColor,
                                fontSize: 17,
                              ),
                            ),
                            validator: (value) => onFullNameValidation(value),
                          ),
                        ),
                        // Email Address
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: appPrimaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appInputBorderColor, width: 0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: strEmail,
                              labelStyle: GoogleFonts.signika(
                                color: appInputBorderColor,
                                fontSize: 17,
                              ),
                            ),
                            validator: (value) => onEmailValidation(value),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 33),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: appPrimaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appInputBorderColor, width: 0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: strPassword,
                              labelStyle: GoogleFonts.signika(
                                color: appInputBorderColor,
                                fontSize: 17,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassWordShow = !isPassWordShow;
                                  });
                                },
                                icon: Icon((isPassWordShow)
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            obscureText: isPassWordShow,
                            validator: (value) => onPasswordValidation(value),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 44),
                          child: CustomButton(
                            onButtonPressed: onCreateAccountPressed,
                            buttonTex: strButtonTex,
                            width: size.width,
                            buttonColor: appPrimaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              strAlreadyText,
                              style: GoogleFonts.signika(
                                  color: appPrimaryColor, fontSize: 17),
                            ),
                          ),
                        )
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

  String? onFullNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Full Name';
    }
    return null;
  }

  String? onEmailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email Address';
    }
    return null;
  }

  String? onPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    }
    return null;
  }

  onCreateAccountPressed() {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext ctx) => HomePage(
            strFullName: fullNameController.text,
          ),
        ),
      ).then((_) {
        setState(() {
          formKey.currentState?.reset();
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: appTextColorGray,
          content: CustomTitleTextView(
              textValue: strFormValationError, textColor: appBackgroundColor),
        ),
      );
    }
  }
}
