String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Please enter a valid email address';
  }

  return null;
}