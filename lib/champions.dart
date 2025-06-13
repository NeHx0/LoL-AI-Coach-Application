import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'champion_detail_pages.dart';

class Champion {
  final String name;
  final String role;
  final String difficulty;
  final double winRate;
  final double pickRate;
  final double banRate;
  final String championId;

  Champion({
    required this.name,
    required this.role,
    required this.difficulty,
    required this.winRate,
    required this.pickRate,
    required this.banRate,
    required this.championId,
  });

  String get imageUrl {
    return 'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/champion/$championId.png';
  }

  String get splashUrl {
    return 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championId}_0.jpg';
  }
}

class ChampionListScreen extends StatefulWidget {
  const ChampionListScreen({super.key});

  @override
  State<ChampionListScreen> createState() => _ChampionListScreenState();
}

class _ChampionListScreenState extends State<ChampionListScreen>
    with TickerProviderStateMixin {
  String selectedRole = 'All';
  String searchQuery = '';
  bool isDarkTheme = true;

  late AnimationController _searchController;
  late AnimationController _filterController;
  late Animation<double> _searchAnimation;
  late Animation<double> _filterAnimation;

  final List<String> roles = ['All', 'Top', 'Jungle', 'Mid', 'ADC', 'Support'];

  final List<Champion> champions = [
    // Top Lane
    Champion(
        name: 'Darius',
        role: 'Top',
        difficulty: 'Easy',
        winRate: 52.3,
        pickRate: 8.7,
        banRate: 12.4,
        championId: 'Darius'),
    Champion(
        name: 'Garen',
        role: 'Top',
        difficulty: 'Easy',
        winRate: 51.8,
        pickRate: 6.2,
        banRate: 3.1,
        championId: 'Garen'),
    Champion(
        name: 'Fiora',
        role: 'Top',
        difficulty: 'Hard',
        winRate: 49.2,
        pickRate: 4.3,
        banRate: 8.9,
        championId: 'Fiora'),
    Champion(
        name: 'Camille',
        role: 'Top',
        difficulty: 'Hard',
        winRate: 48.7,
        pickRate: 3.8,
        banRate: 15.2,
        championId: 'Camille'),
    Champion(
        name: 'Malphite',
        role: 'Top',
        difficulty: 'Easy',
        winRate: 53.1,
        pickRate: 5.9,
        banRate: 6.7,
        championId: 'Malphite'),
    Champion(
        name: 'Shen',
        role: 'Top',
        difficulty: 'Medium',
        winRate: 50.5,
        pickRate: 3.2,
        banRate: 2.8,
        championId: 'Shen'),
    Champion(
        name: 'Riven',
        role: 'Top',
        difficulty: 'Hard',
        winRate: 48.3,
        pickRate: 7.1,
        banRate: 11.5,
        championId: 'Riven'),
    Champion(
        name: 'Jax',
        role: 'Top',
        difficulty: 'Medium',
        winRate: 50.8,
        pickRate: 6.4,
        banRate: 7.3,
        championId: 'Jax'),
    Champion(
        name: 'Aatrox',
        role: 'Top',
        difficulty: 'Medium',
        winRate: 49.6,
        pickRate: 9.2,
        banRate: 18.7,
        championId: 'Aatrox'),
    Champion(
        name: 'Mordekaiser',
        role: 'Top',
        difficulty: 'Easy',
        winRate: 51.2,
        pickRate: 4.8,
        banRate: 9.3,
        championId: 'Mordekaiser'),

    // Jungle
    Champion(
        name: 'Graves',
        role: 'Jungle',
        difficulty: 'Medium',
        winRate: 51.5,
        pickRate: 7.8,
        banRate: 5.4,
        championId: 'Graves'),
    Champion(
        name: 'Lee Sin',
        role: 'Jungle',
        difficulty: 'Hard',
        winRate: 47.8,
        pickRate: 12.3,
        banRate: 8.9,
        championId: 'LeeSin'),
    Champion(
        name: 'Master Yi',
        role: 'Jungle',
        difficulty: 'Easy',
        winRate: 50.2,
        pickRate: 8.9,
        banRate: 22.1,
        championId: 'MasterYi'),
    Champion(
        name: 'Ekko',
        role: 'Jungle',
        difficulty: 'Medium',
        winRate: 49.5,
        pickRate: 6.7,
        banRate: 7.8,
        championId: 'Ekko'),
    Champion(
        name: 'Ammu',
        role: 'Jungle',
        difficulty: 'Easy',
        winRate: 52.7,
        pickRate: 4.2,
        banRate: 3.6,
        championId: 'Amumu'),
    Champion(
        name: 'Kayn',
        role: 'Jungle',
        difficulty: 'Medium',
        winRate: 49.8,
        pickRate: 9.4,
        banRate: 12.8,
        championId: 'Kayn'),
    Champion(
        name: 'Kindred',
        role: 'Jungle',
        difficulty: 'Hard',
        winRate: 48.9,
        pickRate: 3.1,
        banRate: 4.2,
        championId: 'Kindred'),
    Champion(
        name: 'Warwick',
        role: 'Jungle',
        difficulty: 'Easy',
        winRate: 51.2,
        pickRate: 5.8,
        banRate: 2.9,
        championId: 'Warwick'),
    Champion(
        name: 'Kha\'Zix',
        role: 'Jungle',
        difficulty: 'Medium',
        winRate: 49.7,
        pickRate: 8.1,
        banRate: 9.6,
        championId: 'Khazix'),
    Champion(
        name: 'Viego',
        role: 'Jungle',
        difficulty: 'Medium',
        winRate: 48.4,
        pickRate: 7.3,
        banRate: 14.5,
        championId: 'Viego'),

    // Mid Lane
    Champion(
        name: 'Yasuo',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 48.1,
        pickRate: 15.2,
        banRate: 35.7,
        championId: 'Yasuo'),
    Champion(
        name: 'Zed',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 49.3,
        pickRate: 11.8,
        banRate: 28.4,
        championId: 'Zed'),
    Champion(
        name: 'Ahri',
        role: 'Mid',
        difficulty: 'Medium',
        winRate: 51.2,
        pickRate: 8.9,
        banRate: 6.2,
        championId: 'Ahri'),
    Champion(
        name: 'Katarina',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 48.9,
        pickRate: 6.7,
        banRate: 15.3,
        championId: 'Katarina'),
    Champion(
        name: 'Annie',
        role: 'Mid',
        difficulty: 'Easy',
        winRate: 52.8,
        pickRate: 3.4,
        banRate: 1.8,
        championId: 'Annie'),
    Champion(
        name: 'Orianna',
        role: 'Mid',
        difficulty: 'Medium',
        winRate: 50.1,
        pickRate: 5.2,
        banRate: 3.7,
        championId: 'Orianna'),
    Champion(
        name: 'Azir',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 47.2,
        pickRate: 4.1,
        banRate: 8.9,
        championId: 'Azir'),
    Champion(
        name: 'Syndra',
        role: 'Mid',
        difficulty: 'Medium',
        winRate: 49.7,
        pickRate: 7.3,
        banRate: 9.1,
        championId: 'Syndra'),
    Champion(
        name: 'LeBlanc',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 48.4,
        pickRate: 5.8,
        banRate: 11.2,
        championId: 'Leblanc'),
    Champion(
        name: 'Malzahar',
        role: 'Mid',
        difficulty: 'Easy',
        winRate: 52.1,
        pickRate: 4.6,
        banRate: 7.8,
        championId: 'Malzahar'),
    Champion(
        name: 'Viktor',
        role: 'Mid',
        difficulty: 'Medium',
        winRate: 50.3,
        pickRate: 3.9,
        banRate: 4.7,
        championId: 'Viktor'),
    Champion(
        name: 'Akali',
        role: 'Mid',
        difficulty: 'Hard',
        winRate: 47.6,
        pickRate: 8.4,
        banRate: 19.3,
        championId: 'Akali'),

    // ADC
    Champion(
        name: 'Jinx',
        role: 'ADC',
        difficulty: 'Medium',
        winRate: 51.7,
        pickRate: 12.8,
        banRate: 8.4,
        championId: 'Jinx'),
    Champion(
        name: 'Caitlyn',
        role: 'ADC',
        difficulty: 'Medium',
        winRate: 50.8,
        pickRate: 14.2,
        banRate: 5.7,
        championId: 'Caitlyn'),
    Champion(
        name: 'Vayne',
        role: 'ADC',
        difficulty: 'Hard',
        winRate: 49.1,
        pickRate: 11.3,
        banRate: 18.9,
        championId: 'Vayne'),
    Champion(
        name: 'Ezreal',
        role: 'ADC',
        difficulty: 'Medium',
        winRate: 48.5,
        pickRate: 16.7,
        banRate: 3.2,
        championId: 'Ezreal'),
    Champion(
        name: 'Ashe',
        role: 'ADC',
        difficulty: 'Easy',
        winRate: 51.3,
        pickRate: 8.9,
        banRate: 2.8,
        championId: 'Ashe'),
    Champion(
        name: 'Kai\'Sa',
        role: 'ADC',
        difficulty: 'Hard',
        winRate: 49.9,
        pickRate: 13.4,
        banRate: 12.6,
        championId: 'Kaisa'),
    Champion(
        name: 'Jhin',
        role: 'ADC',
        difficulty: 'Medium',
        winRate: 50.4,
        pickRate: 15.8,
        banRate: 6.3,
        championId: 'Jhin'),
    Champion(
        name: 'Lucian',
        role: 'ADC',
        difficulty: 'Medium',
        winRate: 49.6,
        pickRate: 9.7,
        banRate: 7.1,
        championId: 'Lucian'),
    Champion(
        name: 'Miss Fortune',
        role: 'ADC',
        difficulty: 'Easy',
        winRate: 52.1,
        pickRate: 10.2,
        banRate: 4.5,
        championId: 'MissFortune'),
    Champion(
        name: 'Draven',
        role: 'ADC',
        difficulty: 'Hard',
        winRate: 49.8,
        pickRate: 6.4,
        banRate: 11.7,
        championId: 'Draven'),

    // Support
    Champion(
        name: 'Thresh',
        role: 'Support',
        difficulty: 'Hard',
        winRate: 49.7,
        pickRate: 18.3,
        banRate: 15.2,
        championId: 'Thresh'),
    Champion(
        name: 'Blitzcrank',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 52.1,
        pickRate: 12.6,
        banRate: 28.4,
        championId: 'Blitzcrank'),
    Champion(
        name: 'Lux',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 50.9,
        pickRate: 14.7,
        banRate: 8.9,
        championId: 'Lux'),
    Champion(
        name: 'Morgana',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 51.4,
        pickRate: 11.2,
        banRate: 12.8,
        championId: 'Morgana'),
    Champion(
        name: 'Leona',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 52.3,
        pickRate: 9.8,
        banRate: 6.7,
        championId: 'Leona'),
    Champion(
        name: 'Pyke',
        role: 'Support',
        difficulty: 'Hard',
        winRate: 48.6,
        pickRate: 8.4,
        banRate: 22.1,
        championId: 'Pyke'),
    Champion(
        name: 'Nautilus',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 51.8,
        pickRate: 7.3,
        banRate: 9.4,
        championId: 'Nautilus'),
    Champion(
        name: 'Braum',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 50.7,
        pickRate: 5.9,
        banRate: 3.8,
        championId: 'Braum'),
    Champion(
        name: 'Yuumi',
        role: 'Support',
        difficulty: 'Easy',
        winRate: 47.3,
        pickRate: 8.1,
        banRate: 31.2,
        championId: 'Yuumi'),
    Champion(
        name: 'Senna',
        role: 'Support',
        difficulty: 'Medium',
        winRate: 49.8,
        pickRate: 10.4,
        banRate: 7.6,
        championId: 'Senna'),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _filterController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _searchAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _searchController, curve: Curves.easeInOut),
    );
    _filterAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _filterController, curve: Curves.elasticOut),
    );

    _searchController.forward();
    _filterController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _filterController.dispose();
    super.dispose();
  }

  List<Champion> get filteredChampions {
    return champions.where((champion) {
      final matchesRole =
          selectedRole == 'All' || champion.role == selectedRole;
      final matchesSearch =
          champion.name.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesRole && matchesSearch;
    }).toList();
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

  // Theme colors
  Color get backgroundColor =>
      isDarkTheme ? const Color(0xFF0A1428) : const Color(0xFFF5F5F5);
  Color get cardColor => isDarkTheme ? const Color(0xFF1E2328) : Colors.white;
  Color get textColor => isDarkTheme ? Colors.white : Colors.black87;
  Color get subtextColor => isDarkTheme ? Colors.white70 : Colors.black54;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      color: backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Champions',
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
          actions: [
            // Theme Toggle
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey(isDarkTheme),
                    color: textColor.withOpacity(0.7),
                    size: 24,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
                padding: const EdgeInsets.all(12),
              ),
            ),
            IconButton(
              icon:
                  Icon(Icons.tune, color: textColor.withOpacity(0.7), size: 24),
              onPressed: () {},
              padding: const EdgeInsets.all(12),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search Bar - Animated
            AnimatedBuilder(
              animation: _searchAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _searchAnimation.value,
                  child: Opacity(
                    opacity: _searchAnimation.value,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      height: 56,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: textColor.withOpacity(0.08)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(isDarkTheme ? 0.15 : 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search champions...',
                          hintStyle: TextStyle(
                            color: subtextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 12),
                            child: Icon(Icons.search,
                                color: subtextColor, size: 24),
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 52),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            // Role Filter - Animated
            AnimatedBuilder(
              animation: _filterAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - _filterAnimation.value)),
                  child: Opacity(
                    opacity: _filterAnimation.value,
                    child: Container(
                      height: 52,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: roles.length,
                        itemBuilder: (context, index) {
                          final role = roles[index];
                          final isSelected = selectedRole == role;
                          return AnimatedContainer(
                            duration:
                                Duration(milliseconds: 200 + (index * 50)),
                            curve: Curves.elasticOut,
                            margin: const EdgeInsets.only(right: 12),
                            child: FilterChip(
                              label: Text(
                                role,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF0A1428)
                                      : subtextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedRole = role;
                                });
                              },
                              backgroundColor: cardColor,
                              selectedColor: const Color(0xFFC89B3C),
                              side: BorderSide(
                                color: isSelected
                                    ? const Color(0xFFC89B3C)
                                    : textColor.withOpacity(0.24),
                                width: 1.5,
                              ),
                              elevation: isSelected ? 6 : 0,
                              shadowColor:
                                  const Color(0xFFC89B3C).withOpacity(0.3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            // Champions Grid - Animated
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedList(
                  initialItemCount: filteredChampions.length,
                  itemBuilder: (context, index, animation) {
                    if (index >= filteredChampions.length)
                      return const SizedBox();

                    final champion = filteredChampions[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.3),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      )),
                      child: FadeTransition(
                        opacity: animation,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildChampionCard(champion, index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChampionCard(Champion champion, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, animation, child) {
        return Transform.scale(
          scale: animation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _showChampionDetails(champion),
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 140,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: textColor.withOpacity(0.08),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(isDarkTheme ? 0.25 : 0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
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
                          child: Hero(
                            tag: 'champion-${champion.championId}',
                            child: CachedNetworkImage(
                              imageUrl: champion.imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC89B3C),
                                      Color(0xFFD4AF37)
                                    ],
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
                                    colors: [
                                      Color(0xFFC89B3C),
                                      Color(0xFFD4AF37)
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFF0A1428),
                                  size: 48,
                                ),
                              ),
                            ),
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
                                    champion.name,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          champion.role,
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
                                              champion.difficulty),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        champion.difficulty,
                                        style: TextStyle(
                                          color: getDifficultyColor(
                                              champion.difficulty),
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Stats
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildMiniStat('WIN', '${champion.winRate}%',
                                      Colors.green.shade400),
                                  _buildMiniStat(
                                      'PICK',
                                      '${champion.pickRate}%',
                                      const Color(0xFFC89B3C)),
                                  _buildMiniStat('BAN', '${champion.banRate}%',
                                      Colors.red.shade400),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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

  void _showChampionDetails(Champion champion) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: textColor.withOpacity(0.3),
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
                    // Champion Header
                    Row(
                      children: [
                        Hero(
                          tag: 'champion-${champion.championId}',
                          child: Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFFC89B3C).withOpacity(0.4),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(44),
                              child: CachedNetworkImage(
                                imageUrl: champion.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFC89B3C),
                                        Color(0xFFD4AF37)
                                      ],
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: Color(0xFF0A1428),
                                    size: 48,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFC89B3C),
                                        Color(0xFFD4AF37)
                                      ],
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: Color(0xFF0A1428),
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                champion.name,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC89B3C),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      champion.role,
                                      style: const TextStyle(
                                        color: Color(0xFF0A1428),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: getDifficultyColor(
                                          champion.difficulty),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    champion.difficulty,
                                    style: TextStyle(
                                      color: getDifficultyColor(
                                          champion.difficulty),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Stats Card
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: textColor.withOpacity(0.08)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn('Win Rate', '${champion.winRate}%',
                              Colors.green.shade400),
                          _buildVerticalDivider(),
                          _buildStatColumn('Pick Rate', '${champion.pickRate}%',
                              const Color(0xFFC89B3C)),
                          _buildVerticalDivider(),
                          _buildStatColumn('Ban Rate', '${champion.banRate}%',
                              Colors.red.shade400),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 3 Action Buttons
                    Text(
                      'Champion Rehberi',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            'Build',
                            Icons.construction_rounded,
                            Colors.blue.shade400,
                            () => _showBuildPage(champion),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionButton(
                            'Runes',
                            Icons.auto_awesome_rounded,
                            Colors.purple.shade400,
                            () => _showRunePage(champion),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionButton(
                            'Guide',
                            Icons.menu_book_rounded,
                            Colors.orange.shade400,
                            () => _showGuidePage(champion),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Favorite Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('${champion.name} favorilere eklendi!'),
                              backgroundColor: const Color(0xFFC89B3C),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        icon:
                            const Icon(Icons.favorite_border_rounded, size: 20),
                        label: const Text(
                          'Favorilere Ekle',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC89B3C),
                          foregroundColor: const Color(0xFF0A1428),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          shadowColor: const Color(0xFFC89B3C).withOpacity(0.3),
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

  Widget _buildActionButton(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated Build, Rune, Guide functions
  void _showBuildPage(Champion champion) {
    Navigator.pop(context); // Modal'ı kapat
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChampionBuildPage(
          championName: champion.name,
          championId: champion.championId,
          isDarkTheme: isDarkTheme,
        ),
      ),
    );
  }

  void _showRunePage(Champion champion) {
    Navigator.pop(context); // Modal'ı kapat
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChampionRunesPage(
          championName: champion.name,
          championId: champion.championId,
          isDarkTheme: isDarkTheme,
        ),
      ),
    );
  }

  void _showGuidePage(Champion champion) {
    Navigator.pop(context); // Modal'ı kapat
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChampionGuidePage(
          championName: champion.name,
          championId: champion.championId,
          isDarkTheme: isDarkTheme,
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            color: textColor.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 36,
      color: textColor.withOpacity(0.12),
    );
  }
}
