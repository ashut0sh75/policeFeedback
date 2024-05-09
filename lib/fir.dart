import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police_feedback/customButton.dart';
import 'package:police_feedback/homef.dart';
import 'package:police_feedback/navscreen.dart';

class fir extends StatefulWidget {
  final _firKey = GlobalKey<FormState>();
  String _crimeType = 'Scam';

  @override
  State<fir> createState() => _firState();
}

class _firState extends State<fir> {
  final _formKey = GlobalKey<FormState>();
  String _crimeType = 'Scam'; // Set a default value for _cropType

  double _landArea = 0.0;
  double _expectedProduction = 0.0;
  double _issuePercentage = 0.0;
  int _quantity = 0;
  String _equivalentVFGAUnit = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: ClipPath(
                clipper: Customshape(),
                // Assuming your custom clipper for the shape
                child: Stack( // Use a Stack to position elements on top of each other
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 150,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.blue,
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text(
                                'Police Feedback System',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 28),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/asset2.png'),
                  fit: BoxFit.cover, // Specify the fit as per your requirement
                ),
              ),
              height: 350,
              width: 400,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDFF5FF),
                  border: Border.all(
                    width: 2, // adjust border width as needed
                    color: Colors.grey, // adjust border color as needed
                  ),
                  borderRadius: BorderRadius.circular(12), // adjust border radius as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter Name',
                                  border: OutlineInputBorder(), // apply border to text field
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter expected production';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _expectedProduction = double.parse(value!);
                                },
                              ),
                            ),
                            SizedBox(width: 10),

                          ],
                        ),
                        SizedBox(height: 10,),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Select Crop Type',
                            border: OutlineInputBorder(), // apply border to dropdown
                          ),
                          value: _crimeType,
                          onChanged: (String? newValue) {
                            _crimeType = newValue!;
                          },
                          items: <String>['Scam', 'Extortion', 'Assault', 'Theft', 'Murder']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter police station of your area',
                                  border: OutlineInputBorder(), // apply border to text field
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a land area';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _landArea = double.parse(value!);
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),



                        SizedBox(height: 10),

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'District',
                            border: OutlineInputBorder(), // apply border to text field
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter issue percentage';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _issuePercentage = double.parse(value!);
                          },
                        ),

                        SizedBox(height: 10),

                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Your fir description',
                            border: OutlineInputBorder(), // apply border to text field
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter quantity';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _quantity = int.parse(value!);
                          },
                        ),

                        SizedBox(height: 10),

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Your Address',
                            border: OutlineInputBorder(), // apply border to text field
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter equivalent VFGA unit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _equivalentVFGAUnit = value!;
                          },
                        ),

                        SizedBox(height: 10),

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Your contact details',
                            border: OutlineInputBorder(), // apply border to text field
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter equivalent VFGA unit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _equivalentVFGAUnit = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavScreen()),
                    );
                  },
                  text: "SUBMIT",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}