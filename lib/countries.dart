class Countries {
  final String flag;
  final String name;
  Countries({required this.flag, required this.name});

  static List<String> country = [
    "Ethiopia    🇪🇹",
    "Ertriea    🇪🇷",
    "Djbouti    🇩🇯",
    "Soamlia    🇸🇴",
    "Sudan    🇸🇩",
    "Kenya    🇰🇪"
  ];
}

List<Countries> CountryList = [
  Countries(flag: "🇪🇹 ", name: "Ethiopia"),
  Countries(flag: "🇪🇷", name: "Eritrea"),
  Countries(flag: "🇩🇯", name: "Djibouti"),
  Countries(flag: "🇸🇴  ", name: "Somalia"),
  Countries(flag: "🇸🇩 ", name: "Sudan"),
  Countries(flag: "🇰🇪  ", name: "Kenya"),
];
