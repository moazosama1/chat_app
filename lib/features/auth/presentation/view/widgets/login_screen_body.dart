import 'package:flutter/material.dart';

import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'custom_button.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  String? email;
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Text(
              "Enter Your Phone Number",
              style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "Please confirm your country code and enter your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 48,
            ),
            IntlPhoneField(
              initialCountryCode: "EG",
              keyboardType: TextInputType.number,
              pickerDialogStyle: PickerDialogStyle(
                  listTileDivider: Divider(
                    color: theme.colorScheme.onPrimary,
                  ),
                  backgroundColor: theme.colorScheme.surface),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                      color: theme.colorScheme.onPrimary.withAlpha(200)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18))),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomButton(
              textButton: "Continue",
              onPressed: () async {},
              colorButton: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
