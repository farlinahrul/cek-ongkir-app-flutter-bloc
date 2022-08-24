part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
  
  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  ArticleSuccess({this.data});

  final List<Article>? data;

  @override
  List<Object> get props => [data!];
}

class ArticleFailure extends ArticleState {
  final ErrorType type;
  final String message;

  ArticleFailure({this.type = ErrorType.general, this.message = ""});

  ArticleFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  ArticleFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
