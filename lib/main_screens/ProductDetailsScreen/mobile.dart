import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/main_screens/Item/productItem/EvaluateItem.dart';
import 'package:ning_web/main_screens/Item/productItem/ProductImageItem.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ning_web/main_screens/ShopScreen/Screen.dart';
import 'package:ning_web/utils/utils.dart';
import '../../Button/Buttontype1.dart';
import '../EvaLuateDetail/MobileScreen.dart';
import '../Item/productItem/EvaluateMobiItem.dart';
import '../ShopScreen/MobileScreen.dart';
import 'ItemImage.dart';
import 'mobileReview.dart';

class mobiDetailProduct extends StatefulWidget {
  final Product product;
  const mobiDetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<mobiDetailProduct> createState() => _mobiDetailProductState();
}

class _mobiDetailProductState extends State<mobiDetailProduct> {
  String _currentImageUrl = "";
  int indexImage = 0;
  @override
  void initState() {
    _currentImageUrl = widget.product.url[0];
  }

  void _onItemSelected(String imageUrl) {
    // update the state to show the new image
    setState(() {
      _currentImageUrl = imageUrl;
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int Length = widget.product.evaluateList.length;
    if (Length > 3) {
      Length = 3;
    }

    Future<void> pushData1(List<Product> productList) async {
      final reference = FirebaseDatabase.instance.reference();
      for (int i = 0 ; i < productList.length ; i++) {
        await reference.child("Account/" + currentAccount.id + "/productCarts/" + i.toString()).set(productList[i].toJson());
      }
      setState(() {

      });
    }

    Future<void> pushData2(List<Product> productList) async {
      final reference = FirebaseDatabase.instance.reference();
      for (int i = 0 ; i < productList.length ; i++) {
        await reference.child("Account/" + currentAccount.id + "/wishList/" + i.toString()).set(productList[i].toJson());
      }
      setState(() {

      });
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_1.png',
              width: screenWidth/7.84,
              height: screenWidth/7.84,
            ),

            SizedBox(width: 10),

            Text(
              'N-iNG',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(width: 5),

            Text(
              'PRODUCT',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration (
              color: Colors.white,
            ),

            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0.02 * screenWidth,
                  child: Container(
                    width: screenWidth * 0.96,
                    height: 0.91 * screenHeight,
                    child: ListView(
                      children: [
                        Container(
                          height: 10,
                        ),

                        //Ảnh to
                        Container(
                          height: screenWidth * 0.96,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 250),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // màu của shadow
                                spreadRadius: 5, // bán kính của shadow
                                blurRadius: 10, // độ mờ của shadow
                                offset: Offset(0, 3), // vị trí của shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  height: screenWidth * 0.96,
                                  width: screenWidth * 0.96,
                                  child: Image.network(
                                    _currentImageUrl,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: screenWidth * 0.96 / 2,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    if (indexImage < widget.product.url.length - 1) {
                                      indexImage = indexImage + 1;
                                      _onItemSelected(widget.product.url[indexImage]);
                                    } else if (indexImage == widget.product.url.length - 1) {
                                      indexImage = 0;
                                      _onItemSelected(widget.product.url[indexImage]);
                                    }
                                  },
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(3.141592653589793),
                                    child: Container(
                                      height: screenWidth * 0.96 / 10,
                                      width: screenWidth * 0.96 / 10,
                                      child: Image.network(
                                        "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fangle_small_left.png?alt=media&token=cb9a31d9-cf72-4306-ad95-c73bf375a947",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: screenWidth * 0.96 / 2,
                                left: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    if (indexImage > 0) {
                                      indexImage = indexImage - 1;
                                      _onItemSelected(widget.product.url[indexImage]);
                                    } else if (indexImage == 0) {
                                      indexImage = widget.product.url.length - 1;
                                      _onItemSelected(widget.product.url[indexImage]);
                                    }
                                  },
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(0),
                                    child: Container(
                                      height: screenWidth * 0.96 / 10,
                                      width: screenWidth * 0.96 / 10,
                                      child: Image.network(
                                        "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fangle_small_left.png?alt=media&token=cb9a31d9-cf72-4306-ad95-c73bf375a947",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ),

                        Container(
                          height: 25,
                        ),

                        Container(
                          height: 33,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            compactString(27, widget.product.name),
                            style: TextStyle(
                                fontFamily: 'Arial',
                                color: Color(0xff000000),
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          height: 12,
                        ),
                        
                        Container(
                          height: 20,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "\$. " + getStringNumber(widget.product.cost),
                            style: TextStyle(
                                fontFamily: 'Dmsan_regular',
                                color: Color.fromARGB(255, 254, 58, 48),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          height: 15,
                        ),

                        Container(
                          height: 20,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Stack(
                              children: <Widget>[

                              ],
                            ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 211, 211, 211)
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        //Phần shop
                        Container(
                          height: 50,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => MobiShopScreen(shop: widget.product.shop)));
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50/2),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget.product.shop.url),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black
                                        )
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 10,
                                left: 60,
                                child: Container(
                                  width: 0.96 * screenWidth - 85,
                                  height: 36,
                                  child: Text(
                                    widget.product.shop.name,
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 30,
                                left: 60,
                                child: Container(
                                  width: 0.96 * screenWidth - 85,
                                  height: 36,
                                  child: Text(
                                    "Official Store",
                                    style: TextStyle(
                                        fontFamily: 'Dmsan_regular',
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: (50 - screenWidth * 0.96 / 10)/2,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => MobiShopScreen(shop: widget.product.shop)));
                                  },
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(3.141592653589793),
                                    child: Container(
                                      height: screenWidth * 0.96 / 10,
                                      width: screenWidth * 0.96 / 10,
                                      child: Image.network(
                                        "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fangle_small_left.png?alt=media&token=cb9a31d9-cf72-4306-ad95-c73bf375a947",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(height: 20,),

                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211)
                            ),
                          ),
                        ),

                        Container(
                          height: 20,
                        ),

                        Container(
                          height: 20,
                          alignment: Alignment.centerLeft,
                          child: LocaleText(
                            "description",
                            style: TextStyle(
                                fontFamily: 'arial',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          height: 15,
                        ),

                        Container(
                          decoration: BoxDecoration (
                            color: Colors.white,
                          ),
                          child: AutoSizeText(
                            widget.product.content,
                            style: TextStyle(
                                fontFamily: 'Dmsan_regular',
                                color: Color.fromARGB(255, 12, 26, 48),
                                fontSize: screenWidth/25,
                                fontWeight: FontWeight.normal
                            ),
                            maxLines: 20, // giới hạn số dòng của text
                            overflow: TextOverflow.ellipsis, // xử lý khi text bị tràn
                          ),
                        ),

                        Container(
                          height: 40,
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211)
                            ),
                          ),
                        ),

                        Container(
                          height: 40,
                        ),

                        Container(
                          height: 140,
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(

        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 10,
              child: ButtonType1(Height: 70, Width: screenWidth/2 - 15, color: Color.fromRGBO(54, 105, 201, 1.0), radiusBorder: 15, title: "Add to cart", fontText: 'arial', colorText: Colors.white,
                  onTap: () async {
                    if (currentAccount.productCarts.isNotEmpty) {
                      bool check = true;
                      for (int i = 0 ; i < currentAccount.productCarts.length ; i++) {
                        if (currentAccount.productCarts[i].id == widget.product.id) {
                          check = false;
                          break;
                        }
                      }
                      if (!check) {
                        toastMessage("Your cart have this product");
                      } else {
                        currentAccount.productCarts.add(widget.product);
                        await pushData1(currentAccount.productCarts);
                        toastMessage("Add success");
                      }
                    } else {
                      currentAccount.productCarts.add(widget.product);
                      await pushData1(currentAccount.productCarts);
                      toastMessage("Add success");
                    }
                  }),
            ),

            Positioned(
              top: 0,
              right: 10,
              child: ButtonType1(Height: 70, Width: screenWidth/2 - 15, color: Colors.deepOrange, radiusBorder: 15,  title: "Add to wishlist", fontText: 'Dmsan_regular', colorText: Colors.white,
                  onTap: () async {
                    if (currentAccount.wishList.isNotEmpty) {
                      bool check = true;
                      for (int i = 0 ; i < currentAccount.wishList.length ; i++) {
                        if (currentAccount.wishList[i].id == widget.product.id) {
                          check = false;
                          break;
                        }
                      }
                      if (!check) {
                        toastMessage("Your wishlist was have this product");
                      } else {
                        currentAccount.wishList.add(widget.product);
                        await pushData2(currentAccount.productCarts);
                        toastMessage("Add success");
                      }
                    } else {
                      currentAccount.wishList.add(widget.product);
                      await pushData2(currentAccount.productCarts);
                      toastMessage("Add success");
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
