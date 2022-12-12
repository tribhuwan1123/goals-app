import 'dart:convert';

import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:expandable/expandable.dart';

class DietPlan extends StatelessWidget {
  String title;
  List<DefaultDietPlan>? dietPlans;

  DietPlan(this.title, this.dietPlans, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      title: Text(title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      children: [
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dietPlans?.length,
            itemBuilder: (BuildContext context, int index) {
              return dietPlan(dietPlans![index]);
            })
      ],
    );
  }

  Widget dietPlan(DefaultDietPlan dietPlan) {
    List<String> breakfasts = List.from(jsonDecode(dietPlan.breakfast ?? ""));
    List<String> lunchs = List.from(jsonDecode(dietPlan.lunch ?? ""));
    List<String> dinners = List.from(jsonDecode(dietPlan.dinner ?? ""));
    List<String> meal4s = List.from(jsonDecode(dietPlan.meal4 ?? ""));
    List<String> meal5s = List.from(jsonDecode(dietPlan.meal5 ?? ""));

    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return dietPlanWidget(
              breakfasts[index], lunchs[index], dinners[index], index, meal4s[index],meal5s[index]);
        });
  }

  Widget dietPlanWidget(
      String breakfast, String lunch, String dinner, int index, String meal4, String meal5) {
    var day = index == 0
        ? "Sunday"
        : index == 1
            ? "Monday"
            : index == 2
                ? "Tuesday"
                : index == 3
                    ? "Wednesday"
                    : index == 4
                        ? "Thursday"
                        : index == 5
                            ? "Friday"
                            : "Saturday";
    return Card(
      margin: EdgeInsets.only(top: 8),
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(8),
        child: ExpansionTile(
          title: Text(day),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Breakfast: ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(breakfast, style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Lunch: ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(lunch, style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Dinner: ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(dinner, style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Meal 4: ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(meal4, style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Meal 5: ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(meal5, style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
