import 'package:flutter/material.dart';
import 'package:startercode_project/ui/screens/cek_ongkir/cek_ongkir_screen.dart';
import 'package:startercode_project/ui/screens/cek_resi/cek_resi_screen.dart';
import 'package:startercode_project/utils/colors.dart';
import 'package:startercode_project/utils/typography.dart';
import 'package:startercode_project/utils/extensions.dart' as appExt;

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Header(),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            appExt.pushScreen(context, const CekOngkirPage());
                          },
                          child: const MenuItem(
                            title: "Cek Ongkir",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            appExt.pushScreen(context, const CekResiPage());
                          },
                          child: const MenuItem(
                            title: "Cek Resi",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Apa itu Ongkir?",
                  style: LatoBold.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: textPrimaryInverted,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: Text(
                  "\"Ongkir\" adalah singkatan kata dari ONGkos KIrim\" yang merupakan biaya kirim terima barang melalui ekspedisi seperti Pos, JNE, dan kurir lainnya.\n\nSeringkali ditemukan di sosial media , iklan e-commerce yang suka jualan maupun toko online, yang intinya memberikan informasi biaya kirim barang ke alamat pembeli.",
                  style: LatoBold.copyWith(
                    color: const Color.fromARGB(195, 33, 35, 44),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: white,
              //           ),
              //           height: 100,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 24,
              //       ),
              //       Expanded(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: white,
              //           ),
              //           height: 100,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          width: 100,
          height: 100,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              "https://krs.umm.ac.id/Poto/2019/201910370311295.JPG",
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Farli Nahrul Javier",
              style: LatoBold.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: textPrimaryInverted,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "201910370311295",
              style: body2Lato.copyWith(
                color: textPrimaryInverted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  const MenuItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          minRadius: 30,
          backgroundColor: Color.fromARGB(36, 153, 107, 233),
          child: Icon(
            Icons.car_rental,
            size: 40,
            color: Color(0xFF9a6be9),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: LatoBold.copyWith(
            color: Color.fromARGB(195, 33, 35, 44),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
