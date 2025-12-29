import 'package:basic_layout/feature/car/car_entity.dart';
import 'package:flutter/material.dart';

class CarViewModel extends ChangeNotifier {
  final List<CarEntity> _cars = [
    CarEntity(
      id: 1,
      name: 'Roadster S',
      createdAt: DateTime(2023, 7, 10),
      price: 42000,
    ),
    CarEntity(
      id: 2,
      name: 'Family Van',
      createdAt: DateTime(2022, 11, 2),
      price: 38000,
    ),
    CarEntity(
      id: 3,
      name: 'Trail X',
      createdAt: DateTime(2024, 1, 15),
      price: 51000,
    ),
    CarEntity(
      id: 4,
      name: 'City Mini',
      createdAt: DateTime(2023, 4, 3),
      price: 28000,
    ),
    CarEntity(
      id: 5,
      name: 'GT Turbo',
      createdAt: DateTime(2024, 5),
      price: 64000,
    ),
    CarEntity(
      id: 6,
      name: 'Eco Wagon',
      createdAt: DateTime(2022, 8, 22),
      price: 33000,
    ),
  ];

  Future<List<CarEntity>> fetchCars() async {
    /// 네트워크 통신 딜레이 모방
    await Future.delayed(const Duration(seconds: 1));
    return _cars;
  }
}
