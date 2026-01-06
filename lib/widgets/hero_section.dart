import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // 1. PA BLIYE ENPÒTE SA

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Nou retire 'color' epi nou mete 'decoration' pou background imaj la
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.jpg',
          ), // IMAG BACKGROUND LA
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(
              0.8,
            ), // Sa ap fè imaj la pal pou tèks la parèt byen
            BlendMode.lighten,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: SingleChildScrollView(
        // Nou ajoute sa pou kontni an pa koupe si l twò long
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 260,
                  height: 170,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    final primary = Theme.of(context).colorScheme.primary;
                    final placeholderColor = primary.withAlpha(
                      (0.2 * 255).round(),
                    );
                    return Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: placeholderColor,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Solutions numériques intelligentes',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Développement d\'applications, sites web et solutions informatiques sur mesure.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/contact'),
                  child: const Text('Demander un service'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/services'),
                  child: const Text('Voir nos services'),
                ),
              ],
            ),

            // ================= KÒMANSE IMAGE SLIDER LA ISIT =================
            const SizedBox(height: 30), // Espas ant bouton yo ak slider a
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items:
                  [
                    'assets/images/image1.jpeg',
                    'assets/images/image6.jpeg',
                    'assets/images/image3.jpeg',
                    'assets/images/mike.png',
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
            // ================= FINI IMAGE SLIDER LA ISIT =================
          ],
        ),
      ),
    );
  }
}
