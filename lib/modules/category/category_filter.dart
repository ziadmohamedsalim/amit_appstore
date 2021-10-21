import 'package:final_project/bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_event.dart';
import 'package:final_project/logic/api.dart';
import 'package:final_project/models/products.dart';
import 'package:final_project/modules/bottombar/bottom_nav_bar.dart';
import 'package:final_project/modules/datails/deatils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_screen.dart';

class CategoriesProduct extends StatefulWidget {
  int? categoriesId;
  String? categoryName;
  CategoriesProduct({this.categoriesId, this.categoryName});
  @override
  _HomaState createState() => _HomaState();
}

class _HomaState extends State<CategoriesProduct> {
  final GlobalKey<ScaffoldState> keys = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bottomNav(),
                  ));
            },
          ),
        ),
        backgroundColor: Colors.grey,
        key: keys,
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.grey,
          child: FutureBuilder<ProductsVm>(
            future: Api.getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Product> Lists = snapshot.data!.products!
                    .where(
                        (element) => element.categoryId == widget.categoriesId)
                    .toList();
                return GridView.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: List.generate(
                    Lists.length,
                    (index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              selectedItem: Lists[index])));
                                },
                                child: Image(
                                  image: NetworkImage('${Lists[index].avatar}'),
                                  fit: BoxFit.cover,
                                  width: size.width * 0.5,
                                  height: size.height,
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    '${Lists[index].title}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${Lists[index].name}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      child: InkWell(
                                          onTap: () {
                                            CartBloc cartBloc =
                                                BlocProvider.of(context);
                                            cartBloc.add(AddProductEvent(
                                                newProduct: Lists[index]));
                                          },
                                          child: Icon(Icons.add,color: Colors.white,)),
                                    ),
                                    Text(
                                      '${Lists[index].price} EGP',
                                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
