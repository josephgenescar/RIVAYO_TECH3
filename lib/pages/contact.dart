import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/premium_fab.dart';
import 'package:emailjs/emailjs.dart' as emailjs; // Enpòtasyon EmailJS

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  String? _validateName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Veuillez entrer votre nom';
    return null;
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Veuillez entrer un email';
    final re = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    if (!re.hasMatch(v.trim())) return 'Email invalide';
    return null;
  }

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => _isSending = true);

    try {
      // Voye done yo dirèkteman
      await emailjs.send(
        'service_27bhrkb',
        'template_wve0kk9',
        {
          'reply_to': _email.text.trim(),
          'message': _message.text.trim(),
          'name': _name.text.trim(),
        },
        const emailjs.Options(publicKey: 'jX1CBeg7sZYx1K2t_'),
      );

      if (!mounted) return;

      // Mesaj Siksè
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message envoyé avec succès à Rivayo Tech !'),
          backgroundColor: Colors.green,
        ),
      );

      // Netwaye fòm nan
      _name.clear();
      _email.clear();
      _message.clear();
    } catch (e) {
      if (!mounted) return;

      // Mesaj Erè
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'envoi : $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomAppBar(),
      ),
      floatingActionButton: const PremiumServiceFab(),
      body: Container(
        color: const Color(0xFFE1F5FE),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: 'Nom',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      validator: _validateName,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _message,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 6,
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Veuillez entrer un message'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: _isSending ? null : _submit,
                        child: _isSending
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'ENVOYER LE MESSAGE',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.email, color: Colors.blue),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: SelectableText(
                          'josephgenescar@gmail.com',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Copier email',
                        icon: const Icon(Icons.copy, size: 20),
                        onPressed: () async {
                          await Clipboard.setData(
                            const ClipboardData(
                              text: 'josephgenescar@gmail.com',
                            ),
                          );
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Email copié !')),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
