import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF9C27B0),
              Color(0xFFE91E63),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recompensas',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Tus logros y premios',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Puntos disponibles
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.stars,
                                color: Colors.orange,
                                size: 48,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '2.450',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'puntos disponibles',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3E5F5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      color: Color(0xFF9C27B0),
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        '¡Próximo premio en 50 puntos!',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9C27B0),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Insignias desbloqueadas
                        const Text(
                          'Insignias desbloqueadas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.85,
                          children: [
                            _buildBadge(
                              icon: Icons.filter_1,
                              color: const Color(0xFF4CAF50),
                              title: 'Primera\nsemana',
                              subtitle: 'Desbloqueada',
                              isUnlocked: true,
                            ),
                            _buildBadge(
                              icon: Icons.favorite,
                              color: const Color(0xFF2196F3),
                              title: 'Corazón\nfuerte',
                              subtitle: 'Desbloqueada',
                              isUnlocked: true,
                            ),
                            _buildBadge(
                              icon: Icons.emoji_events,
                              color: Colors.orange,
                              title: 'Guerrero',
                              subtitle: 'Desbloqueada',
                              isUnlocked: true,
                            ),
                            _buildBadge(
                              icon: Icons.star,
                              color: const Color(0xFF9C27B0),
                              title: 'Estrella\nbrillante',
                              subtitle: 'Desbloqueada',
                              isUnlocked: true,
                            ),
                            _buildBadge(
                              icon: Icons.bolt,
                              color: Colors.orange,
                              title: 'Energía\nrenovada',
                              subtitle: 'Desbloqueada',
                              isUnlocked: true,
                            ),
                            _buildBadge(
                              icon: Icons.lock,
                              color: Colors.grey,
                              title: 'Misterio',
                              subtitle: 'Bloqueada',
                              isUnlocked: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Premios por canjear
                        const Text(
                          'Premios por canjear',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildReward(
                          icon: Icons.workspace_premium,
                          color: Colors.orange,
                          title: 'Mes premium gratis',
                          subtitle: 'Acceso a funciones exclusivas\n⭐ 1000 puntos',
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _buildReward(
                          icon: Icons.spa,
                          color: const Color(0xFF00BCD4),
                          title: 'Kit de bienestar',
                          subtitle: 'Productos para el cuidado personal\n⭐ 1500 puntos',
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _buildReward(
                          icon: Icons.psychology,
                          color: const Color(0xFFE91E63),
                          title: 'Sesión de coaching',
                          subtitle: '1 hora con especialista certificado\n⭐ 2000 puntos',
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _buildReward(
                          icon: Icons.hotel,
                          color: Colors.grey,
                          title: 'Retiro de fin de semana',
                          subtitle: 'Experiencia de bienestar completa\n⭐ 5000 puntos',
                          onTap: null,
                          isLocked: true,
                        ),
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

  Widget _buildBadge({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required bool isUnlocked,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnlocked ? color.withOpacity(0.3) : Colors.grey[300]!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isUnlocked ? color.withOpacity(0.1) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isUnlocked ? color : Colors.grey,
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isUnlocked ? Colors.black : Colors.grey,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              color: isUnlocked ? color : Colors.grey,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildReward({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
    bool isLocked = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isLocked ? Colors.grey : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: isLocked ? Colors.grey[300] : color,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: Text(
              isLocked ? 'Bloqueado' : 'Canjear',
              style: TextStyle(
                fontSize: 12,
                color: isLocked ? Colors.grey[600] : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

