class CountriesModel{
  int ? status ;
  List<CountryModel> ?response;
  CountriesModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    if(json['response']!=null){
      response=[];
      json['response'].forEach((value){
        response!.add(CountryModel.fromJson(value));
      });
    }
  }
}
class CountryModel{
  int ? id ;
  String ? name ;
  String ? phoneCode ;
  String ? iso2 ;
  String ? flag ;
  CountryModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    phoneCode=json['phone_code'];
    iso2=json['iso2'];
    flag=json['flag'];
  }
}