import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Tcheke si non fichye a matche
import '../widgets/hero_section.dart';
import '../widgets/service_card.dart';
import '../widgets/footer.dart';
// import '../widgets/premium_fab.dart'; // Si ou genyen l toujou

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Koulè tèm Rivayo Tech
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    return Scaffold(
      extendBodyBehindAppBar: true, // Pou CustomAppBar ka chita sou gradyan an
      appBar: const CustomAppBar(),

      // floatingActionButton: const PremiumServiceFab(),
      body: Container(
        // Background jeneral ki rale style Flyers la
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [nwaRivayo, Color(0xFF162124)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. HERO SECTION (Gradyan + Slider)
              const HeroSection(),

              const SizedBox(height: 60),

              // 2. NOS SERVICES
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'NOS SERVICES',
                      style: TextStyle(
                        color: tealRivayo,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(width: 80, height: 3, color: tealRivayo),
                    const SizedBox(height: 40),
                    const _ServicesPreview(),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // 3. SEKSYON "NOUS SERVONS" (Style Flyers)
              const _ClientsServedSection(),

              // 4. FOOTER (Kontak & Copyright)
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// SERVICES PREVIEW (Avèk ServiceCard modifye a)
// ======================================================

class _ServicesPreview extends StatelessWidget {
  const _ServicesPreview();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: const [
        ServiceCard(
          icon: Icons.phone_android,
          title: 'Développement d\'applications',
          subtitle: 'Solutions mobiles iOS & Android sur mesure.',
          description:
              'Nou kreye aplikasyon ki rapid, sekirize epi ki fasil pou kliyan ou yo sèvi.',
        ),
        ServiceCard(
          icon: Icons.computer,
          title: 'Création de logiciels',
          subtitle: 'Logiciels de gestion pour votre entreprise.',
          description:
              'Sistèm gestion stock, lavant, ak pèsonèl ki adapte ak bezwen biznis ou.',
        ),
        ServiceCard(
          icon: Icons.web,
          title: 'Création de sites web',
          subtitle: 'Sites vitrines et plateformes e-commerce.',
          description:
              'Prezans sou entènèt se kle siksè w. Nou fè sit ki parèt byen sou tout ekran.',
        ),
        ServiceCard(
          icon: Icons.security,
          title: 'Maintenance & Sécurité',
          subtitle: 'Protection et monitoring de vos données.',
          description:
              'Nou asire sistèm ou yo toujou ap kouri san rete ak sekirite total.',
        ),
      ],
    );
  }
}

// ======================================================
// NOUS SERVONS (Modifye ak koulè Teal Rivayo)
// ======================================================

class _ClientsServedSection extends StatelessWidget {
  const _ClientsServedSection();

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: const Border(
          top: BorderSide(color: Colors.white10, width: 1),
          bottom: BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'NOUS SERVONS :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: const [
              _ClientCard(icon: Icons.local_pharmacy, label: 'Pharmacies'),
              _ClientCard(icon: Icons.store, label: 'Dépôts & Commerces'),
              _ClientCard(icon: Icons.school, label: 'Écoles'),
              _ClientCard(
                icon: Icons.local_hospital,
                label: 'Cliniques & Hôpitaux',
              ),
              _ClientCard(icon: Icons.hotel, label: 'Hôtels'),
              _ClientCard(icon: Icons.church, label: 'Églises'),
              _ClientCard(
                icon: Icons.business,
                label: 'PME & Grandes Entreprises',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ClientCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);

    return Container(
      width: 180,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: tealRivayo.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: tealRivayo),
          const SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
