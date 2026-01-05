class Language {
  final int id;
  final String name;
  final String code;

  Language({required this.id, required this.name, required this.code});

  static Language getEnglish() {
    return Language(id: 1, name: "English", code: "en");
  }

  static Language getArabic() {
    return Language(id: 2, name: "عربي", code: "ar");
  }
}
