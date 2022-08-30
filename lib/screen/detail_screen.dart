import 'package:covid_app/screen/countery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  // String image;
  String name;
  // int totalCae,
  int totalDeath,totalRecovered, active;
   DetailScreen({
    Key? key,
    // required this.image,
     required this.name,
   //required this.totalCae,
    required this.totalDeath,
     required this.totalRecovered,
    required this.active,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(widget.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          
      children: [
        
      
      ReusableRow(text: 'total Recoverd', value: widget.totalRecovered.toString()),
      ReusableRow(text: 'total death', value: widget.totalDeath.toString()),
      ReusableRow(text: 'total death', value: widget.totalDeath.toString())
      ],
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  String name, value;
   MyList({Key? key,required this.name,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}