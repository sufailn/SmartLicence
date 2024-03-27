import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_license/customwidget/textfield.dart';

class viewvechicle extends StatelessWidget {
  const viewvechicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: ExpansionTile(
                  expandedAlignment: Alignment.bottomLeft,
                  leading: CircleAvatar(),
                  title: Text("hi"),
                  subtitle: Text('34546568'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Registration number: "),
                                    Text("Brief discription: "),
                                    Text("Address"),
                                    Text("Makers Name"),
                                    Text("Name of Regd Owner"),
                                    Text("S/o,d/o,w/o"),
                                    Text("Temporary adress"),
                                    Text("Class of vechicle"),
                                    Text("Makers Classification"),
                                    Text("Type of body"),
                                    Text("Chassis Number"),
                                    Text("Engine Number"),
                                    Text("Fuel"),
                                    Text("Colour"),
                                    Text("Month of Manufactute"),
                                    Text("Year of Manufature"),
                                    Text("Horse Power"),
                                    Text("Weight"),
                                    Text("Number of cilinders"),
                                    Text("Seating Capacity"),
                                    Text("Tax licence No."),
                                    Text("Date of Delivery"),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Registration number: sdasfda"),
                                  Text("Brief discription"),
                                  Text("Address"),
                                  Text("Makers Name"),
                                  Text("Name of Regd Owner"),
                                  Text("S/o,d/o,w/o"),
                                  Text("Temporary adress"),
                                  Text("Class of vechicle"),
                                  Text("Makers Classification"),
                                  Text("Type of body"),
                                  Text("Chassis Number"),
                                  Text("Engine Number"),
                                  Text("Fuel"),
                                  Text("Colour"),
                                  Text("Month of Manufactute"),
                                  Text("Year of Manufature"),
                                  Text("Horse Power"),
                                  Text("Weight"),
                                  Text("Number of cilinders"),
                                  Text("Seating Capacity"),
                                  Text("Tax licence No."),
                                  Text("Date of Delivery"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
