import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareemapp/Constant/string.dart';
import 'package:kareemapp/Network/Remote/dio.dart';
import 'package:kareemapp/Screens/PopupScreen/home.dart';

import 'Screens/PopupScreen/Cubit/cubit.dart';
void main()  {
  DioClass.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (BuildContext context)=> PopupCubit()..getCountries(),
      child: MaterialApp(
        title: 'Services app',
        debugShowCheckedModeBanner: false,
        initialRoute: homeScreen,
        routes:{
          homeScreen : (context) =>  const HomeScreen(),
       }
      ),
    );
  }
}
