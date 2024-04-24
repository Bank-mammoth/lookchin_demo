import 'package:equatable/equatable.dart';

class DataSearchModel extends Equatable {
  final int id;
  final String searchName;

  const DataSearchModel({
    required this.id,
    required this.searchName,
  });

  @override
  List<Object> get props => [id, searchName];

  DataSearchModel copyWith({
    int? id,
    String? searchName,
  }) {
    return DataSearchModel(
      id: id ?? this.id,
      searchName: searchName ?? this.searchName,
    );
  }
}

List<DataSearchModel> allSearch = [
  const DataSearchModel(searchName: "คาเฟ่ลับ", id: 0),
  const DataSearchModel(searchName: "สูตรอาหารง่ายๆ", id: 1),
  const DataSearchModel(searchName: "วิธีลดน้ำหนัก", id: 2),
  const DataSearchModel(searchName: "เคล็ดลับการเงิน", id: 3),
  const DataSearchModel(searchName: "ร้านอาหารใกล้ฉัน", id: 4),
  const DataSearchModel(searchName: "ออกกำลังกายที่บ้าน", id: 5),
  const DataSearchModel(searchName: "ซีรีส์เกาหลี", id: 6),
  const DataSearchModel(searchName: "สถานที่ท่องเที่ยว", id: 7),
  const DataSearchModel(searchName: "ทิปส์แต่งบ้าน", id: 8),
  const DataSearchModel(searchName: "เทคนิคการเรียน", id: 9),
  const DataSearchModel(searchName: "รถยนต์มือสอง", id: 10),
  const DataSearchModel(searchName: "การเลี้ยงแมว", id: 11),
  const DataSearchModel(searchName: "โปรโมชั่นเที่ยวบิน", id: 12),
  const DataSearchModel(searchName: "คำแนะนำการจัดสวน", id: 13),
  const DataSearchModel(searchName: "รองเท้าวิ่ง", id: 14),
  const DataSearchModel(searchName: "สูตรทำขนม", id: 15),
  const DataSearchModel(searchName: "อุปกรณ์สำนักงาน", id: 16),
  const DataSearchModel(searchName: "คาเฟ่ใหม่ๆ", id: 17),
  const DataSearchModel(searchName: "หนังสือขายดี", id: 18),
  const DataSearchModel(searchName: "เกมมือถือน่าเล่น", id: 19),
  const DataSearchModel(searchName: "คลาสเรียนโยคะ", id: 20),
  const DataSearchModel(searchName: "ภาษาอังกฤษ", id: 21),
  const DataSearchModel(searchName: "ปลูกผักบนดาดฟ้า", id: 22),
  const DataSearchModel(searchName: "บาริสต้าพื้นฐาน", id: 23),
  const DataSearchModel(searchName: "งานอดิเรก", id: 24),
  const DataSearchModel(searchName: "สุนัขพันธุ์เล็ก", id: 25),
  const DataSearchModel(searchName: "หางานออนไลน์", id: 26),
  const DataSearchModel(searchName: "เทศกาลดนตรี", id: 27),
  const DataSearchModel(searchName: "วิธีเล่นกีตาร์", id: 28),
  const DataSearchModel(searchName: "การจัดการเวลา", id: 29),
];
