import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';

import '../model/Category.dart';

class CategoryFragment extends StatelessWidget {
 var categoriesList= Category.getCategors();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Pick your category\nof interest',
       style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 20,),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                mainAxisSpacing:10,
              crossAxisSpacing: 10,
              ),
              itemBuilder: (context,index){
                return CategoryItem(category: categoriesList[index], index: index);
              },
               itemCount: categoriesList.length,),
        )
      ],
      ),
    );
  }

}
