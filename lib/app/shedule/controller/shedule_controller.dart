import 'package:get/get.dart';
import 'package:weeklysheduler/app/landing/controller/landing_controller.dart';

class SheduleController extends GetxController{
@override
  void onInit()async {
    
    await fetchDB();
    super.onInit();
  }
  fetchDB() async{
    final ctrl = Get.find<LandingController>();
    final list = await ctrl.getAll();
    print(list);
  }
}