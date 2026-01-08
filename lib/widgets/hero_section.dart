import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Koulè Flyers Rivayo yo
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // Gradyan futuriste Rivayo a
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [nwaRivayo, Color(0xFF002B36), nwaRivayo],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Pati Teks ak Logo
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 40,
                  runSpacing: 20,
                  children: [
                    // Logo a ak yon ti efè lonbraj ki klere (Glow)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: tealRivayo.withOpacity(0.2),
                            blurRadius: 50,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.rocket_launch,
                              color: tealRivayo,
                              size: 100,
                            ),
                      ),
                    ),

                    // Tèks ak Mesaj Hero a
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Solisyon Dijital Entèlijan',
                            style: TextStyle(
                              color: tealRivayo,
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Nou devlope lojisyèl modèn, rapid ak sekirize pou amelyore gestion, pwodiktivite ak kwasans biznis ou.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Bouton yo ak Style Premium
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/contact'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tealRivayo,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 10,
                                ),
                                child: const Text(
                                  'KÒMANSE PROJÈ W',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 15),
                              OutlinedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/services'),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: tealRivayo,
                                    width: 2,
                                  ),
                                  foregroundColor: tealRivayo,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('SÈVIS NOU YO'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 60),

            // ================= IMAGE SLIDER AVÈK STYLE PREMIUM =================
            Column(
              children: [
                const Text(
                  "KÈK NAN REYALIZASYON NOU YO",
                  style: TextStyle(
                    color: Colors.white38,
                    letterSpacing: 3,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                  ),
                  items:
                      [
                        'assets/images/image1.jpeg',
                        'assets/images/image6.jpeg',
                        'assets/images/image3.jpeg',
                        'assets/images/mike.png',
                      ].map((i) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: tealRivayo.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
