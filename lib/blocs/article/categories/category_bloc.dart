import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xflutter/blocs/article/categories/category_event.dart';
import 'package:xflutter/blocs/article/categories/category_state.dart';
import 'package:xflutter/model/article_model.dart';
import 'package:xflutter/repository/repositories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoadingState()) {
    final FetchDataByCategoryRepository fetchDataRepository =
        FetchDataByCategoryRepository();

    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final List<Articles> articles =
            await fetchDataRepository.getNewFeeds(event.data);

        emit(CategoryLoadedState(articles));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
