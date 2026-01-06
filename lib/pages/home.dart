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
          children: [
            const HeroSection(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _ServicesPreview(),
            ),
            const SizedBox(height: 32),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _ServicesPreview extends StatelessWidget {
  const _ServicesPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nos Services', style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 12),
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
