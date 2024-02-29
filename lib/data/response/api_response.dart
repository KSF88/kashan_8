import 'package:flutter_application_1/data/response/status.dart';

class ApiResponse<T> {
  ApiResponse(this.data, this.message, this.status);

  Status? status;
  T? data;
  String? message;

  ApiResponse.LOADING() : status = Status.LOADING;
  ApiResponse.COMPLETED() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;



  @override
  String toString() {
    return "status : $status \n message : $message \n data : $data";
  }
}
