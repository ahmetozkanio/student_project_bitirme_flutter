mixin ValidationMixin {
  String? userNameValidate(String value) {
    if (value.length >= 8) {
      return 'en az 8 haneli bir kullanici adi olmali';
    }
    if (value.isEmpty) {
      return 'Lutfen kullanici adinizi giriniz.';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length >= 8) {
      return 'Password 8 karakter icermeli.';
    }
    if (value.isEmpty) {
      return 'Lutfen sifrenizi giriniz.';
    }
    return null;
  }
}
