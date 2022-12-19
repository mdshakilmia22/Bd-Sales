
import 'package:bd_sales/Repo/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider=FutureProvider((ref) => ProductReop().getProduct());