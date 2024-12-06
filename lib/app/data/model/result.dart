class APIResult<T> {
  final T? data;
  final String? error;
  final bool isLoading;

  APIResult({this.data, this.error, this.isLoading = false});

  factory APIResult.loading() => APIResult(isLoading: true);
  factory APIResult.success(T data) => APIResult(data: data);
  factory APIResult.error(String error) => APIResult(error: error);

  bool get isSuccessful => data != null;
  bool get isError => error != null;
  bool get isLoadingState => isLoading;
  bool get isIdle => data == null && error == null && !isLoading;
}
