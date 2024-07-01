


import 'package:cubic_prueba/presentation/home/view/homepage.dart';
import 'package:flutter/material.dart';

import '../pagination/view/pagination_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Menu'),
      ),
      body: Center (
        child:  Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())
                );
              }, child: Text("MyHomePage")),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginationPage())
              );

            }, child: Text("Pagination")),

          ],


        ),

      ),
      
    );
  }
}
