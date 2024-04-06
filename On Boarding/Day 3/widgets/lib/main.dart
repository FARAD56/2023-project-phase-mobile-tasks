import 'package:flutter/material.dart';

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
          title: const Text('My App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

        ),


        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          const SizedBox(width: double.infinity,),

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
            padding: const EdgeInsets.all(48.0),
            child: Row(     
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                InkWell(
                  onTap :(){
                    setState(() {count.incrementCount();});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: 
                      const Text('+',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),)
                  ),
                ),
            
                InkWell(
                  onTap: () {
                    setState(() {count.decrementCount();});
                  } ,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: 
                      const Text('-',
                        style: TextStyle(
                          fontSize: 30.0,
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



