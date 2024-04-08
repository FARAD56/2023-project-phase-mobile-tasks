import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class CountApp {
  int _count = 0;

  int getCount(){
    return _count%11;
  }

  void incrementCount(){
    _count++;
  }

  void decrementCount(){
    _count --;
  }

}
   

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  CountApp count = CountApp();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Circular Counter App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

        ),


        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
          // TextButton(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.blue,
          //     backgroundColor: MaterialColor(primary, swatch)
          //   ),
          //   onPressed: () {setState(() {count.incrementCount();}); },
          //   child: const Text('TextButton'),
          // ),

          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(10.0),
              color: Colors.blue,   
            ),
            child: 
              Text('Count : ${count.getCount()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
          ),
                
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(     
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                InkWell(
                  onTap :(){
                    setState(() {count.incrementCount();});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: 
                      const Text('Increment',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),)
                  ),
                ),
            
                InkWell(
                  onTap: () {
                    setState(() {count.decrementCount();});
                  } ,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: 
                      const Text('Decrement',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                  ),
                )
              ]
                
            ),
          )
        ]

                )
      ),
    
    );
  }
}



