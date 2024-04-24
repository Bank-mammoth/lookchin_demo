import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/data_search_model.dart';
import '../models/recent_model.dart';

part 'search_provider.g.dart';



List<RecentModel> allRecent = [];

@riverpod
class RecentSearch extends _$RecentSearch {
  @override
  Future<List<RecentModel>?> build() {
    return Future.value(allRecent);
  }

  Future<void> fetchRecent() async {
    state = const AsyncLoading();
    // await Future.delayed(const Duration(seconds: 1));

    state = await AsyncValue.guard(() async { // Actually must be in repo
      // Example data
      allRecent = [
        const RecentModel(recentName: "ร้านอาหารใกล้ฉัน", id: 1),
        const RecentModel(recentName: "คาเฟ่ลับ", id: 2),
        const RecentModel(recentName: "ถนนชำรุด", id: 3),
        const RecentModel(recentName: "น้ำท่วม", id: 4),
        const RecentModel(recentName: "ร้านส้มตำ", id: 5),
        const RecentModel(recentName: "สถานที่ท่องเที่ยวใกล้ฉัน", id: 6),
        const RecentModel(recentName: "ที่แฮงค์เอาท์", id: 7),
        const RecentModel(recentName: "ร้านอาหารอีสาน", id: 8),
        const RecentModel(recentName: "ร้านอาหารเหนือ", id: 9),
      ];
      return allRecent;
    });
  }

  Future<void> removeRecent({required int id}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      allRecent.removeWhere((element) => element.id == id);
      return allRecent;
    });
  }

  Future<void> searchRecent({required String search}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newRecent = allRecent.where((recent) {
        final recentTitle = recent.recentName.toLowerCase();
        final input = search.toLowerCase();
        return recentTitle.contains(input);
      }).toList();
      return newRecent;
    });
  }
}


//===============================[search]===============================

@riverpod
class SearchItem extends _$SearchItem {
  @override
  String build() {
    return '';
  }
    void setSearchTerm(String newSearchTerm){
    state = newSearchTerm;
  }

      void clearSearchTerm(){
    state = '';
  }
}


@riverpod
class SearchData extends _$SearchData {
  @override
  Future<List<DataSearchModel>> build() {
    return Future.value([]);
  }

  Future<void> searchDataValue({required String search}) async {
    state = const AsyncLoading();
    // await Future.delayed(const Duration(milliseconds: 350));
    try {
       state = await AsyncValue.guard(() async {
      final newSearch = allSearch.where((data) {
        final title = data.searchName.toLowerCase();
        final input = search.toLowerCase();
        return title.contains(input);
      }).toList();
      return newSearch;
    });
    } catch (e) {
        throw Exception(e);
    }
   
  }
}
