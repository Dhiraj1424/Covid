import 'package:covid_app/screen/detail_screen.dart';
import 'package:covid_app/services/state_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

 TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateService stateService=StateService();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  
                });
              },
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Country',
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),


          ),
          Expanded(
            child: FutureBuilder(
              future: stateService.fetchCountrieesList(),
              builder: (context,AsyncSnapshot<List<dynamic>>
          snapshot) {
           if (!snapshot.hasData){
            return CircularProgressIndicator();
           }
           else{
             return ListView.builder(
              
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index)
              
               {
                String name=snapshot.data![index]['country'];
                if(_controller.text.isEmpty){
                   return  Column(
              children: [
InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailScreen(
      name: snapshot.data![index]['country'],
      // image: snapshot.data![index]['countryInfo']['flag'],
      // totalCae: snapshot.data![index]['cases'],
      totalDeath: snapshot.data![index]['deaths'],
      totalRecovered: snapshot.data![index]['recovered'],
       active: snapshot.data![index]['active'],


    )));
  },
  child:   ListTile(
  
    title: Text(
  
      snapshot.data![index]['country']
  
    ),
  
    subtitle: Text(
  
      snapshot.data![index]['cases'].toString()
  
    ),
  
    leading: Image(
  
      height: 50,
  
      width: 50,
  
      image: NetworkImage(
  
      snapshot.data![index]['countryInfo']['flag'],
  
    )),
  
  ),
)
              ],);
                }
    else if(name.toLowerCase().contains(_controller.text.toLowerCase())){
                   return  Column(
              children: [
ListTile(
  title: Text(
    snapshot.data![index]['country'].toString()
  ),
  subtitle: Text(
    snapshot.data![index]['cases'].toString()
  ),
  leading: Image(
    height: 50,
    width: 50,
    image: NetworkImage(
    snapshot.data![index]['countryInfo']['flag'],
  )),
)
              ],);
                }
                else{
                  return Container();
                }
              
             })
            );
           }
          },))
        ],
      ),
    );
  }
}