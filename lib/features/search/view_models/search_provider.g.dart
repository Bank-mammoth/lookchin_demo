// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentSearchHash() => r'ac5ce95f47a238927322a848d31b472542968f0e';

/// See also [RecentSearch].
@ProviderFor(RecentSearch)
final recentSearchProvider =
    AutoDisposeAsyncNotifierProvider<RecentSearch, List<RecentModel>?>.internal(
  RecentSearch.new,
  name: r'recentSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recentSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentSearch = AutoDisposeAsyncNotifier<List<RecentModel>?>;
String _$searchItemHash() => r'8218bff495236f15c2926700e0bff04f1eea487a';

/// See also [SearchItem].
@ProviderFor(SearchItem)
final searchItemProvider =
    AutoDisposeNotifierProvider<SearchItem, String>.internal(
  SearchItem.new,
  name: r'searchItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchItem = AutoDisposeNotifier<String>;
String _$searchDataHash() => r'0dd7f57f446483df6103bb059c804e29a4fbdc4f';

/// See also [SearchData].
@ProviderFor(SearchData)
final searchDataProvider = AutoDisposeAsyncNotifierProvider<SearchData,
    List<DataSearchModel>>.internal(
  SearchData.new,
  name: r'searchDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchData = AutoDisposeAsyncNotifier<List<DataSearchModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
