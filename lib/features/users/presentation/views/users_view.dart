import 'package:engineering_flow/features/users/presentation/views/widgets/users_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/main_app_bar.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Users'),
      body: UsersViewBody(), // Replace with UsersViewBody() when implemented
    );
  }
}
