import 'package:college_saathi/data/repositories/user/user_repository.dart';
import 'package:college_saathi/features/authentication/models/history_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxList<HistoryModel> requests = <HistoryModel>[].obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final allRequests = await userRepository.fetchHistory();
      requests(allRequests);
    } catch (e) {
      requests(<HistoryModel>[]); // Handle the error as needed
    }
  }
}