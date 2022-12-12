import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness/screens/login/LoginScreen.dart';
import 'package:fitness/services/DashboardService.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fitness/services/LoginService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../animation/Slide.dart';
import '../model/radio_model.dart';
import '../utils/custom_radio.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future _profileFuture;
  bool isLoading = false;

  String? firstName = "";
  String? middleName = "";
  String? lastName = "";
  String? dob = "";
  String? mobileNumber = "";
  String? maritalStatus = "";
  String? email = "";
  String? height = "";
  String? heightInInches = "";
  String? weight = "";
  File? imageFile;
  final imageKey = GlobalKey();
  List<RadioModel> maritalStatusList = <RadioModel>[];
  final DateFormat formatter1 = DateFormat('dd/MM/yyyy');
  final DateFormat formatter = DateFormat.yMMMMEEEEd();

  @override
  void initState() {
    _profileFuture = fetchProfile();
    genders.add(RadioModel("Male", MdiIcons.genderMale, false));
    genders.add(RadioModel("Female", MdiIcons.genderFemale, false));

    maritalStatusList.add(RadioModel("Unmarried", Icons.person_outline, false));
    maritalStatusList
        .add(RadioModel("Married", Icons.people_alt_outlined, false));
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dob = formatter1.format(picked);
      });
    }
  }

  List<RadioModel> genders = <RadioModel>[];
  String? _gender = "";

  Size? size;
  Offset? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Profile"),
        actions: [
          InkWell(
            onTap: () {
              logout();
              Navigator.pushReplacement(context,
                  Slide(builder: (context) => LoginScreen(), settings: null));
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 64),
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
          child: FutureBuilder(
            future: _profileFuture,
            builder: (context, state) {
              if (state.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                if (!state.hasError) {
                  return Consumer<DashboardService>(
                    builder: (_, service, __) {
                      for (var gender in genders) {
                        gender.isSelected = gender.name.toLowerCase() ==
                            service.gender?.toLowerCase();
                      }
                      for (var m in maritalStatusList) {
                        if (m.name.toLowerCase() == "married") {
                          m.isSelected =
                              'yes' == service.maritalStatus?.toLowerCase();
                        } else {
                          m.isSelected =
                              'no' == service.maritalStatus?.toLowerCase();
                        }
                      }
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) => validate(value!),
                                      keyboardType: TextInputType.name,
                                      initialValue: firstName,
                                      onChanged: (value) {
                                        firstName = value;
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'First Name',
                                          hintText: 'First Name'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) => validate(value!),
                                      keyboardType: TextInputType.name,
                                      initialValue: middleName,
                                      onChanged: (value) {
                                        middleName = value;
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'Middle Name',
                                          hintText: 'Middle Name'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) => validate(value!),
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                        lastName = value;
                                      },
                                      initialValue: lastName,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'Last Name',
                                          hintText: 'Last Name'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                          height: 60,
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 8,
                                              right: 8),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                  dob == null || dob == ""
                                                      ? "Select Date"
                                                      : dob!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      letterSpacing: 1,
                                                      fontSize: 18)),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              new Spacer(),
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Gender",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: genders.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.pinkAccent,
                                                    onTap: () {
                                                      setState(() {
                                                        for (var gender
                                                            in genders) {
                                                          gender.isSelected =
                                                              false;
                                                        }
                                                        genders[index]
                                                            .isSelected = true;
                                                        _gender =
                                                            genders[index].name;
                                                        Provider.of<DashboardService>(
                                                                context,
                                                                listen: false)
                                                            .mGender = genders[
                                                                index]
                                                            .name;
                                                      });
                                                    },
                                                    child: CustomRadio(
                                                        genders[index]),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Marital Status",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    maritalStatusList.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.pinkAccent,
                                                    onTap: () {
                                                      setState(() {
                                                        for (var m
                                                            in maritalStatusList) {
                                                          m.isSelected = false;
                                                        }
                                                        maritalStatusList[index]
                                                            .isSelected = true;
                                                        if (maritalStatusList[
                                                                    index]
                                                                .name
                                                                .toLowerCase() ==
                                                            "married") {
                                                          maritalStatus = 'yes';
                                                        } else {
                                                          maritalStatus = 'no';
                                                        }
                                                        Provider.of<DashboardService>(
                                                                    context,
                                                                    listen: false)
                                                                .maritalStatus =
                                                            maritalStatus;
                                                      });
                                                    },
                                                    child: CustomRadio(
                                                        maritalStatusList[
                                                            index]),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) => validate(value!),
                                      initialValue: mobileNumber,
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {
                                        mobileNumber = value;
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'Mobile Number',
                                          hintText: 'Mobile Number'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) =>
                                          validateEmail(value),
                                      initialValue: email,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'Email',
                                          hintText: 'Email'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      initialValue: service
                                          .profile.data?.heightFeet
                                          .toString(),
                                      onChanged: (value) {
                                        height = value;
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          labelText: 'Height',
                                          hintText: 'Height'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        heightInInches = value;
                                      },
                                      initialValue: service
                                          .profile.data?.heightInches
                                          .toString(),
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          labelText: 'Height (in inches)',
                                          hintText: 'Height (in inches)'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        weight = value;
                                      },
                                      initialValue: service.profile.data?.weight
                                          .toString(),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          labelText: 'Weight',
                                          hintText: 'Weight'),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        weight = value;
                                      },
                                      initialValue:
                                          service.profile.data?.address == 'null'
                                              ? ""
                                              : service.profile.data?.address,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                          labelText: 'Address',
                                          hintText: 'Address'),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Upload Image (Optional)",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(4),
                                              backgroundColor: Colors.black,
                                            ),
                                            onPressed: () {
                                              _getFromGallery();
                                            },
                                            child:
                                                const Text("PICK FROM GALLERY"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(4),
                                              backgroundColor: Colors.black,
                                            ),
                                            onPressed: () {
                                              _getFromCamera();
                                            },
                                            child:
                                                const Text("PICK FROM CAMERA"),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 16.0,
                            ),
                            Container(
                                child: imageFile == null
                                    ? Image.network(
                                        "https://gym.hamrofitness.com${service.profile.data?.image}",
                                        height: 100,
                                        width: 100,
                                      )
                                    : Container(
                                        height: 200,
                                        key: imageKey,
                                        child: Image.file(
                                          imageFile!,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                            const SizedBox(
                              height: 16,
                            ),
                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                :    Container(
                              margin: EdgeInsets.all(16),
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.white,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                  onPressed: () {
                                    _update();
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(child: Text("Could not fetch profile."));
              }
            },
          ),
        ),
      ),
    );
  }

  Future fetchProfile() async {
    await Provider.of<DashboardService>(context, listen: false).fetchProfile();
    firstName = Provider.of<DashboardService>(context, listen: false).firstName;
    maritalStatus =
        Provider.of<DashboardService>(context, listen: false).maritalStatus;
    middleName =
        Provider.of<DashboardService>(context, listen: false).middleName;
    dob = formatter1.format(DateTime.parse(
            Provider.of<DashboardService>(context, listen: false).dob!)) ??
        "";
    lastName = Provider.of<DashboardService>(context, listen: false).lastName;
    email = Provider.of<DashboardService>(context, listen: false).email;
    mobileNumber = Provider.of<DashboardService>(context, listen: false).mobile;
    height = Provider.of<DashboardService>(context, listen: false)
        .profile
        .data
        ?.heightFeet
        .toString();
    heightInInches = Provider.of<DashboardService>(context, listen: false)
        .profile
        .data
        ?.heightInches
        .toString();
    weight = Provider.of<DashboardService>(context, listen: false)
        .profile
        .data
        ?.weight
        .toString();
    _gender = Provider.of<DashboardService>(context, listen: false)
        .profile
        .data
        ?.gender
        .toString();
  }

  Future _update() async {
    Map<String, dynamic?> data = {};
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['marital_status'] = maritalStatus;
    data['dob'] = dob;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobileNumber;
    data['gender'] = _gender;
    data['height_feet'] = height;
    data['height_inches'] = heightInInches;
    data['weight'] = weight;
    if (imageFile != null) {
      data['file'] = await MultipartFile.fromFile(imageFile!.path,
          filename: imageFile?.path.split('/').last);
    }
    try {
      updating(true);
      await Provider.of<DashboardService>(context, listen: false)
          .updateProfile(data);
      updating(false);
      Flushbar(
        title: "Success",
        message: "Profile Update Successful. . .",
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
      ).show(context);
    } catch (e) {
      updating(false);
      Flushbar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      ).show(context);
      print(e.toString());
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? validate(String value) {
    if (value.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  void updating(bool bool) {
    setState(() {
      isLoading = bool;
    });
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future logout() async {
    await Provider.of<LoginService>(context, listen: false).logout();
  }
}
