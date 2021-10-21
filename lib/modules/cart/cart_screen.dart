import 'package:final_project/bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_event.dart';
import 'package:final_project/bloc/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: state.shoppingCart.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //image only
                                Expanded(
                                  child: Image(
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${state.shoppingCart[index].avatar}')),
                                  flex: 3,
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              state.shoppingCart[index].title
                                                  .toString(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            flex: 5,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                CartBloc cartBloc =
                                                    BlocProvider.of(context);
                                                cartBloc.add(DeleteProductEvent(
                                                    newProduct: state
                                                        .shoppingCart[index]));
                                              },
                                              child: Icon(
                                                Icons.clear_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          state.shoppingCart[index].name
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            state.shoppingCart[index].price
                                                    .toString() +
                                                "EGP",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            color: Colors.red,
                                            child: InkWell(
                                              onTap: () {
                                                CartBloc cartBloc =
                                                BlocProvider.of(context);
                                                cartBloc.add(
                                                    DecrementProductCountEvent(
                                                        productIndex: index));
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.shoppingCart[index].amount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                          Container(
                                            color: Colors.red,
                                            child: InkWell(
                                              onTap: () {
                                                CartBloc cartBloc =
                                                    BlocProvider.of(context);
                                                cartBloc.add(
                                                    IncrementProductCountEvent(
                                                        productIndex: index));
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  flex: 7,
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
                ),
                flex: 7,
              ),
              Container(
                height: size.height*0.08,
                width: size.width*0.75,
                child: MaterialButton(
                  onPressed: () {
                    CartBloc cartBloc = BlocProvider.of(context);
                    cartBloc.add(ClearCartEvent());
                    setState(() {});
                  },
                  child: Text(
                    'Clear cart',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        } else {
          return Center(
            child: Text(
              "NO Item Selected",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
      }),
    );
  }
}
