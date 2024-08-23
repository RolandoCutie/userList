
import 'package:user_list/features/home/presentation/logic/user.dart';

class UsersResponseDto {
  final User user;
  UsersResponseDto({
    required this.user,
  });

  factory UsersResponseDto.fromJson(Map<String, dynamic> json) {
    return UsersResponseDto(user: User.fromJson(json));
  }
}
