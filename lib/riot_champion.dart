class RiotChampion {
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final List<String> tags;
  final String partype;
  final ChampionStats stats;

  RiotChampion({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.tags,
    required this.partype,
    required this.stats,
  });

  factory RiotChampion.fromJson(Map<String, dynamic> json) {
    return RiotChampion(
      id: json['id'] ?? '',
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      blurb: json['blurb'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      partype: json['partype'] ?? '',
      stats: ChampionStats.fromJson(json['stats'] ?? {}),
    );
  }

  // Role belirleme (tags'a göre)
  String get primaryRole {
    if (tags.contains('Tank')) return 'Support';
    if (tags.contains('Support')) return 'Support';
    if (tags.contains('Marksman')) return 'ADC';
    if (tags.contains('Assassin')) return 'Mid';
    if (tags.contains('Mage')) return 'Mid';
    if (tags.contains('Fighter')) return 'Top';
    return 'Top'; // Default
  }

  // Zorluk derecesi (stats'a göre hesaplama)
  String get difficulty {
    final avgDifficulty = (stats.attackDifficulty +
            stats.magicDifficulty +
            stats.defenseDifficulty) /
        3;
    if (avgDifficulty <= 4) return 'Easy';
    if (avgDifficulty <= 7) return 'Medium';
    return 'Hard';
  }

  // Win rate (simulated - gerçek API'de match data gerekli)
  double get simulatedWinRate {
    return 45.0 + (stats.overallRating * 10); // 45-55% arası
  }
}

class ChampionStats {
  final double hp;
  final double hpPerLevel;
  final double mp;
  final double mpPerLevel;
  final double moveSpeed;
  final double armor;
  final double armorPerLevel;
  final double spellBlock;
  final double spellBlockPerLevel;
  final double attackRange;
  final double hpRegen;
  final double hpRegenPerLevel;
  final double mpRegen;
  final double mpRegenPerLevel;
  final double crit;
  final double critPerLevel;
  final double attackDamage;
  final double attackDamagePerLevel;
  final double attackSpeedPerLevel;
  final double attackSpeed;
  final int attackDifficulty;
  final int magicDifficulty;
  final int defenseDifficulty;

  ChampionStats({
    required this.hp,
    required this.hpPerLevel,
    required this.mp,
    required this.mpPerLevel,
    required this.moveSpeed,
    required this.armor,
    required this.armorPerLevel,
    required this.spellBlock,
    required this.spellBlockPerLevel,
    required this.attackRange,
    required this.hpRegen,
    required this.hpRegenPerLevel,
    required this.mpRegen,
    required this.mpRegenPerLevel,
    required this.crit,
    required this.critPerLevel,
    required this.attackDamage,
    required this.attackDamagePerLevel,
    required this.attackSpeedPerLevel,
    required this.attackSpeed,
    required this.attackDifficulty,
    required this.magicDifficulty,
    required this.defenseDifficulty,
  });

  factory ChampionStats.fromJson(Map<String, dynamic> json) {
    return ChampionStats(
      hp: (json['hp'] ?? 0).toDouble(),
      hpPerLevel: (json['hpperlevel'] ?? 0).toDouble(),
      mp: (json['mp'] ?? 0).toDouble(),
      mpPerLevel: (json['mpperlevel'] ?? 0).toDouble(),
      moveSpeed: (json['movespeed'] ?? 0).toDouble(),
      armor: (json['armor'] ?? 0).toDouble(),
      armorPerLevel: (json['armorperlevel'] ?? 0).toDouble(),
      spellBlock: (json['spellblock'] ?? 0).toDouble(),
      spellBlockPerLevel: (json['spellblockperlevel'] ?? 0).toDouble(),
      attackRange: (json['attackrange'] ?? 0).toDouble(),
      hpRegen: (json['hpregen'] ?? 0).toDouble(),
      hpRegenPerLevel: (json['hpregenperlevel'] ?? 0).toDouble(),
      mpRegen: (json['mpregen'] ?? 0).toDouble(),
      mpRegenPerLevel: (json['mpregenperlevel'] ?? 0).toDouble(),
      crit: (json['crit'] ?? 0).toDouble(),
      critPerLevel: (json['critperlevel'] ?? 0).toDouble(),
      attackDamage: (json['attackdamage'] ?? 0).toDouble(),
      attackDamagePerLevel: (json['attackdamageperlevel'] ?? 0).toDouble(),
      attackSpeedPerLevel: (json['attackspeedperlevel'] ?? 0).toDouble(),
      attackSpeed: (json['attackspeed'] ?? 0).toDouble(),
      attackDifficulty: json['attackdifficulty'] ?? 0,
      magicDifficulty: json['magicdifficulty'] ?? 0,
      defenseDifficulty: json['defensedifficulty'] ?? 0,
    );
  }

  // Genel rating hesaplama
  double get overallRating {
    return (attackDifficulty + magicDifficulty + defenseDifficulty) /
        30.0; // 0-1 arası
  }
}

class RiotChampionDetail {
  final String id;
  final String name;
  final String title;
  final String lore;
  final List<String> allytips;
  final List<String> enemytips;
  final List<ChampionSpell> spells;
  final ChampionPassive passive;

  RiotChampionDetail({
    required this.id,
    required this.name,
    required this.title,
    required this.lore,
    required this.allytips,
    required this.enemytips,
    required this.spells,
    required this.passive,
  });

  factory RiotChampionDetail.fromJson(Map<String, dynamic> json) {
    return RiotChampionDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      lore: json['lore'] ?? '',
      allytips: List<String>.from(json['allytips'] ?? []),
      enemytips: List<String>.from(json['enemytips'] ?? []),
      spells: (json['spells'] as List? ?? [])
          .map((spell) => ChampionSpell.fromJson(spell))
          .toList(),
      passive: ChampionPassive.fromJson(json['passive'] ?? {}),
    );
  }
}

class ChampionSpell {
  final String id;
  final String name;
  final String description;
  final String tooltip;

  ChampionSpell({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
  });

  factory ChampionSpell.fromJson(Map<String, dynamic> json) {
    return ChampionSpell(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      tooltip: json['tooltip'] ?? '',
    );
  }
}

class ChampionPassive {
  final String name;
  final String description;

  ChampionPassive({
    required this.name,
    required this.description,
  });

  factory ChampionPassive.fromJson(Map<String, dynamic> json) {
    return ChampionPassive(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
