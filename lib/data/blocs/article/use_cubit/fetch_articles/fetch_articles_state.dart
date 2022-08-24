part of 'fetch_articles_cubit.dart';

abstract class FetchArticlesState extends Equatable {
  const FetchArticlesState();

  @override
  List<Object> get props => [];
}

class FetchArticlesInitial extends FetchArticlesState {}

class FetchArticlesLoading extends FetchArticlesState {}

class FetchArticlesSuccess extends FetchArticlesState {
  FetchArticlesSuccess(this.data);

  final List<Article> data;

  @override
  List<Object> get props => [data];
}

class FetchArticlesFailure extends FetchArticlesState {
  final ErrorType type;
  final String message;

  FetchArticlesFailure({this.type = ErrorType.general, this.message = ""});

  FetchArticlesFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  FetchArticlesFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
