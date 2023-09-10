//https://newsapi.org/v2/everything?q=tesla&apiKey=0d4e14ad3606420dba99c22eec183718

// ignore_for_file: must_be_immutable



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/news%20cubit/cubitstates.dart';
import 'package:news_app/layout/news_layout/news%20cubit/newscubit.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  
  Widget build(BuildContext context) {
   
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: 
        [
          Padding(
            padding: EdgeInsets.all(20),
            child: defaultTextFormField(
            Controller: searchController, 
            onChanged: (value){
              NewsCubit.get(context).getSearch(value);


            },
            
            validate:(String value)
            {
              if (value.isEmpty){
                return'search must not be empty ';
              }
              return null;

            }, 
            label: 'search', 
            prifix: Icons.search, 
            type: TextInputType.text)
,
          ),
          articleBuilder(list, context)
        ],
      ),

    );
      }, 
      listener: (context ,state){});
  }
}


