import 'dart:io';
import 'package:amritmilk/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';

///circular progress indicator widget
buildCircularIndicator(){
  return const Center(
    child: Padding(
      padding: EdgeInsets.only(top: 30.0,bottom: 30.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CupertinoActivityIndicator(color: primaryColor,),
        ),
      ),
    ),
  );
}

///no data found widget
buildNoDataFound(BuildContext context,{Color color = blackColor}){
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
      child: buildTextBoldWidget("No Data Found", color, context, 14,),
    ),
  );
}

///textFormField title widget
buildTitleWidget(BuildContext context,String title){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: buildTextRegularWidget(title, titleTextColor,context,13,),
      ),
      const SizedBox(height: 5,),
    ],
  );
}

buildButtonWidget(BuildContext context,String title,{double height = 50,double buttonFontSize = 16.0,double width= double.infinity,
  bool withIcon =false,Color buttonColor = buttonColor,double radius = 10.0,TextAlign textAlign = TextAlign.center,
  Color textColor = whiteColor}){
  return Container(
    height: height, width: width,
    decoration: BoxDecoration(
      color: buttonColor, borderRadius: BorderRadius.circular(radius),
    ),
    child: Center(
      child: buildTextRegularWidget(title, textColor, context, buttonFontSize, fontWeight: FontWeight.w600,align: textAlign)
    ),
  );
}
///button with only border widget
buildButtonWithBorderWidget(BuildContext context, String title,{double height = 40.0,double width = 140.0}){
  return Container(
    height: height,//width: width,
    // padding: const EdgeInsets.only(left: 2.0,right: 2.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0), // color: whiteColor,
      border: Border.all(color: buttonColor,),
    ),
    child: Center(child: buildTextMediumWidget(title, titleTextColor, context, 15.0,align: TextAlign.center),),
  );
}

buildContentSubTitle(BuildContext context,{String contentTitle1= "",String contentTitle2 ="",String contentTitle3 ="",
  Color contentTitle3Color = blackColor, double fontSize = 12.0,
  double padding1 = 1.0,double padding2 = 1.0,double padding3 = 1.0,}){
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsets.only(left: padding1),
        child: buildTextMediumWidget(contentTitle1, blackColor, context, fontSize,align: TextAlign.left),
      ),
      Padding(
        padding: EdgeInsets.only(left: padding2),
        child: buildTextMediumWidget(contentTitle2, blackColor, context, fontSize,align: TextAlign.left),
      ),
      Padding(
        padding: EdgeInsets.only(left: padding3),
        child: buildTextMediumWidget(contentTitle3, contentTitle3Color, context, fontSize,align: TextAlign.left),
      ),
    ],
  );
}
///table 2 X 2
buildTableTwoByTwoTitle(BuildContext context,{String title1= "",String title2 ="",double fontSize = 12.0,
FontWeight title1FW = FontWeight.normal,FontWeight title2FW = FontWeight.normal,}){
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 1.0,bottom: 2.0),
        child: buildTextRegularWidget(title1, blackColor, context, fontSize,align: TextAlign.left,fontWeight: title1FW),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1.0,bottom: 2.0),
        child: buildTextRegularWidget(title2, blackColor, context, fontSize,align: TextAlign.left,fontWeight: title2FW),
      ),
    ],
  );
}
buildContentTwoByTwoSubTitle(BuildContext context,{String contentTitle1= "",String contentTitle2 ="",double fontSize = 12.0,
  TextAlign contentTitle1Align = TextAlign.left,TextAlign contentTitle2Align = TextAlign.left,
  FontWeight title1FW = FontWeight.bold,FontWeight title2FW = FontWeight.bold,}){
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 1.0),
        child: buildTextMediumWidget(contentTitle1, blackColor, context, fontSize,align: contentTitle2Align,fontWeight: title1FW),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1.0),
        child: buildTextMediumWidget(contentTitle2, blackColor, context, fontSize,align: contentTitle2Align,fontWeight: title2FW),
      ),
    ],
  );
}

buildActionForClaim(Color boxColor,IconData icon){
  return Container(
      height: 40.0,
      decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.0),color:boxColor),
      child: Center(child: Icon(icon,color: whiteColor,),));
}
buildTimesheetTableTitle(BuildContext context,{String title1= "",String title2 =""}){
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 1.0,bottom: 2.0),
        child: buildTextBoldWidget(title1, blackColor, context, 14.0,align: TextAlign.left),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1.0,bottom: 2.0),
        child: buildTextBoldWidget(title2, blackColor, context, 14.0,align: TextAlign.left),
      ),
    ],
  );
}
buildTimesheetTable(BuildContext context,Widget childWidgetFirst,Widget childWidgetSecond){
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 1.0,right: 5.0),
        child: childWidgetFirst,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: childWidgetSecond,
      ),
    ],
  );
}
buildTimeSheetDivider(){
  return const Padding(
    padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
    child: Divider(color: primaryColor,thickness: 2.0,),
  );
}
buildTimeSheetTitle(BuildContext context,String title,{double fontSize=14.0}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 15,), buildTextBoldWidget(title, blackColor, context, fontSize),const SizedBox(height: 10,),
    ],
  );
}
buildTableWidget(BuildContext context,Widget childWidgetFirst,Widget childWidgetSecond){
  return Table(
    children: [
      buildTimesheetTableTitle(context,title1: "Type Of Work",title2: "Time Spent",),
      const TableRow(children: [SizedBox(height: 10.0,),SizedBox(height: 10.0,),],),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0,right: 5.0),
            child: childWidgetFirst,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: childWidgetSecond,
          ),
        ],
      ),
      const TableRow(children: [SizedBox(height: 10.0,),SizedBox(height: 10.0,),],),
      buildTimesheetTableTitle(context,title1: "Details"),
      const TableRow(children: [SizedBox(height: 10.0,),SizedBox(height: 10.0,),],),
    ],
  );
}

buildDrawerWelcome(BuildContext context,String name){
  return Padding(
    padding:const EdgeInsets.all(10.0),
    child:Container(
      height: 100.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: primaryColor),
      child: Row(
        children: [
          const SizedBox(width: 10.0,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 7.0,),
                buildTextBoldWidget("Welcome,", whiteColor, context, 16.0),
                const SizedBox(height: 7.0,),
                buildTextBoldWidget(name, whiteColor, context, 14.0),
                const SizedBox(height: 5.0,),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

buildDrawerDivider({double rightPadding = 30.0,double leftPadding = 30.0,Color color = whiteColor}){
  return Padding(
    padding: EdgeInsets.only(right: rightPadding,left: leftPadding),
    child: Divider(color: color,thickness: 2.0,),
  );
}
buildRichTextWidget(String title1,String title2, {FontWeight title1Weight = FontWeight.bold,
  FontWeight title2Weight = FontWeight.normal,Color title1Color = Colors.black, Color title2Color = Colors.black,
    double title1Size = 15.5, double title2Size = 15.5}){
  return RichText(
    text: TextSpan(
      text: title1,
      style: TextStyle(fontWeight: title1Weight,color: title1Color,fontSize: title1Size),
      children: <TextSpan>[
        TextSpan(
            text: title2,
            style: TextStyle(fontWeight: title2Weight,color: title2Color,fontSize: title2Size)),
      ],
    ),
  );
}
buildTabTitle(BuildContext context,bool selected,String title,{Color color = Colors.white,double width = 2}){
  return Container(
    width: MediaQuery.of(context).size.width/width,
    decoration: BoxDecoration(
      color: selected ? primaryColor : grey.withOpacity(0.2),
    ),
    child: Center(
      child: buildTextBoldWidget(title, selected ? whiteColor : blackColor, context, 14),
    ),
  );
}

buildClientCodeWidget(String clientCode,String clientName, BuildContext context,
    {double h1 = 40.0, double h2 = 40.0})
{
  return Transform(
    transform: Matrix4.translationValues(0.0, -4.0, 0.0),
    child: Row(
      children: [
        Container(
            height: h1,
            decoration: const BoxDecoration(color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0),)),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: buildTextBoldWidget(clientCode, whiteColor, context, 14.0),
                )
            )
        ),
        Flexible(
          child: Container(
              height: h2,
              decoration: const BoxDecoration(
                  //border: Border.all(color: grey),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(7.0))),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: buildTextBoldWidget(clientName, primaryColor, context, 14.0,align: TextAlign.left),
                  )
              )
          ),
        ),
      ],
    ),
  );
}

buildClientCodeWidgetForOther(String clientCode,String clientName, BuildContext context,
    {double h1 = 40.0, double h2 = 40.0})
{
  return Row(
    children: [
      Container(
          height: h1,
          decoration: const BoxDecoration(color: primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0),)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: buildTextBoldWidget(clientCode, whiteColor, context, 14.0),
              )
          )
      ),
      Flexible(
        child: Container(
            height: h2,
            decoration: const BoxDecoration(
              //border: Border.all(color: grey),
                borderRadius: BorderRadius.only(topRight: Radius.circular(7.0))),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: buildTextBoldWidget(clientName, primaryColor, context, 14.0,align: TextAlign.left),
                )
            )
        ),
      ),
    ],
  );
}

buildTableTitle(BuildContext context,String title){
  return Container(
    color: grey,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: buildTextBoldWidget(title, blackColor, context, 14.0),
    ),
  );
}

buildTableSubtitle(BuildContext context,String subtitle){
  return Container(
    color: grey.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: buildTextRegularWidget(subtitle, blackColor, context, 14.0,align: TextAlign.center),
    ),
  );
}




