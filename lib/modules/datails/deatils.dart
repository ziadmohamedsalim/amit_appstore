

import 'package:final_project/bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_event.dart';
import 'package:final_project/models/products.dart';
import 'package:final_project/modules/bottombar/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  Product selectedItem;
  ProductDetails({required this.selectedItem});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void initState() {
    widget.selectedItem.amount =1;
    // TODO: implement initState
    super.initState();
  }

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
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${widget.selectedItem.avatar}',
                    height: size.height * 0.4,
                    width: size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedItem.title.toString(),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedItem.name.toString(),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.selectedItem.price.toString() + "EGP",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.red),
                      ),
                      Container(
                        color: Colors.red,
                        child: InkWell(
                            onTap: ()
                            {
                              setState(() {
                                widget.selectedItem.amount = widget.selectedItem.amount! +1;
                              });
                            },
                            child: Icon(Icons.add,color: Colors.white,)),
                      ),
                      Text(
                        "${widget.selectedItem.amount}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        color: Colors.red,
                        child: InkWell(
                            onTap: ()
                            {
                              if(widget.selectedItem.amount! > 1)
                              {
                                setState(() {
                                  widget.selectedItem.amount = widget.selectedItem.amount! -1;
                                });
                              }
                            },child: Icon(Icons.remove,color: Colors.white,)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                 Divider(
                   color: Colors.black,
                   height: 1,
                   thickness: 2.0,
                 ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.selectedItem.description.toString(),
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      CartBloc cartBloc = BlocProvider.of(context);
                      cartBloc.add(AddProductEvent(newProduct: widget.selectedItem));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          "add to card",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }


}