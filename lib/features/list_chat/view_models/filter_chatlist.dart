
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_chat_model.dart';

part 'filter_chatlist.g.dart';

@riverpod
class FilterChatList extends _$FilterChatList {
  @override
  StatusUser build() {
    return StatusUser.all;
  }

  void changeFilter (StatusUser newFilter){
    state = newFilter;
  }
}