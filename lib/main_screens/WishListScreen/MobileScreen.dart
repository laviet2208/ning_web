import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';

import '../Item/mobile/productItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class WishlistMobiScreen extends StatefulWidget {
  const WishlistMobiScreen({Key? key}) : super(key: key);

  @override
  State<WishlistMobiScreen> createState() => _WishlistMobiScreen();
}

class _WishlistMobiScreen extends State<WishlistMobiScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.9;


    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0 * screenHeight,
              left: 0.01 * screenWidth,
              child: Container(
                width: screenWidth * 0.98,
                height: 0.91 * screenHeight,
                child: ListView(
                  children: [
                    Container(
                      height: 10,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                          height: screenHeight,
                          child: GridView.builder(
                            itemCount: currentAccount.wishList.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // số phần tử trên mỗi hàng
                              mainAxisSpacing: 0, // khoảng cách giữa các hàng
                              crossAxisSpacing: 0, // khoảng cách giữa các cột
                              childAspectRatio: 0.7, // tỷ lệ chiều rộng và chiều cao
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: currentAccount.wishList[index])));
                                  },
                                  child: ProductItemMobiWidget(product: currentAccount.wishList[index]),
                                ),
                              );
                            },
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
