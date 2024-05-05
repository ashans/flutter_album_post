import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/src/domain/services/auth_service.dart';
import 'package:sample_application/src/widgets/profile_details.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileDetails(
          user: authService.currentUser!,
        ),
        const SizedBox(height: 48.0),
        // Logout Button
        ElevatedButton(
          onPressed: authService.logout,
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context)
                .colorScheme
                .error, // Or customize button style
          ),
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
