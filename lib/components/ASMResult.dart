import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:ASMResult(),debugShowCheckedModeBanner: false,));
}
class ASMResult extends StatefulWidget {
  const ASMResult({Key? key}) : super(key: key);

  @override
  State<ASMResult> createState() => _ASMResultState();
}

class _ASMResultState extends State<ASMResult> {
  @override
  Widget build(BuildContext context) {
    Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments);
    //{F: 13, A: 0, B: 0, C: 0, PDO: 1, EPDO: 124.5}
    /*
    F=number of fatal accidents
A=number of incapacitating injury accidents
B=number of non-incapacitating injury accidents
C=number of probable/slight injury accidents
PDO=number of property-damage–only accidents
    * */
    var F = 'number of fatal accidents '+arguments['F'];
    var A = 'number of incapacitating injury accidents '+arguments['A'];
    var B = "number of non-incapacitating injury accidents "+arguments['B'];
    var C = 'number of probable/slight injury accidents '+arguments['C'];
    var PDO = 'number of property-damage–only accidents (PDO) '+arguments['PDO'];
    var EPDO = ' Equivalent property damage only (EPDO) '+(arguments['EPDO']).toString();
    List values = [F,A,B,C,PDO];
    List answers = [EPDO];
    return Scaffold(
      appBar: AppBar(
        title:Text('Accident Severity Method'),
        centerTitle:true,
        elevation:0,
        backgroundColor:Colors.orange
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
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
                          height: 45,
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
        ]
      )
    );
  }
}
