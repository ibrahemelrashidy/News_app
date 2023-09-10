import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:news_app/layout/news_layout/News_layout.dart';
import 'package:news_app/layout/news_layout/news%20cubit/newscubit.dart';


import 'package:news_app/shared/block_provider/block_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/local/Cached_Helper.dart';
import 'package:news_app/shared/remote/dio_halper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();
    DioHelper.init();
    await ChachedHelper.init();
    
bool? isDark =ChachedHelper.getData(key: 'isDark');
  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {

  late final bool isDark;

  MyApp(this.isDark);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:(context) =>NewsCubit()..getBusiness()..getScience()..getSports()
        ),
        BlocProvider(
      create: (BuildContext contex)=>AppCubit()..changeAppMode(
        fromShared: isDark
      )),


      ], 
      
      child: BlocConsumer<AppCubit ,AppStates >(
        builder:(context,states){
          return MaterialApp(
      themeMode :AppCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light,
        darkTheme:ThemeData(
          textTheme: TextTheme(
           bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
           ) 
        ),
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: HexColor("333739"),
      
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
      ),
      
      appBarTheme: AppBarTheme(
        
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 25
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        
        color: HexColor("333739"),
        elevation: 0,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: HexColor("333739"),
      unselectedItemColor: Colors.grey,

      selectedItemColor: Colors.deepOrange,
      elevation: 20
    )
          
        ),
      theme :ThemeData(
        textTheme: TextTheme(
           bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
           ) 
        ),
        
        primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
      ),
      
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        
        color: Colors.white,
        elevation: 0,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,

      selectedItemColor: Colors.deepOrange,
      elevation: 20
    )
    ),
      
      debugShowCheckedModeBanner: false,
      
      home: News_App_Screen(),

        
      );
     
    

        } ,
         listener: (context,states){}),
      );
  }
}

// 