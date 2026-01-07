import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/service_card.dart';
import '../widgets/footer.dart';
import '../widgets/premium_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomAppBar(),
      ),
      floatingActionButton: const PremiumServiceFab(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HeroSection(),
            SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _ServicesPreview(),
            ),

            SizedBox(height: 60),

            // 🔥 NOUS SERVONS
            _ClientsServedSection(),

            SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// SERVICES
// ======================================================

class _ServicesPreview extends StatelessWidget {
  const _ServicesPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nos Services', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            ServiceCard(
              icon: Icons.phone_android,
              title: 'Développement d\'applications',
              subtitle: 'Applications mobiles et web sur mesure',
              description:
                  'Conception d\'applications mobiles et web centrées sur l\'expérience utilisateur, la performance et la scalabilité. Nous accompagnons votre projet depuis l\'idéation jusqu\'au déploiement et au support.',
              color: Color(0xFFFFF9C4),
            ),
            ServiceCard(
              icon: Icons.computer,
              title: 'Création de logiciels',
              subtitle: 'Logiciels métiers et solutions d\'entreprise',
              description:
                  'Réalisation de logiciels métiers et solutions d\'entreprise personnalisées : analyse des besoins, architecture, développement, tests et formation.',
              color: Color(0xFFC8E6C9),
            ),
            ServiceCard(
              icon: Icons.web,
              title: 'Création de sites web',
              subtitle: 'Sites vitrines et plateformes',
              description:
                  'Création de sites web responsives et optimisés pour la performance, l\'accessibilité et le SEO, avec intégrations sur mesure.',
              color: Color(0xFFBBDEFB),
            ),
            ServiceCard(
              icon: Icons.security,
              title: 'Maintenance & Sécurité',
              subtitle: 'Maintenance, sauvegarde et protection',
              description:
                  'Services de maintenance, sauvegarde, monitoring et audits de sécurité pour assurer disponibilité et protection des données.',
              color: Color(0xFFFFCDD2),
            ),
          ],
        ),
      ],
    );
  }
}

// ======================================================
// NOUS SERVONS
// ======================================================

class _ClientsServedSection extends StatelessWidget {
  const _ClientsServedSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'NOUS SERVONS :',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 45),

          Wrap(
            spacing: 28,
            runSpacing: 28,
            alignment: WrapAlignment.center,
            children: const [
              _ClientCard(icon: Icons.local_pharmacy, label: 'Pharmacies'),
              _ClientCard(icon: Icons.store, label: 'Dépôts & Commerces'),
              _ClientCard(icon: Icons.school, label: 'Écoles'),
              _ClientCard(
                icon: Icons.local_hospital,
                label: 'Cliniques & Hôpitaux',
              ), //
              _ClientCard(icon: Icons.hotel, label: 'Hôtels'),
              _ClientCard(icon: Icons.church, label: 'Églises'),
              _ClientCard(
                icon: Icons.business,
                label: 'Entreprises\n(petites & grandes)',
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
    return Container(
      width: 220,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF00E5A0), width: 1.3),
      ),
      child: Column(
        children: [
          Icon(icon, size: 44, color: const Color(0xFF00E5A0)),
          const SizedBox(height: 18),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
