String getNameEmail(String email) {
  final name = email.split('@')[0];
  final newName = '${name[0].toUpperCase()}${name.substring(1)}';
  return newName;
}