import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constants.dart';
class ApiManager{
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=85de9ad38c00463ab7471fcfc793627d
   */
   static Future <SourceResponse?> getSources()async{
   Uri url= Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
   {'apiKey':ApiConstants.apikey});
  var response=await http.get(url);
  try{
    var responseBody=response.body;
    var json =jsonDecode(responseBody);
    return SourceResponse.fromJson(json);
  }catch(e){
    throw e;
  }
 }
 /*
 https://newsapi.org/v2/everything?q=bitcoin&apiKey=85de9ad38c00463ab7471fcfc793627d
  */
 static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
   Uri url=Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
       {'apiKey':ApiConstants.apikey,
         'sources':sourceId});
  var response=await http.get(url);
   try{
   var responseBody=response.body;
   var json=jsonDecode(responseBody);
   return NewsResponse.fromJson(json);
   }catch(e){
     throw e;
   }
 }
}

