import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/core/theme/app_colors.dart';

class UserProfile extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final String email;
  final VoidCallback? onTap;

  const UserProfile({
    Key? key,
    required this.imageUrl,
    required this.fullName,
    required this.email,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
      title: Text(fullName,
          style: textTheme.bodyMedium?.copyWith(
              color: AppColors.blueNavy(),
              fontWeight: FontWeight.bold,
              fontSize: 22)),
      subtitle: Text(email,
          style: textTheme.titleMedium?.copyWith(
              color: AppColors.darkGrey(),
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      onTap: onTap,
    );
  }
}
