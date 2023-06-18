import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_color.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  void _showBuyConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda ingin membeli barang ini?"),
          actions: [
            TextButton(
              child: Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            TextButton(
              child: Text("Ya"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ],
        );
      },
    );
  }

  Widget searchBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColor.primaryColor,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon_back.png",
            ),
          ),
        ),
        SizedBox(width: 0),
        Container(
          padding: EdgeInsets.fromLTRB(9, 9, 12, 9),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 42,
          width: 200,
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
          width: 0,
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
          width: 0,
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

  Widget buyProduct() {
    return Row(
      children: [
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
        SizedBox(
          width: 10,
        ),
        Container(
          width: 308,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColor.primaryColor,
          ),
          child: TextButton(
            onPressed: () {
              _showBuyConfirmationDialog(context);
            },
            child: Text(
              "Beli Sekarang",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: searchBox(),
                    ),
                    SizedBox(height: 20),
                    Image.network(
                      widget.product['imageUrl'],
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Harga: Rp${widget.product['price'].toString()}00',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Deskripsi: ${widget.product['description']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
                      child: buyProduct(),
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
