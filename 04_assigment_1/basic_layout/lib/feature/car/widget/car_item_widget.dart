part of '../car_screen2.dart';

class CarItemWidget extends StatelessWidget {
  const CarItemWidget({
    super.key,
    required this.car,
    // required this.onTap,
    // this.isSelected = false,
    required this.inCart,
    required this.onToggle,
  });

  final CarEntity car;
  // final void Function(int id) onTap;
  // final bool isSelected;
  final bool inCart;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inCart ? Colors.grey.shade300 : Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Icon(
                    Icons.directions_car_filled,
                    size: 52,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                car.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                car.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  height: 1.3,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${car.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Chip(
                    backgroundColor: inCart
                        ? Colors.indigo
                        : Colors.grey.shade200,
                    label: Text(
                      inCart ? '담김' : '담기',
                      style: TextStyle(
                        color: inCart ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return InkWell(
    //   onTap: () {
    //     print(car.id);
    //     onTap(car.id);
    //   },
    //   borderRadius: BorderRadius.circular(12),

    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: isSelected ? Colors.amber : Colors.transparent,
    //       borderRadius: BorderRadius.circular(12),
    //       border: Border.all(width: 0.5, color: Colors.black45),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           car.name,
    //           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         Text(
    //           car.price.toString(),
    //           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
    //         ),
    //       ],
    //     ),

    //     // Column(
    //     //   children: [
    //     //     Text('name: ${car.name}'),
    //     //     Text('createdAt: ${car.createdAt}'),
    //     //     Text('price: ${car.price}'),
    //     //     ElevatedButton(
    //     //       onPressed: () {
    //     //         // 아이템
    //     //       },
    //     //       child: const Text('닫기'),
    //     //     ),
    //     //   ],
    //     // ),
    //   ),
    // );
  }
}
