import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:RQCRESULT(),debugShowCheckedModeBanner: false,));
}
class RQCRESULT extends StatefulWidget {
  const RQCRESULT({Key? key}) : super(key: key);

  @override
  State<RQCRESULT> createState() => _RQCRESULTState();
}

class _RQCRESULTState extends State<RQCRESULT> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    var Ra = 'average accident rate for all spots or sections of similar '
        'characteristics  ' +arguments['Ra'];
    var K = 'probability factor determined by the desired level of '
        'significance ' +arguments['K'];
    var Rc = 'critical accident rate for a '
        'spot (accident/million vehicles) '
        'or section'
        ' (accident/million vehicles-kilometres) ' +arguments['Rcmain'];
    List values = [Ra,K];
    List answers = [Rc];
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate of Quality Control Results'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: Column(
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
                        height: 65,
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
    );
  }
}
