import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police_feedback/customButton.dart';
import 'package:police_feedback/fir.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(// Assuming your custom clipper for the shape
          child: Stack( // Use a Stack to position elements on top of each other
            children: [
              SizedBox(height: 10,),
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
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0,),
                    child:  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Police Feedback System',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            const SizedBox(height: 30,),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/asset3.png'),
                  fit: BoxFit.cover, // Specify the fit as per your requirement
                ),
              ),
              height: 200,
              width: 400,
            ),
            const SizedBox(height: 40),
            _buildTwelve(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTwelve(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5, color: Color(0xFFDFF5FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Text('File your FIR here',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold

            ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  text: "Apply",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => fir()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
