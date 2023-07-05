import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/exports.dart';

commonBlackContainer(context, {widget, height}) {
  return Container(
    width: fullWidth(context),
    decoration:
        BoxDecoration(gradient: LinearGradient(colors: [gradient1, black])),
    child: widget,
  );
}

commonDialogs(
    {titleText,
    body,
    bgColor,
    textColor,
    radius,
    confirm,
    cancel,
    textCancel,
    textConfirm,
    onConfirmClick,
    confirmButtonColor}) {
  return Get.defaultDialog(
    backgroundColor: bgColor ?? white,
    titlePadding: EdgeInsets.zero,
    title: titleText ?? "",
    middleText: "",
    content: body,
    confirm: confirm ?? Container(),
    cancel: cancel ?? Container(),
    onCancel: () {
      Get.back();
    },
    contentPadding: EdgeInsets.symmetric(horizontal: margin_20),
    buttonColor: confirmButtonColor ?? Colors.green,
    onConfirm: onConfirmClick ?? () {},
    radius: radius ?? radius_2,
  );
}

assetImage({image, height, width, fit}) {
  return Image.asset(
    image,
    fit: fit ?? BoxFit.contain,
    height: height ?? 100.0,
    width: width ?? 100.0,
  );
}

fileImage({image, height, width, fit, radius}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 0),
    child: Image.file(image,
        height: height ?? 50,
        width: width ?? 50,
        fit: fit ?? BoxFit.cover,
        filterQuality: FilterQuality.high),
  );
}

networkImages(url, {shape, placeHolder, errorWidget, height, width}) {
  return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
            height: height ?? 100,
            width: width ?? 100,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
      placeholder: (context, url) =>
          placeHolder ?? ShimmerWidget.circular(width: 100.0, height: 100.0),
      errorWidget: (context, url, error) => errorWidget ?? commonText("Error ")
      // assetImage(image: IMG_PERSON, width: 100.0, height: 100.0),
      );
}

divider({dividerColor2}) {
  return Divider(
    color: dividerColor2 ?? dividerColorLIght,
  );
}

homeAppBar({
  context,
  leadingIcons,
  title,
  backIcon = false,
  leadingCLick,
  leading,
  onActionsClick,
  actions,
  hideLeading = false,
}) {
  return AppBar(
    primary: true,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: scaffoldBgColor,
      // <-- SEE HERE
      statusBarIconBrightness: Brightness.dark,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
    leading: leading,
    title: commonText(title ?? "",
        color: appBarTitleTextLabelColor, fontSize: font_20, maxLines: 1),
    actions: actions,
    elevation: radius_0,
    backgroundColor: scaffoldBgColor,
  );
}

customAppBar({
  context,
  leadingIcons,
  title,
  backIcon = false,
  leadingCLick,
  leading,
  onActionsClick,
  actions,
  hideLeading = false,
}) {
  return AppBar(
    primary: true,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: scaffoldBgColor,
      // <-- SEE HERE
      statusBarIconBrightness: Brightness.dark,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
    leading: leading,
    title: commonText(title ?? "",
        color: appBarTitleTextLabelColor, fontSize: font_20, maxLines: 1),
    actions: actions,
    elevation: radius_0,
    backgroundColor: scaffoldBgColor,
  );
}

getInkWell({widget, ontap, onLongPressed}) {
  return InkWell(
    onLongPress: onLongPressed,
    child: widget,
    onTap: ontap,
  );
}

loader({color}) {
  return CircularProgressIndicator(
    color: color ?? primaryColor,
  );
}

titleText({title, color, size}) {
  return commonText(title ?? "",
      fontSize: size ?? font_30, color: color ?? black);
}

toast({message, backgroundColor, textColor, fontSize}) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.symmetric(
        vertical: Platform.isAndroid ? height_80 : height_60,
        horizontal: margin_30),
    content: commonText(message, color: white, fontSize: font_13),
  ));
}

sizedBox({height, width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

commonText(text,
    {style,
    color,
    fontSize,
    fontWeight,
    maxLines,
    letterSpacing,
    align,
    textHeight}) {
  return Text(
    text ?? "null",
    maxLines: maxLines ?? 2,
    textAlign: align ?? TextAlign.start,
    style: GoogleFonts.inter(
      textStyle: style ??
          TextStyle(
              height: textHeight ?? 1.0,
              letterSpacing: letterSpacing ?? 0.28,
              color: color ?? black,
              fontSize: fontSize ?? font_15,
              fontWeight: fontWeight ?? FontWeight.w500,
              overflow: TextOverflow.ellipsis),
    ),
  );
}

setPadding({widget, leftPadding, rightPadding, bottomPadding, topPadding}) {
  return Padding(
    padding: EdgeInsets.only(
      left: leftPadding ?? 0,
      right: rightPadding ?? 0,
      bottom: bottomPadding ?? 0,
      top: topPadding ?? 0,
    ),
    child: widget,
  );
}

setPaddingAll({widget, margin}) {
  return Padding(
    padding: EdgeInsets.all(margin ?? 0),
    child: widget,
  );
}



logo({logoImage, logoHeight, logoWidth}) {
  return Image.asset(logoImage, height: logoHeight, width: logoWidth);
}

fullHeight(context) {
  return MediaQuery.of(context).size.height;
}

fullWidth(context) {
  return MediaQuery.of(context).size.width;
}

appLogo() {
  return Image.asset(APP_LOGO);
}
