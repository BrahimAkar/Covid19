class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇲🇦", 'French', 'fr'),
      Language(2, "🇲🇦", 'Arabic', 'ar'),
    ];
  }
}
