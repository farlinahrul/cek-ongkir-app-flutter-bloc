part of 'create_article_cubit.dart';

abstract class CreateArticleState extends Equatable {
  const CreateArticleState();

  @override
  List<Object> get props => [];
}

class CreateArticleInitial extends CreateArticleState {}

class CreateArticleLoading extends CreateArticleState {}

class CreateArticleSuccess extends CreateArticleState {}

class CreateArticleFailure extends CreateArticleState {
  final ErrorType type;
  final String message;

  CreateArticleFailure({this.type = ErrorType.general, this.message = ""});

  CreateArticleFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  CreateArticleFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}


