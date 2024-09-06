import '../networking/SourceModel.dart';

class NewsState {}

final class NewsInitial extends NewsState {}
final class NewsChannalLoading extends NewsState {}
final class NewsChannalSucess extends NewsState {
  //في حاله الداتا جنت هاخد الداتا هنا

  final List<Sources> channal;

  NewsChannalSucess({required this.channal});
}

final class NewsChannalFailure extends NewsState {
  //هبعت ال erroer
  //عشان اطبعو عادي
  final String e;

  NewsChannalFailure({required this.e});
}


//ده انا بضيف الاتنين باكدج دول بس
//ي نفس الحالت اللي انتي عملاه بره