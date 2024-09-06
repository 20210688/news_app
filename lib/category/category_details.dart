

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/tabs/tab_widget.dart';

import '../cubit/news_state.dart';

class CategoryDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if(state is NewsChannalSucess) {
          var newsList = state.channal;
          return TabWidget(SourcesList:newsList);
        }else if(state is NewsChannalFailure)
        {
          return Column(
            children: [
              Text(state.e),
              ElevatedButton(onPressed: (){

              }, child: Text('Try Again'))
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );

  }
}
