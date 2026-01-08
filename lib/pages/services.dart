import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/service_card.dart';
import '../widgets/footer.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Koulè Rivayo Tech
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    return Scaffold(
      backgroundColor: nwaRivayo,
      extendBodyBehindAppBar: true, // Pou CustomAppBar ka melanje ak gradyan an
      appBar: const CustomAppBar(),
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
              // TIT AK ENTWODIKSYON
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SÈVIS NOU YO',
                      style: TextStyle(
                        color: tealRivayo,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Solisyon Dijital Entelijan pou Ti & Gwo Biznis.',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    Container(width: 80, height: 4, color: tealRivayo),
                  ],
                ),
              ),

              // LIS SÈVIS YO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    ServiceCard(
                      icon: Icons.web,
                      title: 'Développement Site Web Professionnel',
                      subtitle: 'Prezans sou entènèt se kle siksè w.',
                      description:
                          'Nou kreye sit web ki rapid, responsif (ki mache sou tout ekran), epi ki optimize pou SEO pou kliyan jwenn ou fasil.',
                    ),
                    SizedBox(height: 20),
                    ServiceCard(
                      icon: Icons.phone_android,
                      title: 'Création Application Mobile',
                      subtitle: 'Solisyon mobil iOS & Android sou mezi.',
                      description:
                          'Devlope aplikasyon pèsonalize pou biznis ou, ki fasil pou kliyan itilize epi ki sekirize nèt.',
                    ),
                    SizedBox(height: 20),
                    ServiceCard(
                      icon: Icons.computer,
                      title: 'Création Logiciel sur mesure',
                      subtitle: 'Lojisyèl gestion pou biznis ou.',
                      description:
                          'Sistèm gestion stock, lavant, ak pèsonèl ki adapte ak bezwen espesifik antrepriz ou.',
                    ),
                    SizedBox(height: 20),
                    ServiceCard(
                      icon: Icons.settings_suggest,
                      title: 'Automatisation des systèmes',
                      subtitle: 'Diminye erè ak ogmante vitès.',
                      description:
                          'Otomatize pwosesis operasyonèl ou yo pou redui depans epi ogmante pwodiktivite ekip ou a.',
                    ),
                    SizedBox(height: 20),
                    ServiceCard(
                      icon: Icons.business_center,
                      title: 'Solutions digitales pour entreprises',
                      subtitle: 'Aktonpanye kwasans ou nan dijital la.',
                      description:
                          'Konsiltasyon ak aplikasyon estrateji teknolojik pou ede biznis ou grandi nan mache modèn nan.',
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
}
