import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
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
  Color? fillColor;
  Color? borderColor;
  Color? labelColor;
  InputBorder? styleBorder;
  String? Function(String?)? valid;
  String? Function(String?)? onChange;
  void Function()? onTapIcon;
  bool? enabled;
  TextInputType? textInputType;
  dynamic curveBorder;

  void Function()? onPressedSuffixIcon;

  CustomTextField(
      {Key? key,
        required this.controller,
        this.prefixIcon,
        this.suffixIcon,
        this.onPressedSuffixIcon,
        this.textInputType,
        this.curveBorder,
        this.labelColor,
        this.onChange,
        this.onTapIcon,
        this.maxLength,
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
        this.width,  this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.grey)),
        child:TextFormField(
            keyboardType: textInputType,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            onChanged: onChange,
            onTap: onTapIcon,
            enabled: enabled,
            validator: valid,
            controller: controller,
            minLines: maxLength,
            maxLines: minLength,
            maxLength: length,
            maxLengthEnforcement:
            MaxLengthEnforcement.truncateAfterCompositionEnds,
            decoration: InputDecoration(
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    suffixIcon,
                    color: Colors.black,
                  )),
              filled: fill,
              fillColor: fillColor ?? Colors.white,
              labelText: labelText,
              labelStyle: TextStyle(color: labelColor ?? Colors.indigo),
              hintText: hinText,
              prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(curveBorder ?? 30),
                  borderSide:
                  BorderSide(color: borderColor ?? Colors.grey.shade200)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
      ),
    );
  }
}
