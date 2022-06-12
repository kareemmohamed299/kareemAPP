import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareemapp/Model/CountriesModel.dart';
import 'package:kareemapp/Network/Remote/dio.dart';
import 'package:kareemapp/Screens/PopupScreen/Cubit/states.dart';


class PopupCubit extends Cubit<PopupState>{

  PopupCubit() : super(PopupInitialState());

  static PopupCubit get(context) => BlocProvider.of(context);
   CountriesModel  ? countriesModel;
  String gender="Women";
  List<String> age =["Balanced","20-2","25-3","30-3","35 and over"];
  int selectIndex=2;
  void selectGender(String select){
    gender=select;
    emit(PopupSelectGenderState());
  }
  void selectAge(int select){
    selectIndex=select;
    emit(PopupSelectAgeState());
  }
  void getCountries()  {
    emit(PopupLoadingState());
    DioClass.getData(path: "/countries")
      .then((value) {
      print("kareemn1");
       //print(value.data);
        countriesModel = CountriesModel.fromJson(value.data);
        print("${countriesModel?.response?.length}");
        emit(PopupSuccessState(countriesModel));
    }).catchError((error) {
      emit(PopupErrorState(error));
    });
  }
}