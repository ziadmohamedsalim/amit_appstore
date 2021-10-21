import 'package:final_project/bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_event.dart';
import 'package:final_project/logic/api.dart';
import 'package:final_project/models/products.dart';
import 'package:final_project/modules/cart/cart_screen.dart';

import 'package:final_project/modules/datails/deatils.dart';

import 'package:final_project/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<ProductsVm>(
              future: Api.getProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children:
                        List.generate(snapshot.data!.products!.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            selectedItem:
                                                snapshot.data!.products![index],
                                          ),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: NetworkImage(
                                          '${snapshot.data!.products![index].avatar}'),
                                      fit: BoxFit.cover,
                                      width: size.width * 0.5,
                                      height: size.height,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "${snapshot.data!.products![index].name}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      "${snapshot.data!.products![index].title}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              CartBloc cartbloc =
                                                  BlocProvider.of(context);
                                              cartbloc.add(AddProductEvent(
                                                  newProduct: snapshot
                                                      .data!.products![index]));
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          "${snapshot.data!.products![index].priceFinal} EGP ",
                                          style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
