import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/news%20cubit/newscubit.dart';
import 'package:news_app/layout/news_layout/news%20cubit/cubitstates.dart';
import 'package:news_app/shared/components/components.dart';

class Science_Screen extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).science;
    return  BlocConsumer<NewsCubit,NewsStates>(
      builder: (context ,state){
       return  articleBuilder(list,context) ;

      }, 
      listener: (context , state){});
  }
}

  