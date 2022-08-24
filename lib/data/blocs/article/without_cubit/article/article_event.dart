part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class ArticleFetched extends ArticleEvent {}

class ArticleAdded extends ArticleEvent {
  const ArticleAdded(this.title, this.body);

  final String title,body;

  @override
  List<Object> get props => [title,body];
}
