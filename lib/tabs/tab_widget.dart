import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/tabs/tab_item.dart';

import '../networking/SourceModel.dart';
//import 'package:news_app/model/SourceResponse.dart';


class TabWidget extends StatefulWidget {

  List<Sources> SourcesList ;

  TabWidget({required this.SourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.SourcesList.length,
        child:Column(
          children: [
            TabBar(
              isScrollable: true,
                onTap: (index){
                selectedIndex=index;
                setState(() {

                });
                },
                indicatorColor: Colors.transparent,
                tabs:widget.SourcesList.map((source) => TabItem(source: source,
                    isSelected: selectedIndex==widget.SourcesList.indexOf(source)
                )).toList()
            ),
            Expanded(child: NewsWidget(source:widget.SourcesList[selectedIndex])),
          ],
        )
    );
  }
}
