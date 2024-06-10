


// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'langauge_type.dart';

// part 'langauge_provider.g.dart';

// @riverpod
// class LangaugeProvider extends _$LangaugeProvider {
//   @override
//   LanguageType build() {
//     return const EngType();
//   }

//   void changeLang (LanguageType langType){
//     state = langType;
//   }

// }

// // final langaugeProvider = AutoDisposeNotifierProvider<LangaugeProvider, LanguageType>(() => ,);


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lookchin_app/langauge/view_models/langauge_type.dart';

class LanguageNotifier extends StateNotifier<LanguageType> {
  LanguageNotifier() : super(EngType());

  void toggleLanguage(newLang) { 
  // if (state is EngType) {
  //   print(state is EngType);
  //     // state = ThaiType();
  //   } else {
  //     // state = EngType();
  //   }
    state = newLang;
  
  }
}
final languageProvider = StateNotifierProvider<LanguageNotifier, LanguageType>((ref) => LanguageNotifier());