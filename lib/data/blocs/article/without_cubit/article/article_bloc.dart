import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/article.dart';
import 'package:startercode_project/data/repositories/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleFetched>(onArticleFetched);
    on<ArticleAdded>(onArticleAdded);
  }

  final ArticleRepository _articleRepository = ArticleRepository();

  void onArticleFetched(
      ArticleFetched event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final response = await _articleRepository.fetchListArticle();
      emit(ArticleSuccess(data: response.data));
    } catch (e) {
      if (e is NetworkException) {
        emit(ArticleFailure.network(e.toString()));
        return;
      }
      emit(ArticleFailure.general(e.toString()));
    }
  }

  void onArticleAdded(
      ArticleAdded event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final response = await _articleRepository.createArticle(title: event.title, bodyArticle: event.body);
      emit(ArticleSuccess());
    } catch (e) {
      if (e is NetworkException) {
        emit(ArticleFailure.network(e.toString()));
        return;
      }
      emit(ArticleFailure.general(e.toString()));
    }
  }

}
