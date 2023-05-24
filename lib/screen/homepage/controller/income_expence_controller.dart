import 'package:expence_tracker/utils/dbhelper.dart';
import 'package:get/get.dart';

class income_exepence_Controller extends GetxController {
  RxList<Map> readTransactionList = <Map>[].obs;
  RxList<Map> totalincome = <Map>[].obs;
  RxList<Map> totalexpence = <Map>[].obs;
  Rx<DateTime> current = DateTime.now().obs;
  Rx<DateTime> date=DateTime.now().obs;
  Rx<DateTime> Date=DateTime.now().obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble totalIncome = 0.0.obs;
  RxDouble totalExpense = 0.0.obs;
  RxList<String> category=<String>[
    "💲 Salary",
    "🍴 Food",
    "📱 Recharge",
    "⛽ Category",
    "🏠 Home Rent",
    "🎓 Education",
    "🍴 Glocery",
    "🛍️ Shopping",
    "🏥 Health Care",
    "✈ Travel",
  ].obs;
  DbHelper dbHelper = DbHelper();

  Future<void> readdata() async {
    DbHelper dbHelper = DbHelper();
    readTransactionList.value = await dbHelper.readData();
  }

  void filterDataRead(int status) async {
    DbHelper dbHelper = DbHelper();
    readTransactionList.value = await dbHelper.filterRead(statusCode: status);
  }

  void delete(int id) {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteData(id: id);
    readdata();
  }

  Future<void> readOnlyIncome() async {
    totalincome.value = await dbHelper.readIncome();
  }

  void totalIncomeAmount() {
    readOnlyIncome();
    totalIncome.value = 0;

    for (int i = 0; i < totalincome.length; i++) {
      String value = totalincome[i]['amount'];
      int amount = int.parse(value);
      totalIncome.value = totalIncome.value + amount;
    }
  }

  Future<void> readOnlyExpense() async {
    totalexpence.value = await dbHelper.readExpense();
  }

  void totalBalance() {
    readdata();
    totalAmount.value = 0;

    totalAmount.value = totalIncome.value - totalExpense.value;
  }

  void totalExpenseAmount() {
    readOnlyExpense();
    totalExpense.value = 0;

    for (int i = 0; i < totalexpence.length; i++) {
      String value = totalexpence[i]['amount'];
      int amount = int.parse(value);
      totalExpense.value = totalExpense.value + amount;
    }

    print(
        "======================================================totalIncomeAmount");
  }
}