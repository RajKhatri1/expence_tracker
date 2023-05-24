import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homepage/controller/income_expence_controller.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  income_exepence_Controller controller = Get.put(income_exepence_Controller());

  @override
  void initState() {
    super.initState();
    controller.readdata();
    controller.readDb2();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // animationDuration: Duration(seconds: 3),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Transactions"),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.filter_alt_outlined,color: Colors.white,size: 25,),),
              SizedBox(width: 5,),
              Icon(Icons.search,color: Colors.white,size: 30,),
              SizedBox(width: 10,),
            ],
            bottom: TabBar(

              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              automaticIndicatorColorAdjustment: true,
              physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
              // physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
              padding: EdgeInsets.all(10),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Income",
                ),
                Tab(
                  text: "Expence",
                ),
              ],
            ),
          ),
          body:TabBarView(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.readTransactionList[index]
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
                                : Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: controller!.readTransactionList[index]
                      ['status'] ==
                          0
                          ? ListTile(
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
                      ):Container(decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white)),)
                  ),
                  itemCount: controller.readTransactionList.length),
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: controller!.readTransactionList[index]
                            ['status'] ==
                                1
                                ? Colors.red
                                : Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: controller!.readTransactionList[index]
                      ['status'] ==
                          1
                          ? ListTile(
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
                      ):Container(decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white)),)
                  ),
                  itemCount: controller.readTransactionList.length),
            ],
          )
        ),
      ),
    );
  }
}
