import 'package:flutter/material.dart';
import 'package:accidentanalysis/components/arm.dart';
import 'package:accidentanalysis/components/rqc.dart';
import 'package:accidentanalysis/components/armresult.dart';
import 'package:accidentanalysis/components/rqcresult.dart';
import 'package:accidentanalysis/components/ASM.dart';
import 'package:accidentanalysis/components/ASMResult.dart';
import 'components/home.dart';
void main(){runApp(MaterialApp(home:HomePage(),
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
  '/ARM':(context)=> ARM(),
    '/rqc':(context)=>RQC(),
    '/ASM':(context)=>ASM(),
    '/ARMRESULT':(context)=>ARMRESULT(),
  '/RQCRESULT':(context)=>RQCRESULT(),
    '/ASMResult':(context)=>ASMResult()
  },
));
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void changing(index){
    setState(() {
      _currentscreen = index;
    });
  }
  int _currentscreen=0;
  List screens = [
    HomeScreen(),
    ARM(),
    RQC(),
    ASM()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentscreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.orange,
          size: 40
        ),
        currentIndex: _currentscreen,
        onTap: changing,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled),
              label: 'ARM'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business_rounded),
              label: 'RQC'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more),
              label: 'ASM'
          ),
        ],
      ),
    );
  }
}
