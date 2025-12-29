import 'package:basic_layout/feature/car/car_entity.dart';
import 'package:flutter/material.dart';

class CarItemWidget extends StatelessWidget {
  const CarItemWidget({
    super.key,
    required this.car,
    required this.onTap,
    this.isSelected = false,
  });

  final CarEntity car;
  final void Function(int id) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(car.id);
        onTap(car.id);
      },
      borderRadius: BorderRadius.circular(12),

      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.5, color: Colors.black45),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              car.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              car.price.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ],
        ),

        // Column(
        //   children: [
        //     Text('name: ${car.name}'),
        //     Text('createdAt: ${car.createdAt}'),
        //     Text('price: ${car.price}'),
        //     ElevatedButton(
        //       onPressed: () {
        //         // 아이템
        //       },
        //       child: const Text('닫기'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
