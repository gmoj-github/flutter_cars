class ApiResponse<T> {
  late bool ok;
  late String message;
  T? result;

  ApiResponse.ok(this.result){
    ok = true;
  }

  ApiResponse.error(this.message){
    ok = false;
  }
}
