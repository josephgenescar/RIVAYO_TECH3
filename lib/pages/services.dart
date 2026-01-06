import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/service_card.dart';
import '../widgets/footer.dart';
import '../widgets/premium_fab.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomAppBar(),
      ),
      floatingActionButton: const PremiumServiceFab(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Services', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            const ServiceCard(
              icon: Icons.phone_android,
              title: 'Développement d\'applications',
              subtitle: 'Applications mobiles et web sur mesure',
              description:
                  'Conception et développement d\'applications mobiles et web sur mesure, centrées sur l\'expérience utilisateur, la performance et la robustesse. Nous accompagnons le projet depuis l\'idée initiale jusqu\'au déploiement, incluant l\'intégration d\'API, les tests, la mise en production et le support continu.',
              color: Color(0xFFFFF9C4),
            ),
            const SizedBox(height: 8),
            const ServiceCard(
              icon: Icons.computer,
              title: 'Création de logiciels',
              subtitle: 'Logiciels métiers et solutions d\'entreprise',
              description:
                  'Conception et développement de logiciels métiers et solutions d\'entreprise personnalisées. Nous réalisons l\'analyse des besoins, l\'architecture logicielle, le développement, les tests, la documentation et la formation des utilisateurs pour assurer une transition fluide et une adoption rapide.',
              color: Color(0xFFC8E6C9),
            ),
            const SizedBox(height: 8),
            const ServiceCard(
              icon: Icons.web,
              title: 'Création de sites web',
              subtitle: 'Sites vitrines, plateformes et dashboards',
              description:
                  'Réalisation de sites vitrines et plateformes web performants et responsives, optimisés pour le référencement et l\'accessibilité. Nous proposons des designs modernes, des flux utilisateurs clairs et des intégrations sur mesure (CMS, e‑commerce, API).',
              color: Color(0xFFBBDEFB),
            ),
            const SizedBox(height: 8),
            const ServiceCard(
              icon: Icons.settings,
              title: 'Solutions informatiques',
              subtitle: 'Automatisation et systèmes de gestion',
              description:
                  'Mise en place de solutions informatiques pour automatiser les processus, centraliser la gestion et connecter les outils. Nous réalisons l\'audit, la conception, l\'intégration et le déploiement d\'outils adaptés pour augmenter la productivité et réduire les erreurs opérationnelles.',
              color: Color(0xFFFFCDD2),
            ),
            const SizedBox(height: 8),
            const ServiceCard(
              icon: Icons.lock,
              title: 'Maintenance & Sécurité',
              subtitle: 'Maintenance, sauvegarde et protection',
              description:
                  'Services de maintenance continue, gestion des mises à jour, sauvegardes et audits de sécurité. Nous mettons en place des mesures de protection, la surveillance et le support technique pour garantir la disponibilité, l\'intégrité et la confidentialité des données.',
              color: Color(0xFFFFF9C4),
            ),
            const SizedBox(height: 32),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
