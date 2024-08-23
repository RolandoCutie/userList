import 'package:flutter/material.dart';

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
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
      title: Text(
        fullName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        email,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
      onTap: onTap,
    );
  }
}
