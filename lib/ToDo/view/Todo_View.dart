import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Todo_model.dart';
import '../provider/Todo_Provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController Name = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController Nameu = TextEditingController();
  TextEditingController companyu = TextEditingController();
  TodoProvider? TodoProviderTrue;
  TodoProvider? TodoProviderFalse;

  @override
  Widget build(BuildContext context) {
    TodoProviderTrue = Provider.of<TodoProvider>(context, listen: true);
    TodoProviderFalse = Provider.of<TodoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal.shade200,
          title: Text(
            "TODO",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: Name,
                cursorColor: Colors.teal,
                style: TextStyle(
                  color: Colors.teal,
                ),
                decoration: InputDecoration(
                  label: Text(
                    "Your Name",
                    style: TextStyle(color: Colors.teal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: company,
                cursorColor: Colors.teal,
                style: TextStyle(
                  color: Colors.teal,
                ),
                decoration: InputDecoration(
                  label: Text(
                    "Your Company",
                    style: TextStyle(color: Colors.teal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                TodoModal datam = TodoModal(
                  Name: Name.text,
                  company: company.text,
                );
                TodoProviderTrue!.addData(datam);
                Name.clear();
                company.clear();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: TodoProviderTrue!.Data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${TodoProviderTrue!.Data[index].Name}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "${TodoProviderTrue!.Data[index].company}",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 52,
                            width: 98,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Nameu = TextEditingController(
                                        text: TodoProviderTrue!
                                            .Data[index].Name);
                                    company = TextEditingController(
                                        text: TodoProviderTrue!
                                            .Data[index].company);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Colors.teal.shade200,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: Nameu,
                                              cursorColor: Colors.teal.shade100,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                label: Text("Name",style:TextStyle(color: Colors.black)),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            TextField(
                                              controller: companyu,
                                              cursorColor: Colors.teal,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                label: Text("Company",style:TextStyle(color: Colors.black)),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 23,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                TodoModal datam = TodoModal(
                                                  Name: Nameu.text,
                                                  company: companyu.text,
                                                );
                                                TodoProviderTrue!
                                                    .updateData(datam, index);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                width: 96,
                                                decoration: BoxDecoration(
                                                  color: Colors.teal,
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                    size: 24,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    TodoProviderTrue!.deleteData(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}