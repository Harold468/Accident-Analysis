import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

void main()=>runApp(
    MaterialApp(home:HomeScreen(),
    debugShowCheckedModeBanner: false,));
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 void Launchgithub ()async {
     final Uri url = Uri.parse('https://github.com/Harold468');
     if (!await canLaunchUrl(url)) {
       Toast.show('Network Error', duration: 4);
     } else {
       await launchUrl(url);
     }
   }
 void LaunchLinkedin ()async {
   final Uri url = Uri.parse('https://www.linkedin.com/in/harold-kwabena-osei-frimpong-39a1aa201');
   if (!await canLaunchUrl(url)) {
     Toast.show('Network Error', duration: 4);
   } else {
     await launchUrl(url);
   }
 }
 void LaunchGmail ()async {
   final Uri url = Uri.parse('mailto:haroldosei24@gmail.com');
   if (!await canLaunchUrl(url)) {
     Toast.show('Network Error', duration: 4);
   } else {
     await launchUrl(url);
   }
 }
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Analysis'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('This simple software was developed '
            'with the aim of aiding in accident analysis.'
            ),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: InkWell(
                      splashColor: Colors.black12,
                      hoverColor: Colors.black12,
                      focusColor: Colors.black12,
                      highlightColor: Colors.black12,
                      onTap:(()=>{
                        Toast.show('Harold Osei Frimpong Kwabena'
                            'KNUST civil engineering class of 2022',duration: 4) }),
                      child: Ink.image(
                        image: AssetImage('assets/harold.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Follow me on',),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                          width: 60,
                            height: 60,
                            child: InkWell(
                              splashColor: Colors.black12,
                              hoverColor: Colors.black12,
                              focusColor: Colors.black12,
                              highlightColor: Colors.black12,
                              onTap:(Launchgithub),
                              child: Ink.image(
                                  image: AssetImage('assets/github.png',
                                  ),
                              ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: InkWell(
                            splashColor: Colors.black12,
                            hoverColor: Colors.black12,
                            focusColor: Colors.black12,
                            highlightColor: Colors.black12,
                            onTap:(LaunchLinkedin),
                            child: Ink.image(
                              image: AssetImage('assets/linkedin.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: InkWell(
                          splashColor: Colors.black12,
                          hoverColor: Colors.black12,
                          focusColor: Colors.black12,
                          highlightColor: Colors.black12,
                          onTap:(LaunchGmail),
                          child: Ink.image(
                            image: AssetImage('assets/gmail.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]
              ),
      ),
          );
  }
}
