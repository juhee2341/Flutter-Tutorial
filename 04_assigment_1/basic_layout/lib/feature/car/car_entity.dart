class CarEntity {
  final int id;
  final String name;
  final DateTime createdAt;
  final int price;
  final bool broken;

  CarEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.price,
    this.broken = false,
  });
}
