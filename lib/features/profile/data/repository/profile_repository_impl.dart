import 'package:laza/core/index.dart' show AuthUser, ResultFuture;
import 'package:laza/features/profile/index.dart'
    show ProfileRepository, ProfileDataSource;

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required this._dataSource});

  final ProfileDataSource _dataSource;

  @override
  ResultFuture<AuthUser> updateUserProfile({required AuthUser user}) =>
      _dataSource.updateUserProfile(user: user);

  @override
  ResultFuture<AuthUser> getUserProfile() => _dataSource.getUserProfile();
}
