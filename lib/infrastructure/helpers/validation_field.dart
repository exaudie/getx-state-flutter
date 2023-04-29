class ValidateField {
  static String? required(String value, String fieldLabel) {
    if (value.isEmpty) return 'The $fieldLabel field cannot be empty';

    return null;
  }
}
