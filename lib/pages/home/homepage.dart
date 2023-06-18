import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/helper/my_style.dart';
import 'package:project_dkriya/widget/product_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(
          'https://s3-id-jkt-1.kilatstorage.id/d3si-telu/dkriya/homapage.json'));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
        });
      } else {
        print('Failed to fetch products');
      }
    } catch (error) {
      print('Error fetching products: $error');
      throw error; // Throw the error
    }
  }

  Widget searchBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(9, 9, 12, 9),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 42,
          width: 250,
          child: Row(
            children: [
              Image.asset(
                "assets/icon_search.png",
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: "Cari Barang",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColor.primaryColor,
          ),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              "assets/icon_chat.png",
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColor.primaryColor,
          ),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              "assets/icon_keranjang.png",
            ),
          ),
        ),
      ],
    );
  }

  Widget categoryWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColor.primaryColor,
              border: null,
            ),
            child: Text("Souvenir",
                style: MyStyle.categoryText.copyWith(color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(
                color: MyColor.primaryColor,
              ),
            ),
            child: Text(
              "Perlengkapan",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(
                color: MyColor.primaryColor,
              ),
            ),
            child: Text(
              "Hiasan",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(
                color: MyColor.primaryColor,
              ),
            ),
            child: Text(
              "Koleksi",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              border: Border.all(
                color: MyColor.primaryColor,
              ),
            ),
            child: Text(
              "Lainnya",
              style: MyStyle.categoryText.copyWith(color: MyColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommendationProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          products.length,
          (index) => ProductCard(product: products[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            searchBox(),
            SizedBox(height: 20),
            categoryWidget(),
            SizedBox(height: 40),
            Text("Rekomendasi",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 10),
            recommendationProduct(),
            SizedBox(
              height: 20,
            ),
            Text("Baru Dilihat",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 10),
            recommendationProduct(),
          ],
        ),
      ),
    );
  }
}
