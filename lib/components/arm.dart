import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main()=>runApp(MaterialApp(home:ARM(),
  debugShowCheckedModeBanner: false,));
class ARM extends StatefulWidget {
  const ARM({Key? key}) : super(key: key);

  @override
  State<ARM> createState() => _ARMState();
}

class _ARMState extends State<ARM> {
  @override
  TextEditingController L = TextEditingController();
  TextEditingController V = TextEditingController();
  TextEditingController T = TextEditingController();
  TextEditingController A = TextEditingController();
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Accident Rate Method'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text('Accident Rate Method combines accident frequency and '
                   ' exposure and may be expressed as accidents per million vehicles'
          '  (Rsp) for spots and intersections or as “accidents per million'
              'vehicle-kilometres of travel (Rsect) for roadway sections.'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: L,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('Length of roadway section in kilometers'),
                  filled: true,
                  fillColor: Colors.blueGrey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: A,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                      label: Text('No of accidents recorded on the section '),
                      filled: true,
                      fillColor: Colors.blueGrey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: T,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                      label: Text('Period of study in years'),
                      filled: true,
                      fillColor: Colors.blueGrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: V,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('AADT'),
                    filled: true,
                    fillColor: Colors.blueGrey,
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
                        double.tryParse(A.text)!=null &&
                        double.tryParse(L.text)!=null &&
                        double.tryParse(V.text)!=null &&
                        double.tryParse(T.text)!=null
                        ) {

                          try{

                          double Rsp = (double.parse(A.text) * pow(10, 6)) /
                              (365 * double.parse(T.text) *
                                  double.parse(V.text));
                          double Rsect = (double.parse(A.text) * pow(10, 6)) /
                              (365 * double.parse(L.text) *
                                  double.parse(T.text) * double.parse(V.text));
                          String Rsectmain = Rsect.toString().substring(0,8);
                          String Rspmain = Rsp.toString().substring(0, 8);
                          if(Rsectmain =='Infinity'){
                            Rsectmain='0';
                          }
                          if(Rspmain =='Infinity' ){
                            Rspmain ='0';
                          }
                          Navigator.pushNamed(context, '/ARMRESULT',arguments: {
                            'A':A.text,
                            'L':L.text,
                            'V':V.text,
                            'T':T.text,
                            'Rsp':Rspmain,
                            'Rsect':Rsectmain,
                          });
                          }
                        catch(e){
                          Toast.show("No of accidents must be greater than 0",duration: 4,
                              gravity:Toast.center );
                        }
                        }else{
                          Toast.show("All fields must be numeric",duration: 4,
                              gravity:Toast.center );
                        }
                      }),
                      child: Text('Calculate'),
                    ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
