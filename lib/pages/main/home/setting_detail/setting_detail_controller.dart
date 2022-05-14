import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

class SettingDetailController extends GetxController {
  int selectedDate = 0;
  int dropItem = 0;
  int? selectedRoom;
  int? selectedHour;

  List<int> maxNumberPeople = [10, 12, 15, 18, 20];
  List<int> minNumberPeople = [6, 8, 10, 12, 15];
  List<String> workTime = [
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30'
  ];
  List<int> rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  List<String> months =
  List.generate(12, (index) => '${(DateTime.now().month + index) % 12}');

  @override
  void onInit() {

    initializeDateFormatting();
    super.onInit();
  }

  void goBack() => Get.back();

  void chooseRoom(int index) {
    selectedRoom = index;
    Get.log(selectedRoom.toString());
    update();
  }

  void chooseHour(int index) {
    selectedHour = index;
    update();
  }

  void chooseDropItem(String? value){
    if(value!=null){
      int index = months.indexOf(value);
      dropItem = index;
      update();
    }

  }
}