import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/tabs/tab_widget.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_Screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset('assets/images/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..getNewsChannals(),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('News App',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
              ),
              body: CategoryFragment(),

          ),
        )
      ],
    );
  }
}
/*
85de9ad38c00463ab7471fcfc793627d
 */