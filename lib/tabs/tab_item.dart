
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import '../networking/SourceModel.dart';

class TabItem extends StatelessWidget {
 bool isSelected;
 Sources source;
 TabItem({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        color: isSelected ?AppColors.primarylightColor: Colors.transparent ,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primarylightColor,
          width: 2,
        )
      ),
      child: Text(source.name??'',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected?AppColors.whiteColor:AppColors.primarylightColor,
      ),),
    );
  }
}
