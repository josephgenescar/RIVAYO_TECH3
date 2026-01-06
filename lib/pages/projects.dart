import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/premium_fab.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomAppBar(),
      ),
      floatingActionButton: const PremiumServiceFab(),
      // SOLUTION 1: SingleChildScrollView dwe paran an nèt
      body: SingleChildScrollView(
        physics:
            const BouncingScrollPhysics(), // Bay yon pi bon santiman sou mobil
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Projets', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              const Text('Projets en cours / Réalisations (exemples)'),
              const SizedBox(height: 16),

              // SOLUTION 2: Pa mete Expanded isit la!
              const _ProjectGrid(),

              const SizedBox(height: 40),
              const Footer(), // Kounye a Footer a ap parèt anba nèt lè w fin scroll
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid();

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'App Mobile',
        'tech': 'Flutter / Firebase',
        'image': 'assets/image/project1.png',
      },
      {
        'title': 'Site Vitrine',
        'tech': 'Flutter Web',
        'image': 'assets/image/project2.png',
      },
      {
        'title': 'Dashboard',
        'tech': 'Flutter / REST',
        'image': 'assets/image/project3.png',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Detèmine kantite kolon selon lajè ekran an
        int crossAxisCount = constraints.maxWidth > 900
            ? 3
            : (constraints.maxWidth > 600 ? 2 : 1);

        return GridView.builder(
          // SOLUTION 3: Sa yo se de liy ki pi enpòtan yo
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: constraints.maxWidth > 600 ? 1.1 : 1.3,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final p = projects[index];
            return Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      p['image']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.blueGrey[50],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['title']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          p['tech']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
