import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../global/globals.dart';
// import 'package:news_app_clean_architecture/core/theme/theme_data/light_theme/color_light_app.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  IconData? prefixIcon;
  IconData? suffixIcon;
  double? height;
  double? width;
  int? length;
  int? maxLength;
  int? minLength;
  String? labelText;
  String? hinText;
  bool? fill;
  bool? obscureText;
  Color? fillColor;
  Color? borderColor;
  Color? labelColor;
  InputBorder? styleBorder;
  String? Function(String?)? valid;
  String? Function(String?)? onChange;
  String? Function(String?)? onFieldSubmitted;
  void Function()? onTapIcon;
  bool? enabled;
  TextInputType? textInputType;
  dynamic enabledCurveBorder;
  TextInputAction? textInputAction;
  String? errorText;
  void Function()? onPressedSuffixIcon;
  FloatingLabelBehavior? needLabel;
  Color? enabledColor;

  CustomTextField(
      {Key? key,
      required this.controller,
      this.obscureText,
      this.enabledColor,
      this.needLabel,
      this.prefixIcon,
      this.textInputAction,
      this.suffixIcon,
      this.onPressedSuffixIcon,
      this.textInputType,
      this.enabledCurveBorder,
      this.labelColor,
      this.onChange,
      this.onTapIcon,
      this.maxLength,
      this.onFieldSubmitted,
      this.hinText,
      this.minLength,
      this.fill,
      this.fillColor,
      this.valid,
      this.labelText,
      this.enabled,
      this.length,
      this.height,
      this.styleBorder,
      this.width,
      this.borderColor,
      this.errorText})
      : super(key: key);

  TextStyle textStyle({Color? textColor, String? fontStyle}) => TextStyle(
      color: textColor ?? Colors.white,
      fontFamily: sharedPreferences.getString("Localization") == "en"
          ? fontStyle ?? "poppins"
          : "arabic");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: enabledColor ?? Colors.yellowAccent)),
            child: TextFormField(
              style: textStyle(),
              obscureText:
                  obscureText == null || obscureText == false ? false : true,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              onChanged: onChange,
              onFieldSubmitted: onFieldSubmitted,
              onTap: onTapIcon,
              enabled: enabled,
              validator: valid,
              controller: controller,
              maxLines: maxLength,
              minLines: minLength,
              maxLength: length,
              
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              decoration: InputDecoration(
                
                errorText: errorText,
                suffixIcon: suffixIcon == null
                    ? null
                    : IconButton(
                        onPressed: onPressedSuffixIcon,
                        icon: Icon(
                            obscureText == true
                                ? suffixIcon
                                : Icons.visibility_off_outlined,
                            color: obscureText == true
                                ? Colors.yellow
                                : Colors.grey.shade500)),
                filled: true,
                fillColor: Colors.black,
                floatingLabelBehavior: needLabel ?? FloatingLabelBehavior.never,
                labelText: labelText,
                labelStyle: textStyle(),
                hintText: hinText,
                hintStyle:
                    textStyle(textColor: const Color.fromARGB(255, 96, 94, 94)),
                prefixIcon: prefixIcon == null
                    ? null
                    : Icon(prefixIcon, color: Colors.yellow),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(enabledCurveBorder ?? 10),
                    borderSide: BorderSide(
                        color: borderColor ?? Theme.of(context).primaryColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )));
  }
}
