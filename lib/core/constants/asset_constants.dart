abstract class AppAssets {
  const AppAssets();

  // Brand
  static const String appLogo = 'assets/icons/engiflow_icon.svg';

  // Auth
  static const String keyIcon = 'assets/icons/key_icon.svg';

  // Bottom navigation (each icon is exported pre-colored for its
  // default state; see AppBottomNavBar for how active/inactive is handled)
  static const String dashboardNavIcon = 'assets/icons/dashboard_icon.svg';
  static const String usersNavIcon = 'assets/icons/users_icon.svg';
  static const String projectsNavIcon = 'assets/icons/projects_icon.svg';
  static const String profileNavIcon = 'assets/icons/profile_icon.svg';

  // Dashboard
  static const String managersIcon = 'assets/icons/managers_icon.svg';
  static const String employeesIcon = 'assets/icons/employees_icon.svg';
  static const String adminIcon = 'assets/icons/admin_icon.svg';
  static const String activeUserIcon = 'assets/icons/active_user_icon.svg';
  static const String recentUserIcon = 'assets/icons/recent_user_icon.svg';
  static const String roleIcon = 'assets/icons/role_icon.svg';
  // NOTE: file name kept exactly as exported (contains a typo: "sceduling").
  static const String userSchedulingIcon =
      'assets/icons/user_sceduling_icon.svg';

  // Not used on the current screens yet, registered for later use.
  static const String emailIcon = 'assets/icons/email_icon.svg';
}