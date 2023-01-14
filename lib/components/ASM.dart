import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main()=>runApp(MaterialApp(home:ASM(),debugShowCheckedModeBanner: false,));
class ASM extends StatefulWidget {
  const ASM({Key? key}) : super(key: key);

  @override
  State<ASM> createState() => _ASMState();
}

class _ASMState extends State<ASM> {
  @override
  TextEditingController F = TextEditingController();
  TextEditingController A = TextEditingController();
  TextEditingController B = TextEditingController();
  TextEditingController C = TextEditingController();
  TextEditingController PDO = TextEditingController();
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Severity Method'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text('Accident rates may be evaluated in terms of the '
                  'accident numbers associated with each accident severity type. '
                  'Or all accident severity types may be converted to the equivalent'
                  ' property damage only (EPDO) factor ',
              style: TextStyle(fontSize: 16),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: F,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('number of fatal accidents'),
                    filled: true,
                    fillColor: Colors.blueGrey,
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
                    label: Text('number of incapacitating injury accidents'),
                    filled: true,
                    fillColor: Colors.blueGrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: B,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('number of non-incapacitating injury accidents'),
                    filled: true,
                    fillColor: Colors.blueGrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: C,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('number of probable/slight injury accidents'),
                    filled: true,
                    fillColor: Colors.blueGrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: PDO,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,

                  ),
                  decoration: InputDecoration(
                    label: Text('number of property-damage–only accidents'),
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
                  double.tryParse(F.text) !=null &&
                  double.tryParse(A.text)!=null &&
                  double.tryParse(B.text) !=null &&
                  double.tryParse(C.text) !=null &&
                  double.tryParse(PDO.text)!=null
                  ) {
                    try {
                      double EPDO = (9.5 * (
                          double.parse(F.text) + double.parse(A.text)
                      ) + 3.5 * (double.parse(B.text) + double.parse(C.text)) +
                          double.parse(PDO.text)
                      );
                      print(EPDO);
                      Navigator.pushNamed(context, '/ASMResult',arguments: {
                        'F':F.text,
                        'A':A.text,
                        'B':B.text,
                        'C':C.text,
                        'PDO':PDO.text,
                        'EPDO':EPDO
                      });
                    }
                    catch(e){
                      Toast.show("All entries must be numeric",duration: 4,
                          gravity:Toast.center );
                    }
                  }else{
                    Toast.show("All entries must be numeric",duration: 4,
                        gravity:Toast.center );
                  }
                }),
                child: Text('Calculate'),
    )
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
