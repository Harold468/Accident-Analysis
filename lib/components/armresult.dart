import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home:ARMRESULT(),debugShowCheckedModeBanner: false,));
class ARMRESULT extends StatefulWidget {
  const ARMRESULT({Key? key}) : super(key: key);

  @override
  State<ARMRESULT> createState() => _ARMRESULTState();
}

class _ARMRESULTState extends State<ARMRESULT> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    var A = 'No of accidents on the section '+ arguments['A'];
    var L = 'Length of roadway section in kilometers ' +arguments['L'];
    var V = 'AADT '+arguments['V'];
    var T = 'Period of study in years '+arguments['T'];
    var Rsp = "accidents per million vehicles for spots "
    "and intersections  "+ arguments['Rsp'].toString();
    var Rsect =" accidents per million vehicle-kilometres of "
    "travel for roadway sections "+ arguments['Rsect'].toString()  ;
    List values = [A,T,L,V];
    List answers = [Rsp,Rsect];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text('Accident Rate Method Result'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
                physics: ScrollPhysics(),
                itemCount: values.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return Card(
                elevation: 5,
                color:Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Center(
                    child: SizedBox(
                      height: 25,
                      child: Text(values[index],style: const TextStyle(color: Colors.white,
                          fontSize: 18)),
                    ),
                  ),
                ),
              );
            }),
            ListView.builder(
                physics: ScrollPhysics(),
                itemCount: answers.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    color:Colors.pinkAccent,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Center(
                        child: SizedBox(
                          height: 45,
                          child: Text(answers[index],
                              style: const TextStyle(color: Colors.white,
                              fontSize: 18)),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
