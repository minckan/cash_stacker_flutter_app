import 'package:json_annotation/json_annotation.dart';
part 'currency_api_model.g.dart';

@JsonSerializable()
class CurrencyApiModel {
  /// 조회 결과 (1: 성공, 2: Data code 오류, 3: 인증코드 오류, 4: 일일 제한횟수 마감)
  final String result;

  /// 통화 코드
  final String cur_unit;

  /// 전신환(송금) 받으실때
  final String ttb;

  /// 전신환(송금) 보내실때
  final String tts;

  /// 매매 기준율
  final String deal_bas_r;

  /// 장부 가격
  final String bkpr;

  /// 년환가료율
  final String yy_efee_r;

  /// 10일 환가료율
  final String ten_dd_efee_r;

  /// 서울외국환중개 매매기준율
  final String kftc_bkpr;

  /// 서울외국환중개 장부가격
  final String kftc_deal_bas_r;

  /// 국가/통화명
  final String cur_nm;

  CurrencyApiModel({
    required this.result,
    required this.cur_unit,
    required this.ttb,
    required this.tts,
    required this.deal_bas_r,
    required this.bkpr,
    required this.yy_efee_r,
    required this.ten_dd_efee_r,
    required this.kftc_bkpr,
    required this.kftc_deal_bas_r,
    required this.cur_nm,
  });

  // JSON -> 객체
  factory CurrencyApiModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyApiModelFromJson(json);

  // 객체 -> JSON
  Map<String, dynamic> toJson() => _$CurrencyApiModelToJson(this);
}
