import 'package:laza/core/index.dart' show Failure;
import 'package:laza/features/products/index.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

final class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

final class CategoriesSuccess extends CategoriesState {
  const CategoriesSuccess(this.categories);

  final List<Category> categories;
}

final class CategoriesFailure extends CategoriesState {
  const CategoriesFailure({required this.failure});

  final Failure? failure;
}
