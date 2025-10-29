import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();
      final success = await authProvider.signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
      );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Cuenta creada con éxito!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1),
            ),
          );
          // Esperar un momento y luego limpiar el stack de navegación
          await Future.delayed(const Duration(milliseconds: 500));
          if (mounted) {
            // Volver a la raíz para que AuthWrapper redireccione al Home
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al crear la cuenta. Inténtalo de nuevo.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.signInWithGoogle();

    if (mounted && !success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al iniciar sesión con Google'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0080FF),
              Color(0xFF00D4AA),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar personalizado
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ],
                ),
              ),
              
              // Contenido scrollable
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.smoke_free,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Título
                        const Text(
                          'NicotineFree',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tu compañero para dejar de fumar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        
                        // Formulario
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Comienza tu transformación',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                
                                // Name field
                                TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Nombre completo',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu nombre';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),

                                // Email field
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Correo electrónico',
                                    suffixIcon: const Icon(
                                      Icons.mail_outline,
                                      color: Color(0xFF00D4AA),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Por favor ingresa un email válido';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),

                                // Password field
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu contraseña';
                                    }
                                    if (value.length < 6) {
                                      return 'La contraseña debe tener al menos 6 caracteres';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 24),

                                // Register button
                                Consumer<AuthProvider>(
                                  builder: (context, authProvider, child) {
                                    return ElevatedButton(
                                      onPressed: authProvider.isLoading
                                          ? null
                                          : _handleRegister,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF0080FF),
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: authProvider.isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Text(
                                              'Crear cuenta',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                    );
                                  },
                                ),
                                // Google Sign-In temporalmente deshabilitado
                                /*
                                const SizedBox(height: 16),

                                // Divider
                                const Row(
                                  children: [
                                    Expanded(child: Divider()),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        'o continúa con',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Expanded(child: Divider()),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Google sign in button
                                OutlinedButton.icon(
                                  onPressed: _handleGoogleSignIn,
                                  icon: const Icon(Icons.g_mobiledata, size: 32),
                                  label: const Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    side: BorderSide(color: Colors.grey[300]!),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                */
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
