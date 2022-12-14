import '../../domain/entities/enum/confidentiality.dart';
import '../../domain/entities/enum/role.dart';
import '../../domain/entities/user.dart';
import '../source/api/model/user/user_model.dart';

class UserMapper {
  Confidentiality _confidentialityFromString(String? string) {
    switch (string) {
      case 'PRIVATE':
        return Confidentiality.private;
      default:
        return Confidentiality.public;
    }
  }

  Role _roleFromString(String? string) {
    switch (string) {
      case 'ADMIN':
        return Role.admin;
      default:
        return Role.member;
    }
  }

  User mapApiUserToUser(ApiUserModel apiUserModel) {
    return User(
      id: apiUserModel.id,
      email: apiUserModel.email,
      password: apiUserModel.password,
      firstname: apiUserModel.firstname,
      lastname: apiUserModel.lastname,
      description: apiUserModel.description,
      userRole: _roleFromString(apiUserModel.userRole),
      confidentiality: _confidentialityFromString(apiUserModel.confidentiality),
    );
  }
}
