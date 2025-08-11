import 'package:dynamic_delivery_latest/profile_screen.dart';
import 'package:flutter/material.dart';

class AmazonQCheckState extends StatefulWidget {
  const AmazonQCheckState({super.key});

  @override
  State<AmazonQCheckState> createState() => __AmazonQCheckStateState();
}

class __AmazonQCheckStateState extends State<AmazonQCheckState> {

 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // Navigator.pushReplacementNamed(context, AmazonQCheckState());
      MaterialPageRoute(builder: (context) => const AmazonQCheckState());
    });

    
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Amazon Q Check'),
      backgroundColor: Colors.blue,
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
        child: const Text('Navigate'),
      ),
    ),
  );
 
  }
}