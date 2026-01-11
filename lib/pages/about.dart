import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/menu_drawer.dart'; // NOUVO IMPORT LA

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);
    const Color kadNwa = Color(0xFF1A1D1E);

    return Scaffold(
      backgroundColor: nwaRivayo,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),

      // AJOUTE LIY SA A ISIT LA:
      endDrawer: const MenuDrawer(),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [nwaRivayo, Color(0xFF162124)],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER SEKSYON
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'À PROPOS DE NOUS',
                      style: TextStyle(
                        color: tealRivayo,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(width: 80, height: 4, color: tealRivayo),
                  ],
                ),
              ),

              // KÒ TEKS LA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: kadNwa,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: tealRivayo.withOpacity(0.2)),
                  ),
                  child: const Text(
                    "RIVAYO TECH se yon antrepriz ki espesyalize nan pwogramasyon enfòmatik ak devlopman solisyon dijital modèn. Misyon nou se ede ti ak gwo biznis transfòme lide yo an pwodwi teknolojik efikas, rapid ak sekirize. Nou devlope lojisyèl modèn pou amelyore gestion, pwodiktivite ak kwasans biznis ou.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.6,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // VALÈ NOU YO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NOS VALEURS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _valueItem(
                      Icons.auto_awesome,
                      "Innovation",
                      "Sèvi ak dènye teknoloji yo pou solisyon entelijan.",
                      tealRivayo,
                    ),
                    _valueItem(
                      Icons.verified_user,
                      "Fiabilité",
                      "Sistèm ki solid epi ki pa janm tonbe.",
                      tealRivayo,
                    ),
                    _valueItem(
                      Icons.security,
                      "Sécurité",
                      "Pwoteksyon total pou done biznis ou.",
                      tealRivayo,
                    ),
                    _valueItem(
                      Icons.speed,
                      "Performance",
                      "Aplikasyon rapid pou yon pi bon eksperyans.",
                      tealRivayo,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _valueItem(IconData icon, String title, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
