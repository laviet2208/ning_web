import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/main_screens/CartScreen/MobileItem.dart';
import 'package:ning_web/main_screens/CartScreen/payment/Mobipayment.dart';
import 'package:ning_web/utils/utils.dart';

import '../Item/mobile/productItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class CartMobiScreen extends StatefulWidget {
  const CartMobiScreen({Key? key}) : super(key: key);

  @override
  State<CartMobiScreen> createState() => _CartMobiScreen();
}

class _CartMobiScreen extends State<CartMobiScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool loading = false;


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
                      height: 5,
                    ),

                    Container(
                        height: screenHeight,
                        child: GridView.builder(
                          itemCount: currentAccount.productCarts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 10, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 2/1, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                              child: InkWell(
                                child: MobiCartItemScreen(product: currentAccount.productCarts[index], width: screenWidth * 0.98, height: screenWidth * 0.49),
                              ),
                            );
                          },
                        )
                    ),

                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight/11,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 3,
                      top: 3,
                      child: LocaleText(
                        "totalmoney",
                        style: TextStyle(
                          fontSize: screenHeight*0.03,
                          fontFamily: 'Dmsan_regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),

                    Positioned(
                        left: 3,
                        top: screenWidth/10,
                        child: ValueListenableBuilder<double>(
                          valueListenable: infoPay.money,
                          builder: (BuildContext context, double value, Widget? child) {
                            return Text(
                              "\$ " + getStringNumber(value),
                              style: TextStyle(
                                fontSize: screenHeight*0.025,
                                fontFamily: 'Dmsan_regular',
                                fontWeight: FontWeight.normal,
                                color: Colors.redAccent,
                              ),
                            );
                          },
                        )
                    ),

                    Positioned(
                        left: screenWidth/3*2,
                        top: 0,
                        child: Container(
                            width: screenWidth/3,
                            height: screenHeight/11,
                            decoration: BoxDecoration(
                            ),
                            child:ButtonType1(Height: screenWidth/4, Width: screenWidth/3, color: Colors.redAccent, radiusBorder: 0, title: "Buy", fontText: 'arial', colorText: Colors.white,
                              onTap: () {
                                setState(() {
                                  loading = true;
                                });

                                if (cartProduct.isEmpty) {
                                  toastMessage("you must select product to continue");
                                } else {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreenMobi()),);
                                }
                              }, loading: loading,)
                        )
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
