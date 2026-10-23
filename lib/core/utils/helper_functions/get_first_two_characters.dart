String getInitials(String name) {
  if (name.trim().isEmpty) return '';

  // Split the name by whitespace
  List<String> parts = name.trim().split(RegExp(r'\s+'));

  if (parts.length == 1) {
    // If only one word, take up to the first 2 characters
    String word = parts[0];
    return word.substring(0, word.length >= 2 ? 2 : word.length).toUpperCase();
  }

  // Otherwise, take the first letter of the first and last name
  return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
}