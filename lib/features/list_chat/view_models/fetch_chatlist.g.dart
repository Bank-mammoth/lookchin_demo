// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_chatlist.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemChatHash() => r'88ccffb8f54ac54cf63a5e06bf3ae9b61681cb7a';

/// See also [itemChat].
@ProviderFor(itemChat)
final itemChatProvider = AutoDisposeProvider<ChatListModel>.internal(
  itemChat,
  name: r'itemChatProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemChatHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ItemChatRef = AutoDisposeProviderRef<ChatListModel>;
String _$listChatItemHash() => r'210d08a04a21d224344d4d3496fee7cfe8bc78a3';

/// See also [ListChatItem].
@ProviderFor(ListChatItem)
final listChatItemProvider = AutoDisposeAsyncNotifierProvider<ListChatItem,
    List<ChatListModel>>.internal(
  ListChatItem.new,
  name: r'listChatItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listChatItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListChatItem = AutoDisposeAsyncNotifier<List<ChatListModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
