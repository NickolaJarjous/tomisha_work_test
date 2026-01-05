class Paginate {
  Paginate({
    this.currentPage,
    this.perPage,
    this.total,
  });

  final num? currentPage;
  final num? perPage;
  final num? total;

  factory Paginate.fromJson(Map json) {
    return Paginate(
      currentPage: json["currentPage"] ?? 0,
      perPage: json["per_page"] ?? 15,
      total: json["total"] ?? 0,
    );
  }
}
