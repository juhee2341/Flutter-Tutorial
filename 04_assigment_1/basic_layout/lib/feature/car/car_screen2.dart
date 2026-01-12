import 'package:basic_layout/feature/car/car_entity.dart';
import 'package:basic_layout/feature/car/view_model/car_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'widget/car_grid_widget.dart';
part 'widget/car_item_widget.dart';
part 'widget/confirm_button_widget.dart';

class CarScreen2 extends HookWidget {
  const CarScreen2({
    super.key,
    required this.viewModel,
  });

  final CarViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final cart = useState<Set<int>>({});
    final carFuture = useMemoized(
      viewModel.fetchCars,
    );

    void toggleCart(CarEntity car) {
      // 자식에서 전달된 콜백이 부모의 setState를 트리거한다.
      if (cart.value.contains(car.id)) {
        // 직접적인 메소드 (add, remove) 사용 시 값은 변경되지만 리렌더링 안됨
        cart.value = cart.value.where((item) => item != car.id).toSet();
      } else {
        cart.value = {...cart.value, car.id};
        print('add!! car.id');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Catalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: carFuture,
        builder: (context, snapshot) {
          // snapshot 은 상태와 같음 (로딩, 에러, 데이터) 상태 일 때 UI 처리
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
                  toggleCart: toggleCart,
                  selectedIds: cart.value,
                ),
                _ConfirmButtonWidget(
                  carItemSize: cart.value.length,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
