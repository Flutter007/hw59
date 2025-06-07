import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/helpers/request.dart';

class CheckStatusNotifier extends AsyncNotifier<void> {
  @override
  build() {}
  Future<void> changeStatus(String? carID, String status) async {
    final url =
        'https://my-db-7777-default-rtdb.europe-west1.firebasedatabase.app/cars/$carID.json';
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await request(url, method: 'PATCH', body: {"status": status});
    });
  }
}

final changeStatusProvider = AsyncNotifierProvider<CheckStatusNotifier, void>(
  CheckStatusNotifier.new,
);
