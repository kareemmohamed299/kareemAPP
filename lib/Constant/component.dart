import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
// text
Widget myText ({
  required String text ,
  double ? fontSize ,
  Color ? textColor ,
  FontWeight ? fontWeight })
{
  return Text(text,style: TextStyle(
      fontSize: fontSize ,
      fontFamily: "Montserrat",
      color: textColor,
      fontWeight: fontWeight,
  ),);
}
Widget selectGender({
  required double height,
  required double width,
  required String imagePath,
  required String text,
  required Color borderColor,
  required Function onTap,
}){
  return GestureDetector(
    onTap: (){onTap();},
    child: Container(
    height: height*0.125,
    width: width*0.22,
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.all( Radius.circular(12.0)),
    border: Border.all(color: borderColor,width: 5)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        myText(text: text , fontSize: 13 , fontWeight:FontWeight.w600)
      ]),
    ),
  );
}
Widget agePreferences({
  required Color color,
  required Color textColor,
  required String text,
  required Function onTap,
}){
  return GestureDetector(
    onTap: (){onTap();},
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius:const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: myText(text: text, fontSize: 13 ,textColor: textColor,fontWeight:FontWeight.w600 )),
      ),),
  );
}
Widget countriesContainer({
  int flag=0,
  required String imagePath,
  required String text,
  required double size,
}){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      flag == 0 ? SizedBox(height: size*0.8,width: size*0.15,):Container(),
      flag == 0 ? Image.asset(imagePath):
      ClipOval(child: SvgPicture.network(imagePath,width: 25,height: 25,)),
      const SizedBox(width: 8),
      SizedBox(
        width: size,
        child: Text(text,style:const TextStyle(
          fontSize: 13,
          fontFamily: "Montserrat",),
          maxLines: 2,
        ),
      )
  ]);

}
Widget myButton({
  required String text,
  required Color color,
  required double size,
  required Function onPressed,
}){
  return Container(
    width: size*0.38,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(23))
    ),
    child: TextButton(onPressed: (){
      onPressed();
    }, child: myText(text: text,fontSize: 13,fontWeight: FontWeight.w600, textColor: Colors.white)),
  );
}
Widget free(){
  return Container(
    width: 30,
    height: 16,
    decoration: const BoxDecoration(
      color: red,
      borderRadius:BorderRadius.all(Radius.circular(10.0)),
    ),
     child: Center(child: myText(text: "Free",fontSize: 8,textColor: Colors.white,fontWeight: FontWeight.w600)),
  );
}
