import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/news%20cubit/newscubit.dart';
import 'package:news_app/layout/news_layout/news%20cubit/cubitstates.dart';
import 'package:news_app/module/search/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

class News_App_Screen extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    return 
      
       BlocConsumer<NewsCubit ,NewsStates>(
        builder: (context , state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            
            
      appBar: AppBar(
        title: Text("NEWS APP"),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen())
);

            }, 
            icon: Icon(Icons.search)
            ),
             IconButton(
            onPressed: ()
            {
              AppCubit.get(context).changeAppMode();

            }, 
            icon: Icon(Icons.brightness_4_outlined)
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentindex,
        onTap: (index){
          cubit.changeButtomNavBar(index);
        },
        items:cubit.bottomItems, 
        ),
        body: cubit.Screens[cubit.currentindex],
     

    );
        }, 
        listener: (context , state){

        });
     
   

    
  }
}

  