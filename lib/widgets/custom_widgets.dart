import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wowflutter/colors/colors.dart';
import 'package:wowflutter/widgets/helper_functions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.password = false,
    this.icon,
    this.socialIcon,
    this.onTap,
    this.onTextTap,
    this.visible = false,
    this.maxLines = 1,
    this.onChanged,
    this.fonts = "Urbanist",
  });

  final String? labelText, hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final IconData? icon;
  final String? socialIcon; // URL for the social icon image
  final VoidCallback? onTap, onTextTap;
  final bool password, visible;
  final dynamic onChanged;
  final dynamic fonts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTextTap,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: visible,
        maxLines: maxLines,
        onTap: onTextTap,
        style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        decoration: InputDecoration(
          prefixIcon: socialIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    socialIcon!,
                    width: 12,
                    height: 12,
                  ),
                )
              : Icon(icon, size: 17),
          fillColor: Get.isDarkMode ? TColors.dark : Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: hintText,
          labelText: labelText,
          labelStyle: safeGoogleFont(fonts,
              color: Get.isDarkMode ? Colors.white : Colors.black),
          hintStyle: safeGoogleFont(fonts,
              color: Get.isDarkMode ? Colors.white : Colors.black),
          suffixIcon: password
              ? IconButton(
                  icon: Icon(visible ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: onTap,
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF414141)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCECECE)),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isLoading;
  final double fontSize;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.backgroundColor = const Color(0xFF028a7e), // Removed default value
    this.textColor = Colors.white,
    this.fontSize = 15,
    this.borderColor = Colors.transparent,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0),
    this.margin = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    // Use a fallback color if `backgroundColor` is not provided

    return Container(
      margin: margin,
      width: Get.width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          disabledBackgroundColor: backgroundColor?.withOpacity(0.6),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: textColor),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
      ),
    );
  }
}

void showDialogue(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: TColors.dark,
          title: const Text('Please Confirm!'),
          content: const Text('Are you sure to delete the Session?'),
          actions: [
            TextButton(onPressed: () async {}, child: Text('Yes'.tr)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'.tr))
          ],
        );
      });
}
