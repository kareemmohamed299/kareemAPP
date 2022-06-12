import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kareemapp/Constant/colors.dart';
import 'package:kareemapp/Constant/component.dart';
import 'package:kareemapp/Screens/PopupScreen/Cubit/cubit.dart';
import 'package:kareemapp/Screens/PopupScreen/Cubit/states.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
            body: SafeArea(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => BlocConsumer<PopupCubit ,PopupState >(
                      listener: (context , state){},
                      builder: (context, state){
                      var cubit = PopupCubit.get(context);
                      return state is! PopupLoadingState ? Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width*0.07),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /****************************** Select Gender ****************************/
                                myText(text: "Select Gender" , fontSize: 22 , fontWeight: FontWeight.w600),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      selectGender(
                                          height: height,
                                          width: width,
                                          imagePath:"assets/images/woman.png" ,
                                          text: "Women",
                                          borderColor: cubit.gender== "Women" ? pink : Colors.transparent ,
                                          onTap: (){
                                            cubit.selectGender("Women");
                                          }
                                      ),
                                      selectGender(
                                          height: height,
                                          width: width,
                                          imagePath:"assets/images/man.png" ,
                                          text: "Men",
                                          borderColor:cubit.gender=="Men" ? pink : Colors.transparent ,
                                          onTap: (){
                                            cubit.selectGender("Men");
                                          }
                                      ),
                                      Stack(
                                        children: [
                                          Positioned(
                                              left: width*0.135,
                                              child: free()),
                                          selectGender(
                                              height: height,
                                              width: width,
                                              imagePath:"assets/images/Group.png" ,
                                              text: "Group",
                                              borderColor: cubit.gender=="Group"? pink : Colors.transparent ,
                                              onTap: (){
                                                cubit.selectGender("Group");
                                              }
                                          ),
                                        ],
                                      )
                                    ]),
                                /******************************Select Age ****************************/
                                myText(text: "Age Preferences" , fontSize: 22 , fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 45,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: cubit.age.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Stack(
                                            children:[
                                              agePreferences(
                                                  color: cubit.selectIndex==index? pink :Colors.white,
                                                  textColor:cubit.selectIndex==index? Colors.white : Colors.black,
                                                  text: cubit.age[index],
                                                  onTap: (){
                                                    cubit.selectAge(index);
                                                  }
                                              ),
                                              index==0?Positioned(
                                                  child: free()):Container(),
                                            ]
                                        );
                                      }),
                                ),
                                /****************************** Regional Preferences ****************************/
                                myText(text: "Regional Preferences" , fontSize: 22 , fontWeight: FontWeight.w600),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: yellow ,
                                      borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                                      border: Border.all(color:yellow2,width: 5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [
                                      const Icon(Icons.arrow_back_ios_outlined,size: 16,),
                                      Column(
                                        children: [
                                          myText(text:"Get unlimited regional",fontSize: 17,fontWeight: FontWeight.w500),
                                          myText(text:"favorites item",fontSize: 17,fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                      Image.asset("assets/images/king.png")
                                    ],
                                  ),
                                ),
                                /****************************** Switch Button ****************************/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    myText(text: "Excellence buttons" , fontSize: 15 ),
                                    CupertinoSwitch(value: true, onChanged: (value){},activeColor: Colors.white,)

                                  ],
                                ),
                                /****************************** Balanced & Worldwide ****************************/
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        free(),
                                        countriesContainer(imagePath: "assets/images/team.png", text: "Balanced",size:width*0.2 ),
                                      ],
                                    ),
                                    SizedBox(width: width*0.15,),
                                    countriesContainer(imagePath: "assets/images/world.png", text: "Worldwide",size: width*0.2),

                                  ],),
                                /****************************** List of  countries ****************************/
                                SizedBox(
                                  height: height*0.15,
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing:0.0, childAspectRatio: 3),
                                      itemCount: cubit.countriesModel!.response!.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return countriesContainer(imagePath: "${cubit.countriesModel!.response![index].flag}",
                                            text: "${cubit.countriesModel!.response![index].name}" , flag: 1,size:width*0.2);
                                      }),
                                ),
                                /****************************** Two Button ****************************/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    myButton(text: "OK",size: width,color: plum, onPressed: (){}),
                                    myButton(text: "Go Match",size: width,color: pink, onPressed: (){}),
                                  ],
                                )
                              ]),): const Center(child: CircularProgressIndicator());
                      }));
                },
                child: Center(
                  child: myText(
                      text: "click MY",
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),

            ),
          );
  }
}
