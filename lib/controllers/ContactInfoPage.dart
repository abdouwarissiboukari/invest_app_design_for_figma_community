import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomScaffold.dart';
import 'package:invest_app/views/CustomTextView.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import '../data/SvgData.dart';
import '../main.dart';
import '../services/DataProvider.dart';
import '../views/CustomIconButtonSvg.dart';

class ContactInfoPage extends StatefulWidget {
  @override
  ContactInfoPageState createState() {
    return ContactInfoPageState();
  }
}

class ContactInfoPageState extends State<ContactInfoPage> {
  final formKey = GlobalKey<FormState>();
  final contactInfoTex = "Contact info";
  final strErrorText = "Please enter your";
  final strName = "Name";
  final strBirthdate = "Birthdate";
  final strGender = "Gender";
  final strEmail = "Email";
  final strPhoneNumber = "Phone Number";
  final strAddress = "Address";
  DateTime initialDate = DateTime.now();

  TextEditingController strNameController = TextEditingController();
  TextEditingController strBirthdateController = TextEditingController();
  TextEditingController strGenderController = TextEditingController();
  TextEditingController strEmailController = TextEditingController();
  TextEditingController strPhoneNumberController = TextEditingController();
  TextEditingController strAddressController = TextEditingController();

  File? imageFile;
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    formKey.currentState?.initState();
    strNameController.text = userConnected.fullName;
    strBirthdateController.text = userConnected.getBirthdate;
    strGenderController.text = userConnected.gender.name;
    strEmailController.text = userConnected.email;
    strPhoneNumberController.text = userConnected.phoneNumber;
    strAddressController.text = userConnected.address;
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    strNameController.dispose();
    strBirthdateController.dispose();
    strGenderController.dispose();
    strEmailController.dispose();
    strPhoneNumberController.dispose();
    strAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitleText: contactInfoTex,
      leadingIcon: CustomIconButtonSvg(
        onPressed: () => Navigator.of(context).pop(),
        icon: backArrowSvg,
        color: context.watch<DataProvider>().appTextColor_dp,
      ),
      trailingIcon: const SizedBox(
        height: 0,
        width: 0,
      ),
      bodyWidget: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: appImageOpacityColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            appImageOpacityColor.withOpacity(0.4),
                            BlendMode.dstATop),
                        image: AssetImage(userConnected.urlProfile),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(15, 0),
                    child: CustomIconButtonSvg(
                      onPressed: () => imagePicker(1),
                      icon: editSvg,
                      color: context
                          .watch<DataProvider>()
                          .appWidgetBackgroundColor_dp,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customTextFormField(
                        textEditingController: strNameController,
                        strLabelText: strName,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'name',
                        onTap: () {},
                      ),
                      customTextFormField(
                        textEditingController: strBirthdateController,
                        strLabelText: strBirthdate,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'birthday',
                        keyboardInput: TextInputType.none,
                        onTap: () => showBirthdayPicker(),
                      ),
                      customTextFormField(
                        textEditingController: strGenderController,
                        strLabelText: strGender,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'gender',
                        onTap: () {},
                      ),
                      customTextFormField(
                        textEditingController: strEmailController,
                        strLabelText: strEmail,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'email',
                        keyboardInput: TextInputType.emailAddress,
                        onTap: () {},
                      ),
                      customTextFormField(
                        textEditingController: strPhoneNumberController,
                        strLabelText: strPhoneNumber,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'phone',
                        keyboardInput: TextInputType.phone,
                        onTap: () {},
                      ),
                      customTextFormField(
                        textEditingController: strAddressController,
                        strLabelText: strAddress,
                        onTextFormFieldValidation: onControllerValidation,
                        controllerText: 'address',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextFormField({
    required TextEditingController textEditingController,
    required String strLabelText,
    required Function(String? value, String controller)
        onTextFormFieldValidation,
    required String controllerText,
    TextInputType keyboardInput = TextInputType.text,
    required Function() onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: TextFormField(
          controller: textEditingController,
          style: GoogleFonts.signika(
            color: context.watch<DataProvider>().appTextColor_dp,
            fontSize: 17,
          ),
          keyboardType: keyboardInput,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: appPrimaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.watch<DataProvider>().appInputBorderColor_dp,
                width: 0.5,
              ),
            ),
            labelText: strLabelText,
            labelStyle: GoogleFonts.signika(
              color: context.watch<DataProvider>().appInputBorderColor_dp,
              fontSize: 17,
            ),
            suffixIcon: TextButton(
              onPressed: () {},
              child: CustomTextView(
                textValue: "Change",
                textColor: appPrimaryColor,
                fontSize: 10,
              ),
            ),
          ),
          validator: (value) =>
              onTextFormFieldValidation(value, controllerText),
          onTap: onTap,
        ),
      ),
    );
  }

  String? onControllerValidation(String? value, String controller) {
    if (value == null || value.isEmpty) {
      switch (controller) {
        case 'name':
          return '$strErrorText $strName';
        case 'birthdate':
          return '$strErrorText $strBirthdate';
        case 'gender':
          return '$strErrorText $strGender';
        case 'email':
          return '$strErrorText $strEmail';
        case 'phone':
          return '$strErrorText $strPhoneNumber';
        case 'address':
          return '$strErrorText $strAddress';
        default:
          return null;
      }
    }
    return null;
  }

  Future<void> showBirthdayPicker() async {
    if (blOsType) {
      onShowCupertinoActionSheet(
        CupertinoDatePicker(
          onDateTimeChanged: (value) {
            setState(() {
              userConnected.birthdate = value;
              strBirthdateController.text = userConnected.getBirthdate;
            });
          },
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          minimumDate: DateTime(1970),
          maximumDate: DateTime(2023, 12),
        ),
      );
    } else {
      await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1970),
        lastDate: DateTime(2023, 12),
        cancelText: "Annuler".toUpperCase(),
        locale: const Locale('fr'),
        initialDatePickerMode: DatePickerMode.year,
      ).then((value) {
        if (value != null) {
          setState(() {
            userConnected.birthdate = value;
          });
        }
      });
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  onShowCupertinoActionSheet(Widget child) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext btcx) => CupertinoActionSheet(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton(
              child:
                  CustomTextView(textValue: "Ok", textColor: appPrimaryColor),
              onPressed: () {
                Navigator.of(btcx).pop();
              },
            ),
          ],
        ),
        actions: [
          Container(
            height: 300,
            padding: const EdgeInsets.only(top: 6.0),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  onShowCupertinoDialog(Widget child) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext btcx) => CupertinoAlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton(
              child:
                  CustomTextView(textValue: "Ok", textColor: appPrimaryColor),
              onPressed: () {
                Navigator.of(btcx).pop();
              },
            ),
          ],
        ),
        actions: [
          Container(
            height: 300,
            padding: const EdgeInsets.only(top: 6.0),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Future imagePicker(int choice) async {
    XFile? imageSelect;
    if (choice == 1) {
      imageSelect = await picker.pickImage(source: ImageSource.gallery);
    } else if (choice == 2) {
      imageSelect = await picker.pickImage(source: ImageSource.camera);
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String appPath = appDirectory.path;

    setState(() {
      if (imageSelect == null) {
        imageFile = null;
      } else {
        // final String appPath = await getApplicationDocumentsDirectory().path();
        imageFile = File(imageSelect.path);
        final imageFileUrl = '$appPath/${imageSelect.name}';
        imageFile!.copy(imageFileUrl);
        userConnected.urlProfile = imageFileUrl;
        print(imageFileUrl);
      }
    });
  }
}
