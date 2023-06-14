import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/main_screens/ProductDetailsScreen/productDetailScreen.dart';
import 'package:ning_web/main_screens/viewallproduct/viewallproduct.dart';
import '../Item/mobile/productItem.dart';

class mainmenuTab extends StatefulWidget {
  const mainmenuTab({Key? key}) : super(key: key);

  @override
  State<mainmenuTab> createState() => _mainmenuTabState();
}

class _mainmenuTabState extends State<mainmenuTab> {
  List<Product> dataFearture = [];
  List<Product> dataFlashSale = [];
  List<Product> dataFiveStar = [];
  final databaseReference = FirebaseDatabase.instance.reference();
  int selectedIndex = 0;// Giá trị mặc định là 0

  int ads1 = 0;
  int ads2 = 0;
  String ads1text = "...";
  String ads2text = "...";

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      dataFearture.clear();
      dataFlashSale.clear();
      dataFiveStar.clear();
      product.forEach((key, value) {
        // Map<String, dynamic> product2 = value as Map<String, dynamic>;
        Product setPro = Product.fromJson(value);
        dataFearture.add(setPro);
        if (setPro.isSale) {
          dataFlashSale.add(setPro);
        }
        if (countRatedb(setPro.evaluateList) >= 4) {
          dataFiveStar.add(setPro);
        }
      });
      setState(() {
        ads1 = get_randomnumber(0, dataFlashSale.length - 1);
        ads1text = dataFlashSale[ads1].name;
        ads2 = get_randomnumber(0, dataFearture.length - 1);
        ads2text = dataFearture[ads2].name;
      });
    });
  }

  String ad1 = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fads_no_content.png?alt=media&token=7fd17207-9782-4abc-aa62-6cc9b2d6f3be";
  String ad2 = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fads_no_content.png?alt=media&token=7fd17207-9782-4abc-aa62-6cc9b2d6f3be";
  String ad3 = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fads_no_content.png?alt=media&token=7fd17207-9782-4abc-aa62-6cc9b2d6f3be";


  void getADSdata1() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("ads/0").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad1 = product.toString();
      setState(() {

      });
    });
  }

  void getADSdata2() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("ads/1").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad2 = product.toString();
      setState(() {

      });
    });
  }

  void getADSdata3() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("ads/2").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad3 = product.toString();
      setState(() {

      });
    });
  }


  @override
  void initState() {
    super.initState();
    getFeaturedData();
    getADSdata1();
    getADSdata2();
    getADSdata3();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),

        child: ListView(
          children: [
            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: screenWidth * 0.854,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.pinkAccent
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(100, 231, 231, 231),
                ),
                child: Form(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dmsan_regular',
                      //Thêm textAlignVertical vào TextStyle
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'search by product name',
                      hintStyle: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: 'Dmsan_regular',
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                height: 0.8 * screenWidth / 2.1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //ads1
                    Container(
                      height: 0.8 * screenWidth / 2.1,
                      width: 0.8 * screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.network(ad1,fit: BoxFit.cover,),
                    ),

                    Container(
                      height: 0.8 * screenWidth / 2.1,
                      width: 0.02 * screenWidth,
                    ),

                    //ads2
                    Container(
                      height: 0.8 * screenWidth / 2.1,
                      width: 0.8 * screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.network(ad2,fit: BoxFit.cover,),
                    ),

                    Container(
                      height: 0.8 * screenWidth / 2.1,
                      width: 0.02 * screenWidth,
                    ),

                    //ads3
                    Container(
                      height: 0.8 * screenWidth / 2.1,
                      width: 0.8 * screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.network(ad3,fit: BoxFit.cover,),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 30,),

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                height: 340,
                decoration: BoxDecoration(

                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 312,
                      left: 0,
                      child: LocaleText(
                        "flashsale",
                        style: TextStyle(
                            fontFamily: 'arial',
                            color: Color(0xff000000),
                            fontSize: screenWidth/18,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 312,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => viewallproduct(type: 2)));
                        },
                        child: Text(
                          'See all',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 99, 255, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ),


                    Positioned(
                      top: 50,
                      left: 0,
                      child: Container(
                        width: screenWidth,
                        height: 248,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataFlashSale.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFlashSale[index])));
                                },
                                child: ProductItemMobiWidget(product: dataFlashSale[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 54, 105, 201),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: screenWidth/2.5,
                        child: Text(
                          compactString(20, ads1text),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'arial',
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),
                        ),
                      )
                    ),

                    Positioned(
                      bottom: 10,
                      left: 10,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFlashSale[ads1])));
                            },
                            child: LocaleText(
                              "viewnow",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'arial',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),
                            )
                        )
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(

                        ),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fads001icon.png?alt=media&token=31d087f9-c44b-4c74-b64a-70d727ed8ae6",fit: BoxFit.fitHeight),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                height: 340,
                decoration: BoxDecoration(

                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 312,
                      left: 0,
                      child: LocaleText(
                        "featured",
                        style: TextStyle(
                            fontFamily: 'arial',
                            color: Color(0xff000000),
                            fontSize: screenWidth/18,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 312,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => viewallproduct(type: 1)));
                        },
                        child: Text(
                          'See all',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 99, 255, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 0,
                      child: Container(
                        width: screenWidth,
                        height: 248,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataFearture.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFearture[index])));
                                },
                                child: ProductItemMobiWidget(product: dataFearture[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 10, 207, 131),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: screenWidth/2.5,
                          child: Text(
                            compactString(20, ads2text),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'arial',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                        )
                    ),

                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFearture[ads2])));
                            },
                            child: Text('View now >>', textAlign: TextAlign.right, style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'arial',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),
                            )
                        )
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(

                        ),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fads002icon.png?alt=media&token=2c0d43fe-d6bb-4043-bc9f-17b225c33378",fit: BoxFit.fitHeight),
                      ),
                    )
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
