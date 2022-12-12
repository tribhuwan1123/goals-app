import 'dart:convert';

import 'package:fitness/model/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class DefaultTrainingPlanScreen extends StatefulWidget {
  String title;
  List<DefaultTrainingPlan>? defaultTrainingPlans;

  DefaultTrainingPlanScreen(this.title, this.defaultTrainingPlans, {super.key});

  @override
  State<DefaultTrainingPlanScreen> createState() =>
      _DefaultTrainingPlanScreenState();
}

class _DefaultTrainingPlanScreenState extends State<DefaultTrainingPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top:16, bottom: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              image: const AssetImage("assets/images/two.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            )),
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.defaultTrainingPlans?.length,
              itemBuilder: (BuildContext context, int index) {
                return trainingPlan(widget.defaultTrainingPlans?[index]);
              }),
        ),
      ),
    );
  }

  Widget trainingPlan(DefaultTrainingPlan? defaultTrainingPlan) {
    List<String> activities =
        List.from(jsonDecode(defaultTrainingPlan?.activity ?? ""));
    List<List<dynamic>> days =
        List.from(jsonDecode(defaultTrainingPlan?.days ?? "[]"));
    List<String> sets =
        List.from(jsonDecode(defaultTrainingPlan?.sets ?? "[]"));
    List<String> weights =
        List.from(jsonDecode(defaultTrainingPlan?.weights ?? "[]"));
    List<String> restTime =
        List.from(jsonDecode(defaultTrainingPlan?.restTime ?? "[]"));
    List<String> repetitions =
        List.from(jsonDecode(defaultTrainingPlan?.repetition ?? "[]"));

    List<String> startDate = [];
    List<String> endDate = [];

    if (defaultTrainingPlan?.startDate != null &&
        defaultTrainingPlan?.startDate != "null") {
      startDate = List.from(jsonDecode(defaultTrainingPlan?.startDate ?? "[]"));
    }
    if (defaultTrainingPlan?.endDate != null &&
        defaultTrainingPlan?.endDate != "null") {
      endDate = List.from(jsonDecode(defaultTrainingPlan?.endDate ?? "[]"));
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Activity: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          activities[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Level: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          defaultTrainingPlan?.level ?? "",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Days: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(days[index].toString()),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sets: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          sets[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Repitions: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          repetitions.isNotEmpty ? repetitions[index] : "0",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Weights: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          weights[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rest Time: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          restTime[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Start Date: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          startDate.isEmpty ? "Not available" : startDate[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "End Date: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          endDate.isEmpty ? "Not available" : endDate[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
