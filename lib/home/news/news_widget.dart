import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/Api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
//import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/networking/SourceModel.dart';
class NewsWidget extends StatefulWidget {

  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??""),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primarylightColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
              Text('something went wrong'),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id??"");
                setState(() {

                });
              }, child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status!='ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id ?? "");
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList=snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,);
        }
    );
  }
}
