import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/premium_fab.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomAppBar(),
      ),
      floatingActionButton: const PremiumServiceFab(),
      body: Container(
        color: const Color(0xFFFFF3E0),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('À propos', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            const Text(
              "RIVAYO TECH est une entreprise spécialisée dans la programmation informatique et le développement de solutions numériques modernes. Notre mission est d'aider les particuliers et entreprises à transformer leurs idées en produits technologiques efficaces.",
            ),
            const SizedBox(height: 24),
            Text('Valeurs', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const Text('- Innovation\n- Fiabilité\n- Sécurité\n- Performance'),
            const SizedBox(height: 32),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
