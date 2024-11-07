import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';

class AddTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? textController;
  final FormFieldValidator? validator;
  final Function? onChanged;
  final double? fontSize;
  final double borderRadius;
  final double? height;
  final Color? fillColor;
  final Widget? suffixIcon;
  final TextInputType? keyboard;
  final bool? inputFormat;
  final int? maxLengthLimit;
  final String? hintText;
  final Function? onTap;
  final String? labelText;
  final bool? visible;
  final bool? readonly;
  final bool obscureText;
  final double? width;

  final int? minLines;

  const AddTextFieldWidget({
    super.key,
    required this.label,
    this.textController,
    this.validator,
    this.suffixIcon,
    this.readonly = false,
    this.keyboard,
    this.inputFormat,
    this.maxLengthLimit,
    this.visible = false,
    this.onChanged,
    this.fontSize,
    this.borderRadius = 5,
    this.fillColor,
    this.hintText,
    this.onTap,
    this.labelText,
    this.height,
    this.width,
    this.minLines,
    this.obscureText = false,
    // this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
          if (visible == true)
            const Text(
              "*",
              style: TextStyle(color: kPrimaryColor),
            )
        ],
      ),
      const SizedBox(height: 10,),
      SizedBox(
          width: width ?? size.width * 2 / 2,
          height: height ?? size.height * 0.075,
          child: TextFormField(
            //  initialValue: initialValue,
            controller: textController,
            validator: validator,
            readOnly: readonly!,
            onTap: onTap == null
                ? null
                : () {
                    onTap!();
                  },
            onChanged: onChanged == null
                ? null
                : (String? value) {
                    onChanged!(value);
                  },
            style: TextStyle(fontSize: fontSize ?? 14),
            inputFormatters: inputFormat == null
                ? null
                : [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    LengthLimitingTextInputFormatter(maxLengthLimit)
                  ],
            keyboardType: keyboard ?? TextInputType.text,
            minLines: obscureText
                ? 1
                : minLines, // Ensure single line when obscureText is true
            maxLines: obscureText ? 1 : minLines,
            obscureText: obscureText,
            decoration: InputDecoration(
                fillColor: fillColor ?? Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                hintStyle:
                    const TextStyle(fontSize: 14, color: kSecondaryColor),
                labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kSecondaryColor, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kSecondaryColor, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kSecondaryColor, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                hintText: hintText,
                labelText: labelText,
                suffixIcon: suffixIcon),
          ))
    ]);
  }
}
