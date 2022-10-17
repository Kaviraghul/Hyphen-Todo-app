import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lottie/lottie.dart';

class Tasks extends StatefulWidget {
  const Tasks({ Key? key }) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(
            color: Colors.black,
            width: MediaQuery. of(context). size. width,
             child :Lottie.network(
                 'https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json', height: 300 ),
          ),
          Container(
            height:0.2,
            color: const Color(0xFF18c8c1),
          ),
          // ListView(  
          // children: const <ListTile>[  
          //   ListTile(  
          //     leading: Icon(Icons.map),  
          //     title: Text('Map'),  
          //   ),
          //   ListTile(  
          //     leading: Icon(Icons.map),  
          //     title: Text('Map'),  
          //   ),
          //   ListTile(  
          //     leading: Icon(Icons.map),  
          //     title: Text('Map'),  
          //   ),
          //   ListTile(  
          //     leading: Icon(Icons.map),  
          //     title: Text('Map'),  
          //   ),
          //   ListTile(  
          //     leading: Icon(Icons.map),  
          //     title: Text('Map'),  
          //   ), ]),
            
        ]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        onTap: (value) => {
          showModalBottomSheet(context: context,isScrollControlled: true, builder:(BuildContext context) {
              return Padding(
                 padding: MediaQuery.of(context).viewInsets,
                child: Scaffold(
                  
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text('Add new task', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            SizedBox(height: 20),
                            TextField(
                               autofocus: true,
                                style:TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFff7b7b),
                fixedSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))
                            ),
                            child: const Text('Add task'),
                            onPressed: () => Navigator.pop(context),
                          ),
                ),
              );
            },)
        },
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.pen),
            label: 'New task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
      ]),
    );
  }
}