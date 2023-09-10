import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/news%20cubit/cubitstates.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/module/science/science_screen.dart';
import 'package:news_app/module/settings/settings.dart';
import 'package:news_app/module/sports/sports_screen.dart';
import 'package:news_app/shared/remote/dio_halper.dart';

class NewsCubit  extends Cubit <NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex =0;

  List <BottomNavigationBarItem> bottomItems =[
     BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "business"
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "science"
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "sports"
      ),
     BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "settings"
      )

  ];
  // ignore: non_constant_identifier_names
  List<Widget> Screens =[
    Business_Screen(),
    Science_Screen(),
    Sports_Screen(),
    settings_Screen()

  ];
  void changeButtomNavBar (int index){
    currentindex = index;
   // if (index ==1){
     // return getScience();
    //}
   // if (index ==2){
    //  return getSports();
    //}
    emit(NewsBottomNavBarState());

  }

  List<dynamic> business = [];

  void getBusiness (){
    emit(NewsGetBusinessLoadingState());
       DioHelper.getData(
                url: "v2/top-headlines",
                query: {
                  'country':'eg',
                  'category':'business',
                  'apiKey':'0d4e14ad3606420dba99c22eec183718',
                }
                ).then((value) {
                  //print(value.data.toString());
                  business =value.data['articles'];
                  print(business[0]['title']);
                  emit(NewsGetBusinessDataSuccess());
                }).catchError((error){
                  print(error.toString());
                  emit(NewsGetBusinessDataError(error.toString()));

                });
  }
  List<dynamic> science = [];

  void getScience (){
    emit(NewsGetScienceLoadingState());
   
      DioHelper.getData(
                url: "v2/top-headlines",
                query: {
                  'country':'eg',
                  'category':'science',
                  'apiKey':'0d4e14ad3606420dba99c22eec183718',
                }
                ).then((value) {
                  //print(value.data.toString());
                  science =value.data['articles'];
                  print(science[0]['title']);
                  emit(NewsGetScienceDataSuccess());
                }).catchError((error){
                  print(error.toString());
                  emit(NewsGetScienceDataError(error.toString()));

                });

    
       
  }
  List<dynamic> sports = [];

  void getSports (){
    emit(NewsGetSportsLoadingState());
    
      DioHelper.getData(
                url: "v2/top-headlines",
                query: {
                  'country':'eg',
                  'category':'sports',
                  'apiKey':'0d4e14ad3606420dba99c22eec183718',
                }
                ).then((value) {
                  //print(value.data.toString());
                  sports =value.data['articles'];
                  print(sports[0]['title']);
                  emit(NewsGetSportsDataSuccess());
                }).catchError((error){
                  print(error.toString());
                  emit(NewsGetSportsDataError(error.toString()));

                });




    }

    List<dynamic> search = [];

  void getSearch (value){
    emit(NewsGetSearchLoadingState());
    search =[];
   
      DioHelper.getData(
                url: "v2/everything",
                query: {
                  
                  'q':'$value',
                  'apiKey':'0d4e14ad3606420dba99c22eec183718',
                }
                ).then((value) {
                  //print(value.data.toString());
                  search =value.data['articles'];
                  print(search[0]['title']);
                  emit(NewsGetSearchDataSuccess());
                }).catchError((error){
                  print(error.toString());
                  emit(NewsGetSearchDataError(error.toString()));

                });

    
       
  }


       
  }

  
  

  


  
