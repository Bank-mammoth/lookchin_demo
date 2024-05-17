import 'package:lookchin_app/features/list_chat/models/list_chat_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_chatlist.g.dart';

@riverpod
class ListChatItem extends _$ListChatItem {
  @override
  Future<List<ChatListModel>> build() {
    return fetchListChat();
  }

  Future<List<ChatListModel>> fetchListChat() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    List<ChatListModel> res = [
      const ChatListModel(
        image:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productImag:
            "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=2599&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "ดุจอัปสร",
        location: "Sukhumvit",
        time: "9hr ago",
        message: "สวัสดีค่ะ สนใจสินค้าค่ะมีสีเดียวหรอคะ รบกวนตอบกลับหน่อยนะคะ",
        status: 0,
        buyer: 0,
      ),
      const ChatListModel(
        image:
            "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productImag: "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=2610&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title:
            "ขวัญ",
        location: "Sukhumvit",
        time: "9hr ago",
        message: "สวัสดีค่ะ สนใจค่ะ มีอันอื่นอีกไหมคะ",
        status: 0,
        buyer: 0,
      ),
      const ChatListModel(
        image:
            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productImag:
            "https://images.unsplash.com/photo-1584735174965-48c48d7edfde?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "สรุจ",
        location: "Sukhumvit",
        time: "9hr ago",
        message: "เจอกันวันนี้ ดีไหมครับ",
        status: 1,
        buyer: 0,
      ),
      const ChatListModel(
        image:
            "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productImag:
            "https://images.unsplash.com/photo-1584735174965-48c48d7edfde?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "ฉัตรเกล้า",
        location: "Sukhumvit",
        time: "9hr ago",
        message: "ลดได้ไหมครับ",
        status: 0,
        buyer: 0,
      ),

       const ChatListModel(
        image:
            "https://static.thairath.co.th/media/dFQROr7oWzulq5Fa5BcddJjVTnCyqoTxTTZkDZVdsmM8hmAOyZeVmk0YRp53Z7NrO1G.jpg",
        productImag:
            "https://scontent.fbkk29-6.fna.fbcdn.net/v/t39.30808-6/376806996_684638827039208_4926611502434033775_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=W-M72iXh9HUQ7kNvgHsnCKp&_nc_ht=scontent.fbkk29-6.fna&oh=00_AYD1wOXVhq5TilRq5imYzVn4_sl5UJWEkVMdawS_TcqNSQ&oe=664C9914",
        title: "นาย มิตร ฉาชีพ",
        location: "Sukhumvit",
        time: "12hr ago",
        message: "ลดได้ไหมครับ",
        status: 0,
        buyer: 1,
      ),
    ];
    return res;
  }
}


@Riverpod(dependencies: [])
ChatListModel itemChat (ItemChatRef ref) {
  throw UnimplementedError() ;
}