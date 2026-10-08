import 'package:engineering_flow/core/theme/app_text_styles.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_list_tile.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_page_header.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_status_filter_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/app_search_field.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        const UsersPageHeader(),
        const SizedBox(height: 20),
        AppSearchField(
          hintText: 'Search users by name... ',
          onChanged: (value){
            context.read<GetUsersCubit>().searchOnUser(value);
          },
        ),

        const SizedBox(height: 16),
         UserStatusFilterRow(),
        const SizedBox(height: 20),

        BlocBuilder<GetUsersCubit, GetUsersState>(
          builder: (context, state) {
            if (state is GetUsersSuccess) {
              if (state.users.isEmpty) {
                return Center(child: Text("No users found" , style: AppTextStyles.appBarTitle,));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: UserListTile(userEntity: state.users[index]),
                  );
                },
              );
            } else if (state is GetUsersFailure) {
              return Center(
                child: Text(state.message, style: AppTextStyles.statusPill),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
