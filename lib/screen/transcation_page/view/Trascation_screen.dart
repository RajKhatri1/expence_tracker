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
          actions: [],
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
          title: Text(
            "Transcations",
            style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "catagory",
                          hintStyle: TextStyle(color: Colors.purple.shade100),
                          border: OutlineInputBorder(),
                        ),
                        controller: txtCategory,
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return  Container(
                              height: 300,
                              color: Colors.purpleAccent.shade100,
                              child: Column(
                                children: [
                                  Text("PICK CATEGORY",style: TextStyle(letterSpacing: 2),),
                                ],
                              ),
                            );
                          },);
                        }, child:Text("Add"),),
                        Icon(Icons.add),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Note",
                    hintStyle: TextStyle(color: Colors.purple.shade100),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtNote,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "₹ Amount",
                    hintStyle: TextStyle(color: Colors.purple.shade100),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtAmount,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: InkWell(onTap:() {
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(3000));
                    },child: Icon(Icons.date_range)),
                    border: OutlineInputBorder(),
                  ),
                  controller: txtDate,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: txtTime,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
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
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                    DbHelper dbhelper = DbHelper();
                    dbhelper.insertData(category: txtCategory.text, notes: txtNote.text, status: status, amount: txtAmount.text, types: "-", date: txtDate.text, time: txtTime.text);
                    Get.back();
                }, child: Text("add"),style:ElevatedButton.styleFrom(backgroundColor: Colors.purple)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
