import 'package:basic_layout/feature/car/car_entity.dart';
import 'package:basic_layout/feature/car/view_model/car_view_model.dart';
import 'package:flutter/material.dart';

part 'widget/car_grid_widget.dart';
part 'widget/car_item_widget.dart';
part 'widget/confirm_button_widget.dart';

class CarScreen2 extends StatefulWidget {
  const CarScreen2({
    super.key,
    required this.viewModel,
  });
  final CarViewModel viewModel;

  @override
  State<CarScreen2> createState() => _CarScreen2State();
}

class _CarScreen2State extends State<CarScreen2> {
  late final Future<List<CarEntity>> _carFuture;
  final Set<int> _cart = {};

  @override
  void initState() {
    super.initState();
    _carFuture = widget.viewModel.fetchCars();
  }

  void _toggleCart(CarEntity car) {
    // 자식에서 전달된 콜백이 부모의 setState를 트리거한다.
    setState(() {
      if (_cart.contains(car.id)) {
        _cart.remove(car.id);
      } else {
        _cart.add(car.id);
      }
    });
  }

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
      body: FutureBuilder(
        future: _carFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No cars available'));
          } else {
            final carList = snapshot.data!;
            return Column(
              children: [
                _CarGridWidget(
                  carList: carList,
                  toggleCart: _toggleCart,
                  selectedIds: _cart,
                ),
                _ConfirmButtonWidget(
                  carItemSize: _cart.length,
                ),
              ],
            );
          }
        },
      ),
      // body: GridView.builder(
      //   padding: const EdgeInsets.symmetric(horizontal: 18),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 8,
      //     mainAxisSpacing: 8,
      //     childAspectRatio: 3 / 1, // 자식 크기 무시하고 비율로 정하기
      //   ),
      //   itemCount: cars.length,
      //   itemBuilder: (context, index) {
      //     return CarItemWidget(
      //       car: cars[index],
      //       isSelected: idSet.contains(cars[index].id),
      //       onTap: (int id) {
      //         setState(() {
      //           if (idSet.contains(id)) {
      //             idSet.remove(id);
      //           } else {
      //             idSet.add(id);
      //           }
      //         });
      //       },
      //     );
      //   },
      // ),
    );
  }
}
