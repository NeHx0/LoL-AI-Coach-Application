import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'favorites_manager.dart';
import 'champion_detail_pages.dart';

class FavoritesPage extends StatefulWidget {
  final bool isDarkTheme;

  const FavoritesPage({
    super.key,
    required this.isDarkTheme,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  // Theme colors
  Color get backgroundColor =>
      widget.isDarkTheme ? const Color(0xFF0A1428) : const Color(0xFFF5F5F5);
  Color get cardColor =>
      widget.isDarkTheme ? const Color(0xFF1E2328) : Colors.white;
  Color get textColor => widget.isDarkTheme ? Colors.white : Colors.black87;
  Color get subtextColor =>
      widget.isDarkTheme ? Colors.white70 : Colors.black54;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return const Color(0xFF4CAF50);
      case 'Medium':
        return const Color(0xFFFF9800);
      case 'Hard':
        return const Color(0xFFF44336);
      default:
        return Colors.grey;
    }
  }

  String getChampionImageUrl(String championId) {
    return 'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/champion/$championId.png';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      color: backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Favori Championlarım',
            style: TextStyle(
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          backgroundColor: cardColor,
          elevation: 0,
          centerTitle: false,
          toolbarHeight: 64,
          iconTheme: IconThemeData(color: textColor),
          actions: [
            AnimatedBuilder(
              animation: FavoritesManager(),
              builder: (context, child) {
                final favoriteCount = FavoritesManager().favoriteCount;
                return favoriteCount > 0
                    ? IconButton(
                        icon: Icon(
                          Icons.clear_all_rounded,
                          color: textColor.withOpacity(0.7),
                          size: 24,
                        ),
                        onPressed: _showClearAllDialog,
                        tooltip: 'Tümünü Temizle',
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: AnimatedBuilder(
          animation: FavoritesManager(),
          builder: (context, child) {
            final favorites = FavoritesManager().favorites;

            if (favorites.isEmpty) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: _buildEmptyState(),
              );
            }

            return FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  // Favoriler sayısı
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          color: Color(0xFF0A1428),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${favorites.length} Favori Champion',
                          style: const TextStyle(
                            color: Color(0xFF0A1428),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Favoriler listesi
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final champion = favorites[index];
                        return TweenAnimationBuilder<double>(
                          duration: Duration(milliseconds: 400 + (index * 100)),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.elasticOut,
                          builder: (context, animation, child) {
                            return Transform.translate(
                              offset: Offset(0, 50 * (1 - animation)),
                              child: Opacity(
                                opacity: animation,
                                child:
                                    _buildFavoriteChampionCard(champion, index),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: const Color(0xFFC89B3C).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                color: const Color(0xFFC89B3C).withOpacity(0.6),
                size: 60,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Henüz Favori Yok',
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Champion detay sayfalarından\n"Favorilere Ekle" butonunu kullanarak\nfavori championlarını ekleyebilirsin',
              style: TextStyle(
                color: subtextColor,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded, size: 20),
              label: const Text(
                'Championları Keşfet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC89B3C),
                foregroundColor: const Color(0xFF0A1428),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: const Color(0xFFC89B3C).withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteChampionCard(Map<String, dynamic> champion, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: textColor.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkTheme ? 0.25 : 0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showChampionActions(champion),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 140,
            child: Row(
              children: [
                // Champion Image
                Container(
                  width: 120,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: getChampionImageUrl(champion['championId']),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) => Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                              ),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF0A1428)),
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                              ),
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              color: Color(0xFF0A1428),
                              size: 48,
                            ),
                          ),
                        ),
                        // Favorite indicator
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFFC89B3C),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_rounded,
                              color: Color(0xFF0A1428),
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Champion Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Name and Role
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              champion['name'],
                              style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC89B3C),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    champion['role'],
                                    style: const TextStyle(
                                      color: Color(0xFF0A1428),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: getDifficultyColor(
                                        champion['difficulty']),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  champion['difficulty'],
                                  style: TextStyle(
                                    color: getDifficultyColor(
                                        champion['difficulty']),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Stats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMiniStat('WIN', '${champion['winRate']}%',
                                Colors.green.shade400),
                            _buildMiniStat('PICK', '${champion['pickRate']}%',
                                const Color(0xFFC89B3C)),
                            _buildMiniStat('BAN', '${champion['banRate']}%',
                                Colors.red.shade400),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Remove button
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: () {
                      FavoritesManager()
                          .removeFromFavorites(champion['championId']);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${champion['name']} favorilerden çıkarıldı'),
                          backgroundColor: Colors.red.shade400,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: Colors.red.shade400,
                      size: 24,
                    ),
                    tooltip: 'Favorilerden Çıkar',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: subtextColor,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  void _showChampionActions(Map<String, dynamic> champion) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: textColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Champion info
            Text(
              champion['name'],
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    'Build',
                    Icons.construction_rounded,
                    Colors.blue.shade400,
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChampionBuildPage(
                            championName: champion['name'],
                            championId: champion['championId'],
                            isDarkTheme: widget.isDarkTheme,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    'Runes',
                    Icons.auto_awesome_rounded,
                    Colors.purple.shade400,
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChampionRunesPage(
                            championName: champion['name'],
                            championId: champion['championId'],
                            isDarkTheme: widget.isDarkTheme,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    'Guide',
                    Icons.menu_book_rounded,
                    Colors.orange.shade400,
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChampionGuidePage(
                            championName: champion['name'],
                            championId: champion['championId'],
                            isDarkTheme: widget.isDarkTheme,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Tüm Favorileri Temizle',
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Tüm favori championları listeden çıkarmak istediğine emin misin?',
          style: TextStyle(
            color: subtextColor,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(color: subtextColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FavoritesManager().clearAllFavorites();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tüm favoriler temizlendi'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
            ),
            child: const Text('Temizle'),
          ),
        ],
      ),
    );
  }
}
