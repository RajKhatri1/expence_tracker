import 'package:expence_tracker/screen/homepage/controller/income_expence_controller.dart';
import 'package:expence_tracker/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Transcation_screen extends StatefulWidget {
  const Transcation_screen({Key? key}) : super(key: key);

  @override
  State<Transcation_screen> createState() => _Transcation_screenState();
}

class _Transcation_screenState extends State<Transcation_screen> {
  TextEditingController txtaddc = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.readDb2();
  }
  String status = "0";
  income_exepence_Controller controller = Get.put(
    income_exepence_Controller(),
  );
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtNote = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}');
  TextEditingController txtTime = TextEditingController(
      text:
          '${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${TimeOfDay.now().hour >= 0 && TimeOfDay.now().hour <= 12 ? 'AM' : 'PM'}');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Get.defaultDialog(
                  contentPadding: EdgeInsets.all(10),
                  title: "Add Category",
                  content: Column(
                    children: [
                      TextField(
                        controller: txtaddc,
                        decoration: InputDecoration(
                          hintText: "Add category",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              DbHelper dbHelper = DbHelper();
                              String catagory = txtaddc.text;
                              dbHelper.insertcatagory(category: catagory);
                              txtaddc.clear();

                              // controller.itemList.add(dropDownItem(name: txtaddc.text));

                              Get.back();
                            },
                            child: Text("add"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(5),
                height: 10,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                alignment: Alignment.center,
                child: Text("Add category"),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Transcations",
            style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: TextField(
                //   decoration: InputDecoration(
                //     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent,width: 2),),
                //     hintText: "category",
                //     hintStyle: TextStyle(color: Colors.purple.shade100),
                //     border: OutlineInputBorder(),
                //   ),
                //   controller: txtCategory,
                // ),
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    dropdownColor: Color(0xff1b1b1d),
                    value: controller.cateName.value,
                    items: controller.cateList.map((e) => DropdownMenuItem(value: "${e['category']}",
                        child: Text(
                              "${e['category']}",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.cateName.value = value as String;

                      print(controller.cateName);
                    },
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent,width: 1),),
                    hintText: "Note",
                    hintStyle: TextStyle(color: Colors.purple.shade100),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtNote,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent,width: 2),),
                    hintText: "₹ Amount",
                    hintStyle: TextStyle(color: Colors.purple.shade100),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtAmount,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: InkWell(onTap:() {
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(3000));
                    },child: Icon(Icons.date_range)),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtDate,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: txtTime,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      // decoration: BoxDecoration(border: Border.symmetric(vertical: )),
                      child: DropdownButton(
                        dropdownColor: Colors.grey.shade300,
                        // borderRadius: BorderRadius.circular(25),
                        items: [
                          DropdownMenuItem(
                              child: Text("Income",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 15)),
                              value: "0"),
                          DropdownMenuItem(
                            child: Text("Expence",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 15)),
                            value: "1",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            status = value!;
                          });
                        },
                        value: status,
                        style: TextStyle(
                            fontSize: 18, letterSpacing: 1, color: Colors.black),
                        alignment: Alignment.center,
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(height: 150,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Container(
                    width: 170,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.deepPurple),
                    child: TextButton(onPressed: () {

                    }, child: Text("SAVE & ADD MORE",style:  TextStyle(color: Colors.white)),),
                  ),
                  SizedBox(width: 2,),
                  Container(
                    width: 170,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.deepPurple),
                    child: TextButton(onPressed: () {
                      controller.stotalIncomeAmount();
                      DbHelper dbhelper = DbHelper();
                      dbhelper.insertData(category: controller.cateName.value, notes: txtNote.text, status: status, amount: txtAmount.text, types: "-", date: txtDate.text, time: txtTime.text);
                      Get.back();
                    }, child: Text("SAVE & CLOSE",style: TextStyle(color: Colors.white)),),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
