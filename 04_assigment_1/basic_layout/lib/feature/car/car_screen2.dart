import 'package:basic_layout/feature/car/car_entity.dart';
import 'package:basic_layout/feature/car/widget/car_item_widget.dart';
import 'package:flutter/material.dart';

class CarScreen2 extends StatefulWidget {
  const CarScreen2({super.key});

  @override
  State<CarScreen2> createState() => _CarScreen2State();
}

class _CarScreen2State extends State<CarScreen2> {
  // build 와 같은 레벨에 선언하기
  Future<List<CarEntity>> getFutureCars() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      CarEntity(id: 1, name: 'Car 1', createdAt: DateTime.now(), price: 10000),
      CarEntity(id: 2, name: 'Car 2', createdAt: DateTime.now(), price: 20000),
      CarEntity(id: 3, name: 'Car 3', createdAt: DateTime.now(), price: 30000),
      CarEntity(id: 4, name: 'Car 4', createdAt: DateTime.now(), price: 40000),
      CarEntity(id: 5, name: 'Car 5', createdAt: DateTime.now(), price: 50000),
    ];
  }

  List<CarEntity> getCars() {
    return List.generate(10, (index) {
      return CarEntity(
        id: index,
        name: 'Car $index',
        createdAt: DateTime.now(),
        price: 10000 * index,
      );
    });
  }

  final Set<int> idSet = {};

  @override
  Widget build(BuildContext context) {
    final List<CarEntity> cars = getCars();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Catalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 1, // 자식 크기 무시하고 비율로 정하기
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarItemWidget(
            car: cars[index],
            isSelected: idSet.contains(cars[index].id),
            onTap: (int id) {
              setState(() {
                if (idSet.contains(id)) {
                  idSet.remove(id);
                } else {
                  idSet.add(id);
                }
              });
            },
          );
        },
      ),
    );
  }
}
