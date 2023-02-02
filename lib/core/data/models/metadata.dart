import '../../core.dart';

/// Base meta when receive data from a API
class MetaData {
  ///
  MetaData({
    this.totalData,
    this.message,
    this.statusCode,
    this.page,
    this.perPage,
    this.totalPage,
  });

  /// Mapping data [MetaData] from Map or Json data
  factory MetaData.fromJson(Map<String, dynamic>? json) {
    return MetaData(
      totalData: NumParser.intParse(json?['totalData']),
      message: json?['message'],
      statusCode: NumParser.intParse(json?['status_code']),
      page: NumParser.intParse(json?['page']),
      perPage: NumParser.intParse(json?['perPage']),
      totalPage: NumParser.intParse(json?['totalPage']),
    );
  }

  /// Total count data item
  final int? totalData;

  /// Message response server
  final String? message;

  /// Status code from server
  final int? statusCode;

  /// Current page
  final int? page;

  /// Item count in current page pagination
  final int? perPage;

  /// Total pages pagination
  final int? totalPage;

  /// Generate [MetaData] toMap
  Map<String, dynamic> toJson() {
    return {
      'totalData': totalData,
      'message': message,
      'statusCode': statusCode,
      'page': page,
      'perPage': perPage,
      'totalPage': totalPage,
    };
  }
}
