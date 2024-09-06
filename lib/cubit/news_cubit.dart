import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/networking/diohelper.dart';
import '../networking/SourceModel.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  
  getNewsChannals()
  async {
    //ال dio  علي get data
    //الداتا اللي هترجع عباره عن قespose
    //هحولو ل مااب وبعدها هعملو ليست عشان ابعتو لل listview
    //واضحه !!
    // الداتتا جايه map <String ,dynamic
    // dynacim  يعني اي حاجه ممكن تبئا ليست او رقم او استرنج>

try {
  emit(NewsChannalLoading());

  Response response = await DioHelper.getData(
      url: 'top-headlines/sources?apiKey=d9b26400797f4a56be2cbe5547d6ff12');
  Map<String, dynamic>news = response.data;
  List<Sources>newsList = [];
  for (var item in news['sources']) {
    newsList.add(Sources.fromJson(item));
  }
  //بعتلو الداتا اللي ملتها ف الليست
  emit(NewsChannalSucess(channal: newsList));
}catch(e)
    {

      emit(NewsChannalFailure(e: e.toString()));
    }

  }
  
}
