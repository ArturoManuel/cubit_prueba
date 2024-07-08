


import 'package:cubic_prueba/presentation/home/view/homepage.dart';
import 'package:cubic_prueba/presentation/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dropdown/dropdown.dart';
import '../dropdown/provider.dart';
import '../pagination/view/pagination_page.dart';
import '../provider/providerinfo.dart';

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
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider<TextProvider>(
                    create: (_) => TextProvider(),
                  ),
                ],
                child: const ProvidePage(),)
              ));

            }, child: Text("Provider")),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      MultiProvider(
                          providers: [ChangeNotifierProvider<DropdownProvider>(create: (_) => DropdownProvider())],
                          child: const DropdownMenuExample()))
              );

            }, child: Text("DropDowns")),


          ],


        ),

      ),

    );
  }
}
