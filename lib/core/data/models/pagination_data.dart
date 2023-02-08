/// Handle Paginate Data
class PaginationData<T> {
  //PaginationData({required this.data, required this.meta});
  PaginationData({required this.data});

  /// [T] as data type.
  ///
  /// Example your get data from API `List<YourData>`, this result data is [T]
  final T data;

  /// [Meta] as metadata in pagination.
  ///
  /// Like info current page, info next page, total page
  /// and many more info in pagination data
//final Meta meta;
}
