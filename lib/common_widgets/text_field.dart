import 'package:flutter/material.dart';
import '../constants/exports.dart';


class CommonTextField extends StatelessWidget{
  var controller;
  var hint;
  var validation;
  var inputType;
  var maxLength;
  var labelText;
  var prefix;
  var suffix;
  var enable;
  var readOnly;
  var inputFormators;

  var preText;
  var onChanged;
  var showFloating;
  var focusNode;
  var inputActions;
  var maxlines;
  var hideHelperText;
  var isObsure;
  var textColor;
  CommonTextField({
    this.controller,
    this.hint,
    this.validation,
    this.inputType,
    this.maxLength,
    this.labelText,
    this.prefix,
    this.suffix,
    this.enable,
    this.readOnly,
    this.inputFormators,
    this.preText,

    this.onChanged,
    this.showFloating =true,

    this.focusNode,
    this.inputActions,
    this.maxlines,
    this.hideHelperText=false,
    this.isObsure,
    this.textColor
  }
      );


  @override
  build(BuildContext context){
    return   TextFormField(
        controller: controller,
        validator: validation,
        maxLines: maxlines??1,
        enabled: enable??true,
        readOnly: readOnly??false,
        keyboardType: inputType??TextInputType.text,
        onChanged: onChanged,
        focusNode: focusNode,
        textInputAction: inputActions,
        obscureText: isObsure??false,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              color: textColor??editTextLabelColor,fontSize: font_16,fontWeight: FontWeight.w400),
        ),
        cursorColor: textColor??primaryColor,
        inputFormatters: inputFormators,
        decoration: InputDecoration(
            floatingLabelBehavior: showFloating?FloatingLabelBehavior.auto:FloatingLabelBehavior.never,
            floatingLabelStyle:GoogleFonts.inter(
              textStyle:TextStyle(color: primaryColor,fontSize: font_16,fontWeight: FontWeight.w400),) ,
            prefixStyle: GoogleFonts.inter(
              textStyle:TextStyle(color: editTextLabelColor,fontSize: font_16,fontWeight: FontWeight.w400),),
            prefixText: preText??"",
            fillColor: gradient1,
            labelText: labelText ??"",
            // helperStyle: GoogleFonts.roboto(
            //   textStyle:TextStyle(color: paragraphColor,fontSize: font_12,fontWeight: FontWeight.w400),),
            // helperText: hideHelperText?"":"Required *",
          contentPadding: EdgeInsets.symmetric(vertical: margin_16,horizontal: margin_10),
             iconColor: black,
            prefixIcon:prefix,
            suffixIcon: suffix,
            hoverColor: hoverBorderColor,
            labelStyle:  GoogleFonts.inter(
              textStyle:TextStyle(color: editTextLabelColor,fontSize: font_16,fontWeight: FontWeight.w400),),
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_4),
              borderSide: BorderSide(
                color: black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_4),
              borderSide: BorderSide(
                color:primaryColor,
                width: 1.0,
              ),
            ),
            errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_4),
              borderSide: BorderSide(
                color:errorBorderColor,
                width: 1.0,
              ),
            ),
            border:OutlineInputBorder(

                borderRadius: BorderRadius.circular(radius_4)
            ),
            hintText: hint,
            hintStyle: TextStyle(color: editTextLabelColor,fontSize: font_15)
        )
    );
  }




}