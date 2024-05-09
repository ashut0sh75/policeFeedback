import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police_feedback/TimeLineTileUI.dart';
import 'package:police_feedback/customButton.dart';
import 'package:police_feedback/homef.dart';

class StatusFrom extends StatefulWidget {
  const StatusFrom({Key? key}) : super(key: key);

  @override
  State<StatusFrom> createState() => _StatusFromState();
}

class _StatusFromState extends State<StatusFrom> {
  bool isContainer1Visible = false;
  bool isContainer2Visible = false;
  bool isContainer3Visible = false;
  bool isContainer4Visible = false;
  bool isContainer5Visible = false;
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath( // Assuming your custom clipper for the shape
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8),
                child: Container(
                  padding:EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0,),
                  child:  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check Application Status',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children:[
              SizedBox(height: 20,),
              Container(
                height: 550,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 5, color: Colors.white)
                ),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 20),
                child: ListView(
                  children: [
        
                    _buildTimelineTile(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      text: 'FIR Submitted',
                      description: 'You have successfully submitted the application form for listing of your crop production as VFGA unit.',
                      isVisible: isContainer1Visible,
                      onTap: () {
                        setState(() {
                          isContainer1Visible = !isContainer1Visible;
                        });
                      },
                    ),
                    _buildTimelineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      text: 'Assigned to Inspector',
                      description: 'Your application is approved by member of pool of farmers.    View remarks on your application.',
                      isVisible: isContainer2Visible,
                      onTap: () {
                        setState(() {
                          isContainer2Visible = !isContainer2Visible;
                        });
                      },
                    ),
                    _buildTimelineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      text: 'Sight covered',
                      description: 'Your application is under review of Gram Panchayat',
                      isVisible: isContainer3Visible,
                      onTap: () {
                        setState(() {
                          isContainer3Visible = !isContainer3Visible;
                        });
                      },
                    ),
                    _buildTimelineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      text: 'Proofs gathered',
                      description: 'Your application is under review of govt. office.',
                      isVisible: isContainer4Visible,
                      onTap: () {
                        setState(() {
                          isContainer4Visible = !isContainer4Visible;
                        });
                      },
                    ),
                    _buildTimelineTile(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      text: 'Case Closed',
                      description: 'Application Approved!',
                      isVisible: isContainer5Visible,
                      onTap: () {
                        setState(() {
                          isContainer5Visible = !isContainer5Visible;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    );
                  },
                  text: "Give your feedback",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required bool isPast,
    required String text,
    required String description,
    required bool isVisible,
    required VoidCallback onTap,
  }) {
    return GestureDetector(

      onTap: onTap,
      child: Column(
        children: [
          TimeLineTileUI(
            isFirst: isFirst,
            isLast: isLast,
            isPast: isPast,
            eventChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15.0),
                    Flexible(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isVisible) // Only show container if visibility is true
            Container(
              margin: EdgeInsets.only(left: 60,bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Color(0xFFA3A3A3)),
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFE9ECE9),
              ),
              width: 230,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('You have successfully submitted the application form for listing of your crop production as VFGA unit.',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    },
                    text: "View Application",
                  ),

                ],
              ),
            ),
        ],
      ),
    );
  }
}