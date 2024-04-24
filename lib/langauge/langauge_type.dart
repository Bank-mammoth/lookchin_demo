
abstract class LanguageType {
  String get name;
}
class ThaiType extends LanguageType {
  @override
  String get name => "th";
}

class EngType extends LanguageType {
  @override
  String get name => "en";
}
