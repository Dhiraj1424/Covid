import 'package:covid_app/screen/country_list.dart';
import 'package:covid_app/services/state_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/service_model.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> with TickerProviderStateMixin {

 late final AnimationController _controller=AnimationController(
  duration:const Duration(seconds: 10),
  vsync: this)..repeat();
   final colorList =<Color> [
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateService _stateService=StateService();
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            FutureBuilder(
              future: _stateService.fetchWordStatus(),
              builder: ((context,AsyncSnapshot<ServiceModel> snapshot) {
              if(!snapshot.hasData){
return Expanded(child: SpinKitFadingCircle(color: Colors.white,
size: 50,
controller: _controller,
));
              }
              else{
                return Column(
children: [
      PieChart(dataMap: {
        'Total':double.parse(snapshot.data!.cases.toString()),
        'Recovered':double.parse(snapshot.data!.recovered.toString()),
        'Death':double.parse(snapshot.data!.deaths.toString())
      
      },
      chartValuesOptions: ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      animationDuration: Duration(milliseconds: 12000),
      chartType: ChartType.disc,
      chartRadius: MediaQuery.of(context).size.width*3/2,
      colorList: colorList,
      legendOptions: LegendOptions(
        legendPosition: LegendPosition.left
      ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *0.06
        ),
        child: Card(
          child: Column(
            children: [
          ReusableRow(text: 'Total', value: snapshot.data!.cases.toString()),
           ReusableRow(text: 'Death', value: snapshot.data!.deaths.toString()),
ReusableRow(text: 'Recoverd', value: snapshot.data!.recovered.toString()),
           ReusableRow(text: 'Active', value: snapshot.data!.active.toString()),
                      ReusableRow(text: 'Critical', value: snapshot.data!.critical.toString()),


            ],
          ),

        ),

      ),
      GestureDetector(
        onTap: (() {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>CountriesList()));
        }),
        child: Container(
          height: 50,
          width: double.infinity,
          child: Center(child: Text('Tracked Country')),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green
          ),
        ),
      )
     
],
                );
              }
            })),
 
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String text,value;
  const ReusableRow({Key? key, required this.text,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 10, bottom: 5),
      
      child: Column(
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(text),
    Text(value)
      ],
    )
    ],
      ),
    );
  }
}