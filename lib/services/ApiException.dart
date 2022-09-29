class ApiException implements Exception {
  final String message;
  
  ApiException(this.message);

  @override
  String toString() {
    return message;
    // return super.toString();
  }
}