import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchvechicle extends StatelessWidget {
  const Searchvechicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Smart ",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "License.",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(7)),
                width: 200,
                child: CupertinoSearchTextField(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Search Vechicle"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.red),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
                child: ExpansionTile(
              expandedAlignment: Alignment.bottomLeft,
              leading: CircleAvatar(),
              title: Text("Swift VXI"),
              subtitle: Text('KL-11-BC-987'),
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
                ),
                ElevatedButton(onPressed: () {}, child: Text('Sent Fine'))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
