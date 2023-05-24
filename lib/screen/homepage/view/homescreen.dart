import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/income_expence_controller.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  void initState() {
   controller.totalBalance();
   controller.totalIncomeAmount();
   controller.totalExpenseAmount();
    super.initState();
  }
  income_exepence_Controller controller = Get.put(income_exepence_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu,color: Colors.purple),
            title: Text("Settle Sheet",style: TextStyle(color: Colors.purple),),
            backgroundColor: Colors.white,
            actions: [
              Icon(Icons.search,color: Colors.purple,size: 30,),
              SizedBox(width: 10,),
            ]),
        backgroundColor: Colors.grey.shade300,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // controller.totalIncomeAmount();
              // controller.totalExpenseAmount();
              // controller.totalBalance();
              Get.toNamed('/add');
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.purple),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black,blurStyle: BlurStyle.outer,blurRadius: 1)],
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(40),
                    //   bottomRight: Radius.circular(40),
                    // ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () =>  Text(
                            "₹ ${controller.totalAmount}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 25,
                                        bottom: 25,
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.file_download_outlined,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Income",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 4,
                                            ),
                                            child: Obx(
                                              () => Text(
                                                "₹ ${controller.totalIncome}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      // color: Colors.black,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 25,
                                          bottom: 25,
                                          left: 15,
                                          right: 15,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.file_upload_outlined,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Expense",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  "₹   ${controller.totalExpense}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(onPressed: () {
                            Get.toNamed('/data');
                          }, child: Text("See Transcation",style: TextStyle(color: Colors.black,fontSize: 18)),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 0,blurStyle: BlurStyle.outer),],                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(alignment: Alignment.centerLeft,child: Text("Latest transaction",style: TextStyle(fontSize: 18))),
                            SizedBox(height: 10,),
                            Divider(),
                            ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller!.readTransactionList[index]
                                        ['status'] ==
                                            0
                                            ? Colors.green
                                            : Colors.red),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                        "${controller.readTransactionList[index]['category']}"),
                                    leading: Text(
                                        "${controller.readTransactionList[index]['id']}"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "₹ ${controller.readTransactionList[index]['amount']}"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            var id = controller
                                                .readTransactionList[index]['id'];
                                            controller!.delete(id);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.purpleAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: controller.readTransactionList.length),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
