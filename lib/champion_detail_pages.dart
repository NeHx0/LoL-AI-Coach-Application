import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Champion Build Data Models
class ChampionBuild {
  final String name;
  final List<BuildItem> coreItems;
  final List<BuildItem> boots;
  final List<BuildItem> situationalItems;
  final String startingItems;
  final String skillOrder;
  final String gamePhase;

  ChampionBuild({
    required this.name,
    required this.coreItems,
    required this.boots,
    required this.situationalItems,
    required this.startingItems,
    required this.skillOrder,
    required this.gamePhase,
  });
}

class BuildItem {
  final String name;
  final String iconUrl;
  final int cost;
  final String description;

  BuildItem({
    required this.name,
    required this.iconUrl,
    required this.cost,
    required this.description,
  });
}

class RunePage {
  final String name;
  final String primaryTree;
  final String secondaryTree;
  final List<String> primaryRunes;
  final List<String> secondaryRunes;
  final List<String> statShards;
  final String description;

  RunePage({
    required this.name,
    required this.primaryTree,
    required this.secondaryTree,
    required this.primaryRunes,
    required this.secondaryRunes,
    required this.statShards,
    required this.description,
  });
}

class ChampionGuide {
  final String laning;
  final String teamFight;
  final String combos;
  final String tips;
  final String counters;
  final String synergies;

  ChampionGuide({
    required this.laning,
    required this.teamFight,
    required this.combos,
    required this.tips,
    required this.counters,
    required this.synergies,
  });
}

class ChampionDetailService {
  static ChampionBuild getBuildForChampion(String championId) {
    switch (championId.toLowerCase()) {
      case 'darius':
        return ChampionBuild(
          name: 'Darius Tank Build',
          coreItems: [
            BuildItem(
                name: 'Stridebreaker',
                iconUrl: '',
                cost: 3300,
                description: 'Mobility + Damage'),
            BuildItem(
                name: 'Dead Man\'s Plate',
                iconUrl: '',
                cost: 2900,
                description: 'Armor + Speed'),
            BuildItem(
                name: 'Force of Nature',
                iconUrl: '',
                cost: 2900,
                description: 'Magic Resist'),
            BuildItem(
                name: 'Sterak\'s Gage',
                iconUrl: '',
                cost: 3100,
                description: 'Shield + AD'),
          ],
          boots: [
            BuildItem(
                name: 'Plated Steelcaps',
                iconUrl: '',
                cost: 1100,
                description: 'vs AD teams'),
            BuildItem(
                name: 'Mercury\'s Treads',
                iconUrl: '',
                cost: 1100,
                description: 'vs AP/CC teams'),
          ],
          situationalItems: [
            BuildItem(
                name: 'Thornmail',
                iconUrl: '',
                cost: 2700,
                description: 'vs Healing'),
            BuildItem(
                name: 'Gargoyle Stoneplate',
                iconUrl: '',
                cost: 3200,
                description: 'Team fights'),
          ],
          startingItems: 'Doran\'s Blade + Health Potion',
          skillOrder: 'Q > E > W (Max Q first)',
          gamePhase: 'Early Game',
        );

      case 'jinx':
        return ChampionBuild(
          name: 'Jinx Crit Build',
          coreItems: [
            BuildItem(
                name: 'Kraken Slayer',
                iconUrl: '',
                cost: 3400,
                description: 'DPS Mythic'),
            BuildItem(
                name: 'Runaan\'s Hurricane',
                iconUrl: '',
                cost: 2600,
                description: 'AoE + Attack Speed'),
            BuildItem(
                name: 'Infinity Edge',
                iconUrl: '',
                cost: 3400,
                description: 'Crit Damage'),
            BuildItem(
                name: 'Lord Dominik\'s Regards',
                iconUrl: '',
                cost: 3000,
                description: 'Armor Pen'),
          ],
          boots: [
            BuildItem(
                name: 'Berserker\'s Greaves',
                iconUrl: '',
                cost: 1100,
                description: 'Attack Speed'),
          ],
          situationalItems: [
            BuildItem(
                name: 'Guardian Angel',
                iconUrl: '',
                cost: 2800,
                description: 'Resurrection'),
            BuildItem(
                name: 'Mortal Reminder',
                iconUrl: '',
                cost: 3000,
                description: 'vs Healing'),
          ],
          startingItems: 'Doran\'s Blade + Health Potion',
          skillOrder: 'Q > W > E (Max Q first)',
          gamePhase: 'Late Game',
        );

      default:
        return ChampionBuild(
          name: 'Standard Build',
          coreItems: [
            BuildItem(
                name: 'Core Item 1',
                iconUrl: '',
                cost: 3000,
                description: 'Main damage item'),
            BuildItem(
                name: 'Core Item 2',
                iconUrl: '',
                cost: 2800,
                description: 'Secondary item'),
            BuildItem(
                name: 'Core Item 3',
                iconUrl: '',
                cost: 3200,
                description: 'Utility item'),
          ],
          boots: [
            BuildItem(
                name: 'Standard Boots',
                iconUrl: '',
                cost: 1100,
                description: 'Most situations'),
          ],
          situationalItems: [
            BuildItem(
                name: 'Situational 1',
                iconUrl: '',
                cost: 2700,
                description: 'vs specific matchups'),
          ],
          startingItems: 'Doran\'s Item + Potion',
          skillOrder: 'Q > W > E',
          gamePhase: 'Mid Game',
        );
    }
  }

  static RunePage getRunesForChampion(String championId) {
    switch (championId.toLowerCase()) {
      case 'darius':
        return RunePage(
          name: 'Conqueror Darius',
          primaryTree: 'Precision',
          secondaryTree: 'Resolve',
          primaryRunes: [
            'Conqueror',
            'Triumph',
            'Legend: Tenacity',
            'Last Stand'
          ],
          secondaryRunes: ['Bone Plating', 'Overgrowth'],
          statShards: ['Attack Speed', 'Adaptive Force', 'Health'],
          description:
              'Extended trade focused build for lane dominance and team fights.',
        );

      case 'jinx':
        return RunePage(
          name: 'Lethal Tempo Jinx',
          primaryTree: 'Precision',
          secondaryTree: 'Inspiration',
          primaryRunes: [
            'Lethal Tempo',
            'Presence of Mind',
            'Legend: Bloodline',
            'Cut Down'
          ],
          secondaryRunes: ['Biscuit Delivery', 'Approach Velocity'],
          statShards: ['Attack Speed', 'Adaptive Force', 'Health'],
          description: 'Maximum DPS build for team fights and objectives.',
        );

      case 'yasuo':
        return RunePage(
          name: 'Conqueror Yasuo',
          primaryTree: 'Precision',
          secondaryTree: 'Resolve',
          primaryRunes: [
            'Conqueror',
            'Triumph',
            'Legend: Alacrity',
            'Last Stand'
          ],
          secondaryRunes: ['Bone Plating', 'Overgrowth'],
          statShards: ['Attack Speed', 'Adaptive Force', 'Health'],
          description: 'Sustain focused build for extended fights.',
        );

      default:
        return RunePage(
          name: 'Standard Runes',
          primaryTree: 'Precision',
          secondaryTree: 'Domination',
          primaryRunes: [
            'Press the Attack',
            'Triumph',
            'Legend: Alacrity',
            'Coup de Grace'
          ],
          secondaryRunes: ['Sudden Impact', 'Ravenous Hunter'],
          statShards: ['Attack Speed', 'Adaptive Force', 'Health'],
          description: 'Balanced rune page for most situations.',
        );
    }
  }

  static ChampionGuide getGuideForChampion(
      String championId, String championName) {
    switch (championId.toLowerCase()) {
      case 'darius':
        return ChampionGuide(
          laning:
              'Early Game: Level 1\'de Q al ve minion\'lara vururken düşmanı da vur. Level 2\'de E al ve Q+E combo\'su yap. Mana\'nı dikkatli kullan, W pahalı bir skill. Düşman yaklaştığında Q\'nun dış kısmıyla vur (heal + daha fazla hasar). Level 6\'da ulti ile kill potansiyelin çok yüksek.',
          teamFight:
              'Pozisyonlama: Front line\'da dur, tank rolünü üstlen. Düşman carry\'lerini hedefle ama acele etme. Q\'nun AoE\'sini maksimize et. Combo: E (çek) → W (slow) → Q (heal) → AA → Ulti. Reset aldıktan sonra bir sonraki hedefi bul.',
          combos:
              'Temel Combo: E → W → Q → AA\nKill Combo: Flash → E → W → Q → AA → R\nLane Trading: Q (dış kısım) → AA → W → E (kaçarken)\nTeam Fight: E (multiple targets) → Q → W → R → Reset → R',
          tips:
              'Q\'nun dış kısmı daha fazla hasar verir ve heal eder. E\'yi sadece kill için değil, kaçış için de kullan. Bleed stack\'leri gözünden kaçırma (5 stack = AD bonus). Ulti\'yi çok erken atma, düşman kaçabilir.',
          counters:
              'Zor Matchup\'lar: Teemo (Range avantajı), Quinn (Mobility), Vayne (%true damage). Counter Strategy: Jungle yardımı iste, Defensive item\'lar al, Farm\'a odaklan.',
          synergies:
              'İyi Takım Arkadaşları: Orianna (Ulti combo), Jarvan IV (Ulti sync), Yuumi (Heal + speed boost), Lulu (Polymorph + ulti). Bot Priority: Jinx, Kog\'Maw gibi late game carry\'ler.',
        );

      case 'jinx':
        return ChampionGuide(
          laning:
              'Early Game: Q Minigun ile CS al, mana tasarrufu yap. Rocket launcher ile poke yap ama mana dikkat. Level 2\'de W al, stun combo için. Support ile koordineli hareket et. Düşman engage\'den kaçınmak için arkada dur.',
          teamFight:
              'Pozisyonlama: En arkada dur, maximum range\'den vur. Rocket launcher ile AoE prioritize et. Get Excited! proc\'u ile reposition yap. Target Priority: 1. En yakın düşman 2. Low HP targets 3. Carry\'ler',
          combos:
              'Poke Combo: Q (Rocket) → W → AA\nAll-in Combo: W → Q (Minigun) → AA spam → E (zone) → R (execute)\nTeam Fight: Q (Rocket) → W (slow) → E (zone control) → R (AoE)',
          tips:
              'Rocket\'lar mana yer, dikkatli kullan. Get Excited! proc\'u ile kaçış/chase yap. W\'yu wall check için kullanabilirsin. Ulti global, diğer lane\'leri de destekle. E\'yu bush control için koy.',
          counters:
              'Zor Matchup\'lar: Draven (Early game baskısı), Lucian (Burst damage), Caitlyn (Range avantajı). Counter Strategy: Defensive farming yap, Support peel\'i iste, Late game\'e odaklan.',
          synergies:
              'İyi Support\'lar: Lulu (Polymorph + speed), Nami (Heal + CC chain), Thresh (Hook + lantern), Braum (Tank + stun). Team Comp: Front line tank\'lar gerekli.',
        );

      default:
        return ChampionGuide(
          laning:
              'Early Game Strategy: Focus on farming and trading efficiently. Watch for enemy cooldowns and punish mistakes. Ward key areas to avoid ganks. Look for opportunities to roam if ahead.',
          teamFight:
              'Team Fighting: Position based on your role. Focus priority targets. Use abilities at optimal times. Stay alive to maximize DPS. Stay within range of team support.',
          combos:
              'Basic Combo: Ability 1 → Auto Attack → Ability 2\nAdvanced Combo: Flash → Full Combo → Ultimate\nTrade Pattern: Ability → AA → Retreat',
          tips:
              'Practice last-hitting minions. Learn enemy cooldowns. Ward important areas. Communicate with team. Focus on objectives. Improve map awareness.',
          counters:
              'Difficult Matchups: High mobility champions, Champions with crowd control, Early game bullies. How to Play: Play defensively, Ask for jungle help, Focus on farming.',
          synergies:
              'Good Teammates: Champions with crowd control, Tank/front line champions, Support champions, AOE damage dealers. Team Strategy: Group for objectives.',
        );
    }
  }
}

// Build Page Widget
class ChampionBuildPage extends StatelessWidget {
  final String championName;
  final String championId;
  final bool isDarkTheme;

  const ChampionBuildPage({
    super.key,
    required this.championName,
    required this.championId,
    required this.isDarkTheme,
  });

  Color get backgroundColor =>
      isDarkTheme ? const Color(0xFF0A1428) : const Color(0xFFF5F5F5);
  Color get cardColor => isDarkTheme ? const Color(0xFF1E2328) : Colors.white;
  Color get textColor => isDarkTheme ? Colors.white : Colors.black87;
  Color get subtextColor => isDarkTheme ? Colors.white70 : Colors.black54;

  @override
  Widget build(BuildContext context) {
    final build = ChampionDetailService.getBuildForChampion(championId);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          '$championName Build',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: cardColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Build Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFC89B3C), Color(0xFFD4AF37)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.construction_rounded,
                      size: 48, color: Colors.black87),
                  const SizedBox(height: 12),
                  Text(
                    build.name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Power Spike: ${build.gamePhase}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Starting Build
            _buildSection(
              'Starting Items',
              Icons.play_arrow_rounded,
              Colors.green.shade400,
              [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.green.shade400.withOpacity(0.3)),
                  ),
                  child: Text(
                    build.startingItems,
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Core Items
            _buildSection(
              'Core Items',
              Icons.star_rounded,
              const Color(0xFFC89B3C),
              build.coreItems.map((item) => _buildItemCard(item)).toList(),
            ),

            const SizedBox(height: 20),

            // Boots
            _buildSection(
              'Boots Options',
              Icons.directions_run_rounded,
              Colors.blue.shade400,
              build.boots.map((item) => _buildItemCard(item)).toList(),
            ),

            const SizedBox(height: 20),

            // Situational Items
            _buildSection(
              'Situational Items',
              Icons.psychology_rounded,
              Colors.purple.shade400,
              build.situationalItems
                  .map((item) => _buildItemCard(item))
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Skill Order
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: textColor.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.trending_up_rounded,
                          color: Colors.orange.shade400),
                      const SizedBox(width: 12),
                      Text(
                        'Skill Order',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    build.skillOrder,
                    style: TextStyle(
                      color: subtextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, IconData icon, Color color, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildItemCard(BuildItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withOpacity(0.1)),
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
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                const Icon(Icons.inventory_2_rounded, color: Color(0xFF0A1428)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.description,
                  style: TextStyle(
                    color: subtextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade400,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${item.cost}g',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Runes Page Widget
class ChampionRunesPage extends StatelessWidget {
  final String championName;
  final String championId;
  final bool isDarkTheme;

  const ChampionRunesPage({
    super.key,
    required this.championName,
    required this.championId,
    required this.isDarkTheme,
  });

  Color get backgroundColor =>
      isDarkTheme ? const Color(0xFF0A1428) : const Color(0xFFF5F5F5);
  Color get cardColor => isDarkTheme ? const Color(0xFF1E2328) : Colors.white;
  Color get textColor => isDarkTheme ? Colors.white : Colors.black87;
  Color get subtextColor => isDarkTheme ? Colors.white70 : Colors.black54;

  @override
  Widget build(BuildContext context) {
    final runes = ChampionDetailService.getRunesForChampion(championId);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          '$championName Runes',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: cardColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Runes Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade400, Colors.purple.shade600],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.auto_awesome_rounded,
                      size: 48, color: Colors.white),
                  const SizedBox(height: 12),
                  Text(
                    runes.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    runes.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Primary Tree
            _buildRuneTree(
              runes.primaryTree,
              runes.primaryRunes,
              Colors.amber.shade400,
              true,
            ),

            const SizedBox(height: 20),

            // Secondary Tree
            _buildRuneTree(
              runes.secondaryTree,
              runes.secondaryRunes,
              Colors.blue.shade400,
              false,
            ),

            const SizedBox(height: 20),

            // Stat Shards
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: textColor.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.show_chart_rounded,
                          color: Colors.green.shade400),
                      const SizedBox(width: 12),
                      Text(
                        'Stat Shards',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: runes.statShards
                        .map((stat) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.green.shade400.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        Colors.green.shade400.withOpacity(0.4)),
                              ),
                              child: Text(
                                stat,
                                style: TextStyle(
                                  color: Colors.green.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuneTree(
      String treeName, List<String> runes, Color color, bool isPrimary) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isPrimary ? Icons.star_rounded : Icons.star_border_rounded,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$treeName Tree ${isPrimary ? '(Primary)' : '(Secondary)'}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...runes
              .map((rune) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child:
                              Icon(Icons.auto_awesome, color: color, size: 16),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          rune,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

// Guide Page Widget
class ChampionGuidePage extends StatelessWidget {
  final String championName;
  final String championId;
  final bool isDarkTheme;

  const ChampionGuidePage({
    super.key,
    required this.championName,
    required this.championId,
    required this.isDarkTheme,
  });

  Color get backgroundColor =>
      isDarkTheme ? const Color(0xFF0A1428) : const Color(0xFFF5F5F5);
  Color get cardColor => isDarkTheme ? const Color(0xFF1E2328) : Colors.white;
  Color get textColor => isDarkTheme ? Colors.white : Colors.black87;
  Color get subtextColor => isDarkTheme ? Colors.white70 : Colors.black54;

  @override
  Widget build(BuildContext context) {
    final guide =
        ChampionDetailService.getGuideForChampion(championId, championName);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          '$championName Guide',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: cardColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Guide Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.orange.shade600],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.menu_book_rounded,
                      size: 48, color: Colors.white),
                  const SizedBox(height: 12),
                  Text(
                    '$championName Rehberi',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'Detaylı oynanış rehberi ve stratejiler',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Laning Phase
            _buildGuideSection(
              'Laning Phase',
              Icons.agriculture_rounded,
              Colors.green.shade400,
              guide.laning,
            ),

            const SizedBox(height: 20),

            // Team Fighting
            _buildGuideSection(
              'Team Fighting',
              Icons.groups_rounded,
              Colors.blue.shade400,
              guide.teamFight,
            ),

            const SizedBox(height: 20),

            // Combos
            _buildGuideSection(
              'Combos & Mechanics',
              Icons.flash_on_rounded,
              Colors.purple.shade400,
              guide.combos,
            ),

            const SizedBox(height: 20),

            // Tips & Tricks
            _buildGuideSection(
              'Tips & Tricks',
              Icons.lightbulb_rounded,
              Colors.amber.shade400,
              guide.tips,
            ),

            const SizedBox(height: 20),

            // Counters
            _buildGuideSection(
              'Counters & Matchups',
              Icons.shield_rounded,
              Colors.red.shade400,
              guide.counters,
            ),

            const SizedBox(height: 20),

            // Synergies
            _buildGuideSection(
              'Team Synergies',
              Icons.favorite_rounded,
              Colors.pink.shade400,
              guide.synergies,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideSection(
      String title, IconData icon, Color color, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(
              color: subtextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
