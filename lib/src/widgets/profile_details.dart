import 'package:flutter/material.dart';
import 'package:sample_application/src/domain/models/user_dto.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final User(:username, :name, :email) = user;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          Text(
            name,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 36.0),
          Row(
            children: [
              const Text(
                'Username: ',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              Text(
                username,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Row(
            children: [
              const Text(
                'Email: ',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
