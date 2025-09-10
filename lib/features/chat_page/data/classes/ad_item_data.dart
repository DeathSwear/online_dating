class AdItemData {
  final int count;
  final String price;
  final int id;
  final String? specialText;
  AdItemData(
      {required this.count,
      required this.id,
      required this.price,
      this.specialText});
}
