import 'package:tomisha_work_test/data/models/paginate.dart';

class ApiResponse<T> {
  late Status status;
  T? data;
  List<T>? listData;
  late String? message;
  Paginate? paginate;

  ApiResponse.initial() : status = Status.INITIAL;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  ApiResponse.fromJson(Map json, getFromJson)
    : data = json['data'] != null ? getFromJson(json['data']) : null,
      listData = null,
      status = Status.COMPLETED,
      message = json['message'],
      paginate = json['paginate'] != null
          ? Paginate.fromJson(json['paginate'])
          : null;

  ApiResponse.fromJsonList(Map json, getFromJson)
    : listData = List<T>.from(json['data'].map((x) => getFromJson(x))),
      data = null,
      status = Status.COMPLETED,
      message = json['message'],
      paginate = json['paginate'] != null
          ? Paginate.fromJson(json['paginate'])
          : null;

  @override
  String toString() {
    return 'Status:$status \n Message: $message \n Data: $data';
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }
