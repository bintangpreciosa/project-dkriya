import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dkriya/helper/my_style.dart';

import '../../helper/my_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Anda yakin untuk keluar?"),
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
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buttonChangePassword() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Text(
              "Produk yang dibeli",
              style: MyStyle.profileMenuText,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonInformasi() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Text(
              "Informasi Bantuan",
              style: MyStyle.profileMenuText,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonPengaturan(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/settings');
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              "Pengaturan",
              style: MyStyle.profileMenuText,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonRating() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Ganti kata sandi",
                  style: MyStyle.profileMenuText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonLogout(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showLogoutConfirmationDialog(context);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFAF1B1B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFAF1B1B),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              "Keluar Akun",
              style: MyStyle.profileMenuText.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: MyStyle.appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // shadowColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/photo_profile.png'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "John Doe",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF032630),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 114,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColor.primaryColor,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ubah Profile",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFF6F6F6),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  buttonChangePassword(),
                  buttonInformasi(),
                  buttonPengaturan(context),
                  buttonRating(),
                  buttonLogout(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
