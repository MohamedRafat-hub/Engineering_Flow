import 'package:flutter/material.dart';

import '../../../../../core/widgets/counter_filter_chip.dart';


class UserStatusFilterRow extends StatelessWidget {
  const UserStatusFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CountFilterChip(
            label: 'All',
            count: 34,
            selected: true,
            onTap: () {}, // TODO(logic): filter: all users
          ),
          const SizedBox(width: 10),
          CountFilterChip(
            label: 'Active',
            count: 31,
            selected: false,
            onTap: () {}, // TODO(logic): filter: active users
          ),
          const SizedBox(width: 10),
          CountFilterChip(
            label: 'Disabled',
            count: 3,
            selected: false,
            onTap: () {}, // TODO(logic): filter: disabled users
          ),
        ],
      ),
    );
  }
}