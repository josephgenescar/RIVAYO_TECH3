import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
// import '../widgets/premium_fab.dart'; // Aktive sa si fichye a egziste

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    return Scaffold(
      backgroundColor: nwaRivayo,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      // floatingActionButton: const PremiumServiceFab(),
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
              // Header Seksyon an
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NOS RÉALISATIONS',
                      style: TextStyle(
                        color: tealRivayo,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dekouvri kèk nan pwojè nou reyalize ak teknoloji modèn.',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Container(width: 60, height: 4, color: tealRivayo),
                  ],
                ),
              ),

              const Padding(padding: EdgeInsets.all(20), child: _ProjectGrid()),

              const SizedBox(height: 40),
              const Footer(),
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
    const Color tealRivayo = Color(0xFF00B4AD);

    // Done pwojè yo ak enfòmasyon ki sou flyers la
    final projects = [
      {
        'title': 'Sistèm Jere Famasi',
        'tech': 'Flutter / Cloud Database',
        'image': 'assets/images/image1.jpeg',
      },
      {
        'title': 'Aplikasyon Mobil Biznis',
        'tech': 'Android & iOS',
        'image': 'assets/images/image6.jpeg',
      },
      {
        'title': 'Dashboard Administratif',
        'tech': 'Web Responsive',
        'image': 'assets/images/image3.jpeg',
      },
      {
        'title': 'Sit Web Pwofesyonèl',
        'tech': 'SEO Optimized',
        'image': 'assets/images/mike.png',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 900
            ? 3
            : (constraints.maxWidth > 600 ? 2 : 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.85,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final p = projects[index];
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1D1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: tealRivayo.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imaj Pwojè a
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        p['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.white10,
                          child: const Icon(
                            Icons.code,
                            color: tealRivayo,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Detay Pwojè a
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          p['tech']!,
                          style: const TextStyle(
                            color: tealRivayo,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
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
