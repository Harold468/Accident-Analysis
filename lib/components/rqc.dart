import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main()=>runApp(MaterialApp(home: RQC(),
debugShowCheckedModeBanner: false,));
class RQC extends StatefulWidget {
  const RQC({Key? key}) : super(key: key);

  @override
  State<RQC> createState() => _RQCState();
}
/*
Rc=critical accident rate for a spot (accident/million vehicles) or
section (accident/million vehicles-kilometres)
11
Ra=average accident rate for all spots or sections of similar
characteristics
M=millions of vehicles passing over a spot or millions of vehiclekilometres of travel over a section
K=probability factor determined by the desired level of significance.

* */
class _RQCState extends State<RQC> {
  @override
  TextEditingController Ra = TextEditingController();
  TextEditingController K = TextEditingController();
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Quality Control'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text('This uses statistical test to determine whether'
      ' the accident rate at a particular location is significantly'
      ' higher than a predetermined average rate for locations of '
      'similar characteristics based on Poisson’s distribution. ',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: Ra,
              style: TextStyle(
                color:Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  label: Text('average accident rate for all spots or sections of similar characteristics '),
                  filled: true,
                  fillColor: Colors.blueGrey
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: K,
              style: TextStyle(
                color:Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  label: Text('Probability Factor'),
                  filled: true,
                  fillColor: Colors.blueGrey
              ),
            ),
          ),

          Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
          child: SizedBox(
          width: 400,
          height:50,
          child: ElevatedButton(
          onPressed: ((){
            if(
            double.tryParse(Ra.text)!=null &&
            double.tryParse(K.text)!=null
            ) {
              try {
                double Rc = double.parse(Ra.text) +
                    (double.parse(K.text) *
                        (
                            sqrt(
                                (
                                    double.parse(Ra.text) / (pow(10, 6))
                                )
                            )
                        )
                    );
                String Rcmain = Rc.toString().substring(0, 8);
                print(Rcmain);
                Navigator.pushNamed(context, '/RQCRESULT',arguments: {
                  'Ra':Ra.text,
                  'K':K.text,
                  'Rcmain':Rcmain
                });
              }
              catch(e){
                Toast.show('Entries must be numeric',duration: 4,
                    gravity:Toast.center );
              }
            }else{
              Toast.show('Entries must be numeric',duration: 4,
                  gravity:Toast.center );
            }
          }),
          child: Text('Calculate'),
          )
          )
          )
        ],
      ),
    );
  }
}
