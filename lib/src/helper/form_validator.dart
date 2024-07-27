class FormValidator {
  static String? authorValidatorMethod(String? inputValue) {
    if (inputValue?.isNotEmpty ?? false) {
      return null;
    } else {
      return "This Field Is Empty";
    }
  }

  static String? descriptionValidatorMethod(String? inputValue) {
    if (inputValue?.isNotEmpty ?? false) {
      String formattedValue = inputValue!.trim();
      if (formattedValue.split(' ').length > 3) {
        if (formattedValue.split('.').length > 2) {
          return null;
        } else {
          return 'Should be at least 2 sentence.';
        }
      } else {
        return 'Should be at least 3 words.';
      }
    } else {
      return "This Field Is Empty";
    }
  }
}
