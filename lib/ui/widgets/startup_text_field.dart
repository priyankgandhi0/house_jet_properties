import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

// ignore: must_be_immutable
class AppTextFields extends StatefulWidget {
  AppTextFields(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.trailing,
      this.maxLine,
      this.isSecureEntry = false,
      this.readOnly = false,
      this.shoeCursor = true,
      this.hintStyle,
      this.leading,
      this.onTap,
      this.textInputAction,
      this.onChange,
      this.fillColor,
      this.borderColor,
      this.textInputType,
      this.validator})
      : super(key: key);
  TextEditingController controller;
  String hintText;
  bool isSecureEntry;
  bool readOnly;
  bool shoeCursor;
  Widget? leading;
  Widget? trailing;
  Color? fillColor;
  Color? borderColor;
  TextStyle? hintStyle;
  Function()? onTap;
  Function(String)? onChange;
  TextInputAction? textInputAction;
  TextInputType? textInputType;

  int? maxLine;
  final FormFieldValidator<String>? validator;

  @override
  State<AppTextFields> createState() => _AppTextFieldsState();
}

bool show = true;

class _AppTextFieldsState extends State<AppTextFields> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.maxLine == null ? 50 : (widget.maxLine! * 30),
          //48,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     spreadRadius: 1,
            //     blurRadius: 8,
            //
            //     offset: const Offset(0, 1), // changes position of shadow
            //   ),
            // ],
          ),
        ),
        TextFormField(
          validator: widget.validator,
          maxLines: widget.isSecureEntry ? 1 : widget.maxLine ?? 1,
          cursorColor: app_Orange_FF7448,
          controller: widget.controller,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.textInputType,
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: widget.leading,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            fillColor: widget.fillColor ?? app_foreground_color_F6F8FB,
            suffixIcon: widget.isSecureEntry
                ? InkWell(
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: ImageIcon(
                      AssetImage(show
                          ? "assets/icons/ic_hidden_eye.png"
                          : "assets/icons/ic_eye.png"),
                      color: app_grey_B4B4B4,
                    ).paddingOnly(right: 12, bottom: 12, top: 12),
                  )
                : widget.trailing,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                GoogleFonts.manrope(
                    color: app_grey_B4B4B4,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent, width: 1.0),
            ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
          ),
          style: GoogleFonts.manrope(
              color: app_text_black_1B1B1B,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          onChanged: widget.onChange ?? (val) {},
          readOnly: widget.readOnly,
          showCursor: widget.shoeCursor,
          obscureText: widget.isSecureEntry ? show : false,
          onTap: widget.onTap,
        ),
        // Container(
        //   height: widget.maxLine == null ? 50 : (widget.maxLine! * 30),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(5),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.1),
        //         spreadRadius: 1,
        //         blurRadius: 8,
        //         offset: const Offset(0, 1), // changes position of shadow
        //       ),
        //     ],
        //   ),
        //
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: TextFormField(
        //           validator:widget.validator,
        //
        //             maxLines: widget.isSecureEntry ? 1 : widget.maxLine ?? 1,
        //             cursorColor: Colors.black,
        //             controller: widget.controller,
        //             textInputAction: TextInputAction.next,
        //
        //             decoration: InputDecoration(
        //                 prefixIcon: widget.leading,
        //                 filled: true,
        //                 fillColor: app_foreground_color_F5F8FF,
        //                 suffixIcon: widget.isSecureEntry
        //                     ? InkWell(
        //                         onTap: () {
        //                           setState(() {
        //                             show = !show;
        //                           });
        //                         },
        //
        //                         child: ImageIcon(
        //                           AssetImage(show ? hiddenEyeIcon : eyeIcon),
        //                           color: app_grey_B4B4B4,
        //                         ).paddingOnly(right: 12, bottom: 12, top: 12),
        //                       )
        //                     : widget.trailing != null
        //                         ? Padding(
        //                             padding: const EdgeInsets.only(
        //                                 right: 12, bottom: 12, top: 12),
        //                             child: widget.trailing,
        //                           )
        //                         : null,
        //                 border: InputBorder.none,
        //                 hintText: widget.hintText,
        //
        //
        //                 hintStyle: widget.hintStyle ??
        //                     GoogleFonts.manrope(
        //                         color: app_grey_B4B4B4,
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w500)),
        //             style: GoogleFonts.manrope(
        //                 color: app_text_black_1B1B1B,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w500),
        //             onChanged: (String newVal) {},
        //             obscureText: widget.isSecureEntry ? show : false,
        //
        //
        //         ),
        //       ),
        //       // if (widget.isSecureEntry)
        //       //   InkWell(
        //       //     onTap: () {
        //       //       setState(() {
        //       //         show = !show;
        //       //       });
        //       //     },
        //       //     child: ImageIcon(
        //       //       AssetImage(show ? hiddenEyeIcon : eyeIcon),
        //       //       color: app_grey_B4B4B4,
        //       //     ),
        //       //   ),
        //       // if (widget.trailling != null) widget.trailling!
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
