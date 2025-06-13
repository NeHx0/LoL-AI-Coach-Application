import 'package:flutter/material.dart';
import 'champions.dart';

void main() {
  runApp(const LeagueChampionsApp());
}

class LeagueChampionsApp extends StatelessWidget {
  const LeagueChampionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'League Champions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A1428),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showLaneRecommendationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.88, // Daha yüksek
        decoration: const BoxDecoration(
          color: Color(0xFF1E2328),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      'Hangi Lane İçin\nTavsiye İstiyorsun?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Oyun tarzına uygun champion önerisi yapalım',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Lane Options - Düzeltilmiş grid
                    Expanded(
                      child: Column(
                        children: [
                          // İlk 4 lane - 2x2 grid
                          Expanded(
                            flex: 2,
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.9, // Daha uzun kartlar
                              children: [
                                _buildLaneCard('Top', Icons.shield,
                                    'Tank & Fighter', Colors.red.shade400),
                                _buildLaneCard('Jungle', Icons.forest,
                                    'Ganker & Roamer', Colors.green.shade400),
                                _buildLaneCard('Mid', Icons.flash_on,
                                    'Mage & Assassin', Colors.blue.shade400),
                                _buildLaneCard('ADC', Icons.gps_fixed,
                                    'Marksman & Carry', Colors.orange.shade400),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Support - Tek satır, geniş
                          Container(
                            height: 120,
                            child: _buildWideCard('Support', Icons.favorite,
                                'Utility & Healer', Colors.pink.shade400),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Random Suggestion Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _showRandomChampionRecommendation();
                        },
                        icon: const Icon(Icons.shuffle, size: 24),
                        label: const Text(
                          'Rastgele Öneri Ver',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC89B3C),
                          foregroundColor: const Color(0xFF0A1428),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 6,
                          shadowColor: const Color(0xFFC89B3C).withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLaneCard(
      String lane, IconData icon, String description, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        _showLaneChampionRecommendation(lane);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.2),
              color.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(18), // Biraz daha büyük
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 36, // Daha büyük icon
                ),
              ),
              const SizedBox(height: 16), // Daha fazla boşluk
              Text(
                lane,
                style: TextStyle(
                  color: color,
                  fontSize: 20, // Daha büyük font
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13, // Biraz daha büyük
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWideCard(
      String lane, IconData icon, String description, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        _showLaneChampionRecommendation(lane);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.2),
              color.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 36,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lane,
                      style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLaneChampionRecommendation(String lane) {
    final recommendations = _getRecommendationsForLane(lane);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2328),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          '$lane Lane Önerileri',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: recommendations
              .map((champion) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1428),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Color(0xFF0A1428),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                champion['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                champion['reason']!,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Kapat',
              style: TextStyle(color: Color(0xFFC89B3C)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChampionListScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC89B3C),
              foregroundColor: const Color(0xFF0A1428),
            ),
            child: const Text('Tüm Championları Gör'),
          ),
        ],
      ),
    );
  }

  void _showRandomChampionRecommendation() {
    final allChampions = [
      {'name': 'Darius', 'lane': 'Top', 'reason': 'Kolay oynanan, güçlü tank'},
      {
        'name': 'Jinx',
        'lane': 'ADC',
        'reason': 'Yüksek hasar, team fight odaklı'
      },
      {'name': 'Ahri', 'lane': 'Mid', 'reason': 'Mobil, güvenli pick'},
      {
        'name': 'Thresh',
        'lane': 'Support',
        'reason': 'Çok yönlü, oyun değiştirici'
      },
      {
        'name': 'Graves',
        'lane': 'Jungle',
        'reason': 'Güçlü early game, carry potansiyeli'
      },
    ];

    final random =
        allChampions[DateTime.now().millisecond % allChampions.length];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2328),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          '🎯 Rastgele Öneri',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0A1428),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFC89B3C).withOpacity(0.3)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFC89B3C).withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFF0A1428),
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                random['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFC89B3C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  random['lane']!,
                  style: const TextStyle(
                    color: Color(0xFF0A1428),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                random['reason']!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Kapat',
              style: TextStyle(color: Color(0xFFC89B3C)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChampionListScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC89B3C),
              foregroundColor: const Color(0xFF0A1428),
            ),
            child: const Text('Championları Gör'),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _getRecommendationsForLane(String lane) {
    switch (lane) {
      case 'Top':
        return [
          {
            'name': 'Garen',
            'reason': 'Basit, güçlü, yeni başlayanlar için ideal'
          },
          {'name': 'Darius', 'reason': 'Agresif, lane baskısı yüksek'},
          {'name': 'Malphite', 'reason': 'Tank, team fight odaklı'},
        ];
      case 'Jungle':
        return [
          {
            'name': 'Master Yi',
            'reason': 'Basit jungle clear, güçlü late game'
          },
          {'name': 'Ammu', 'reason': 'Kolay ganks, team fight ultisi'},
          {'name': 'Warwick', 'reason': 'Sürdürülebilir, kolay jungle'},
        ];
      case 'Mid':
        return [
          {'name': 'Annie', 'reason': 'Basit, güçlü combo potential'},
          {'name': 'Ahri', 'reason': 'Güvenli, mobil, çok yönlü'},
          {'name': 'Malzahar', 'reason': 'Kolay wave clear, güçlü ult'},
        ];
      case 'ADC':
        return [
          {'name': 'Ashe', 'reason': 'Kolay mechanics, utility odaklı'},
          {'name': 'Jinx', 'reason': 'Güçlü team fights, scaling'},
          {'name': 'Caitlyn', 'reason': 'Uzun menzil, güvenli laning'},
        ];
      case 'Support':
        return [
          {'name': 'Lux', 'reason': 'Kolay skillshots, hasar + utility'},
          {'name': 'Leona', 'reason': 'Tank support, güçlü engage'},
          {'name': 'Morgana', 'reason': 'CC immunity, kolay bindings'},
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1428),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const SizedBox(height: 20),
                const Text(
                  'League of\nLegends',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Champion Rehberi',
                  style: TextStyle(
                    color: Color(0xFFC89B3C),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 40),

                // Recommendation Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFC89B3C),
                        Color(0xFFD4AF37),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC89B3C).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _showLaneRecommendationModal,
                      borderRadius: BorderRadius.circular(24),
                      child: const Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color: Color(0xFF0A1428),
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'TAVSİYE İÇİN TIKLA',
                              style: TextStyle(
                                color: Color(0xFF0A1428),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Oyun tarzına uygun champion önerisi al',
                              style: TextStyle(
                                color: Color(0xFF0A1428),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Quick Actions
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickActionCard(
                        'Tüm\nChampions',
                        Icons.grid_view_rounded,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChampionListScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildQuickActionCard(
                        'Meta\nAnaliz',
                        Icons.trending_up_rounded,
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Meta analysis coming soon!'),
                              backgroundColor: Color(0xFFC89B3C),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Stats Section
                const Text(
                  'Güncel İstatistikler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2328),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('50+', 'Champions'),
                          _buildStatDivider(),
                          _buildStatItem('5', 'Roles'),
                          _buildStatDivider(),
                          _buildStatItem('∞', 'Stratejiler'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
      String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2328),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFFC89B3C),
                  size: 36,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFFC89B3C),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white.withOpacity(0.1),
    );
  }
}
