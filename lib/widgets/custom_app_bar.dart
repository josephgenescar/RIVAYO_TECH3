import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    Image.asset(
      'assets/images/logo.png',
      width: 64,
      height: 60,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 64,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(60, 230, 170, 170),
          shape: BoxShape.circle,
        ),
      ),
    );

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 106, 165, 242),
      centerTitle: true,
      elevation: 0,

      title: SizedBox(
        height: 260,
        width: 260,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(60, 230, 170, 170),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/'),
          child: const Text('Accueil', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/services'),
          child: const Text('Services', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/projects'),
          child: const Text('Projets', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/about'),
          child: const Text('À propos', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/contact'),
          child: const Text('Contact', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
