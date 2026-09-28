import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/authentication/index.dart'
    show
        AuthenticationDatasource,
        AuthenticationDatasourceImpl,
        AuthenticationRepository,
        AuthenticationRepositoryImpl,
        LoginBloc,
        RegisterBloc;
import 'package:laza/features/products/index.dart';
import 'package:laza/features/wishlist/index.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton(NetworkService.new)
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton<AuthenticationDatasource>(
      () => AuthenticationDatasourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(datasource: getIt()),
    )
    ..registerLazySingleton<RegisterBloc>(() => RegisterBloc(getIt()))
    ..registerLazySingleton<LoginBloc>(() => LoginBloc(getIt()))
    ..registerLazySingleton<ProductsDataSource>(
      () => ProductsDataSourceImpl(networkService: getIt()),
    )
    ..registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<ProductsBloc>(() => ProductsBloc(getIt()))
    ..registerFactory<CategoriesBloc>(() => CategoriesBloc(getIt()))
    ..registerLazySingleton<WishlistDataSource>(
      () => WishlistDataSourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<WishlistRepository>(
      () => WishlistRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<WishlistBloc>(() => WishlistBloc(getIt()));
}
