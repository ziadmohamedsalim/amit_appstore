import 'package:final_project/logic/api.dart';
import 'package:final_project/models/categories.dart';
import 'package:final_project/modules/cart/cart_screen.dart';
import 'package:final_project/modules/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_filter.dart';

// ignore: camel_case_types
class categories extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<categories> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<CategoriesVm>(
        future: Api.getCategories(),
        builder: (context , snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return  Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: List.generate(snapshot.data!.categories!.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesProduct(
                                  categoriesId: snapshot
                                      .data!.categories![index].id,
                                  categoryName: snapshot
                                      .data!.categories![index].name,
                                )));
                      },
                      child: Stack(

                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: NetworkImage(
                                '${snapshot.data!.categories![index].avatar}'),
                            fit: BoxFit.cover,
                            width: size.width*0.5,
                            height: size.height*0.5,
                          ),
                          Center(
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              height: size.height * 0.05,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  '${snapshot.data!.categories![index].name}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                ),
              ),
            );
          }
          else return Center(child: CircularProgressIndicator(),);
        },
      )


    );
  }


}
