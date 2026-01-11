import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'dart:ui_web' as ui; // Pou anrejistre view HTML la
import 'dart:html' as html; // Pou manipile kòd JavaScript Adsterra a
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/menu_drawer.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    // NOU ANREJISTRE BANNER LA ISIT LA POU FLUTTER WEB KA KONPRANN LI
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'adsterra-banner-728x90',
      (int viewId) => html.DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.display = 'flex'
        ..style.justifyContent = 'center'
        ..append(
          html.ScriptElement()
            ..async = true
            ..src =
                "//www.topcreativeformat.com/6a078d50925ec49a010f6f08265632ac/invoke.js",
        )
        ..append(
          html.DivElement()..id = "container-6a078d50925ec49a010f6f08265632ac",
        ),
    );

    return Scaffold(
      backgroundColor: nwaRivayo,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      endDrawer: const MenuDrawer(),
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

              // --- SEKSYON SMARTLINK (BOUTON) ---
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1D1E),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: tealRivayo.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: tealRivayo.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.volunteer_activism,
                        color: tealRivayo,
                        size: 40,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Ou renmen pwojè nou yo?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Ou ka sipòte Rivayo Tech gratis sèlman lè w gade yon ti piblisite.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          const String adsterraLink =
                              "https://www.effectivegatecpm.com/fkciwcfuz?key=6a078d50925ec49a010f6f08265632ac";
                          js.context.callMethod('open', [adsterraLink]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tealRivayo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("GADE YON PUB POU SIPÒTE NOU"),
                      ),
                    ],
                  ),
                ),
              ),

              // --- SEKSYON BANNER 728x90 (OTOMATIK) ---
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Sponsors",
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 728,
                      height: 90,
                      child: HtmlElementView(
                        viewType: 'adsterra-banner-728x90',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

// _ProjectGrid rete menm jan...
class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid();
  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
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
