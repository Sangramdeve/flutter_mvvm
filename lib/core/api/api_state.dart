enum Status {LOADING, COMPLETED, ERROR }

class ApiState<T> {
  Status status;
  T? data;
  String? message;


  ApiState.loading(this.status);

  ApiState.completed(this.data) : status = Status.COMPLETED;

  ApiState.error(this.message) : status = Status.ERROR;

}

