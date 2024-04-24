import 'package:equatable/equatable.dart';

class RecentModel extends Equatable {
  final int id;
  final String recentName;

  const RecentModel({
    required this.id,
    required this.recentName,
  });

  @override
  List<Object> get props => [id, recentName];

  RecentModel copyWith({
    int? id,
    String? recentName,
  }) {
    return RecentModel(
      id: id ?? this.id,
      recentName: recentName ?? this.recentName,
    );
  }
}

//  const List<RecentModel>  allRecent = [
//   RecentModel(recentName: "ร้านอาหารใกล้ฉัน",id: 1),
//   RecentModel(recentName: "คาเฟ่ลับ",id: 2),
//   RecentModel(recentName: "ถนนชำรุด",id: 3),
//   RecentModel(recentName: "น้ำท่วม",id: 4),
//   RecentModel(recentName: "ร้านส้มตำ",id: 5),
//   RecentModel(recentName: "สถานที่ท่องเที่ยวใกล้ฉัน",id: 6),
//   RecentModel(recentName: "ที่แฮงค์เอาท์",id: 7),
// ];