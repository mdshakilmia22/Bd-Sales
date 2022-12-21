
import 'package:bd_sales/Repo/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider=FutureProvider((ref) => ProductReop().getProduct());
final flashProvider=FutureProvider((ref) => ProductReop().getFlash());
final fruitsProvider=FutureProvider((ref) => ProductReop().getFruits());
final oilProvider=FutureProvider((ref) => ProductReop().getOil());
final sugarProvider=FutureProvider((ref) => ProductReop().getSugar());
final noodlesProvider=FutureProvider((ref) => ProductReop().getNoodles());
final biscuitsProvider=FutureProvider((ref) => ProductReop().getBiscuits());