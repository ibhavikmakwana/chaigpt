import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChaiGPTApp());
}

class ChaiGPTApp extends StatelessWidget {
  const ChaiGPTApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Defines the Cozy Cafe Theme
    final textTheme = GoogleFonts.poppinsTextTheme();
    return MaterialApp(
      title: 'ChaiGPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.orange[50], // Creamy background
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown[700]!,
          primary: Colors.brown[700]!,
          secondary: Colors.orange[800]!,
          surface: Colors.orange[50]!,
        ),
        textTheme: textTheme.apply(
          bodyColor: Colors.brown[900],
          displayColor: Colors.brown[900],
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.white,
          selectedColor: Colors.orange[200],
          labelStyle: textTheme.bodyMedium?.copyWith(color: Colors.brown[800]),
          secondaryLabelStyle: textTheme.bodyMedium?.copyWith(
            color: Colors.brown[900],
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.all(12),
          side: BorderSide.none,
          elevation: 2,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.brown.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Data Model
class Recommendation {
  final String mood;
  final String emoji;
  final String chai;
  final String snack;
  final String reason;

  const Recommendation(
    this.mood,
    this.emoji,
    this.chai,
    this.snack,
    this.reason,
  );
}

// Hardcoded Data
const List<Recommendation> recommendations = [
  Recommendation(
    "Stressed",
    "😫",
    "Strong Masala Chai",
    "Bun Maska",
    "Melt the pressure away.",
  ),
  Recommendation(
    "Rainy",
    "🌧️",
    "Adrak (Ginger) Chai",
    "Hot Pakoras",
    "The ultimate monsoon combo.",
  ),
  Recommendation(
    "Sleepy",
    "😴",
    "Kadak Cutting Chai",
    "Indori Poha",
    "Instant energy boost.",
  ),
  Recommendation(
    "Happy",
    "😊",
    "Elaichi Chai",
    "Jalebi",
    "Sweet treats for good vibes.",
  ),
  Recommendation(
    "Heartbroken",
    "💔",
    "Tandoori Chai",
    "Sutta (Just kidding, Maggie)",
    "Warmth for the cold heart.",
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Recommendation? selectedMood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "☕️ ChaiGPT",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),

              Text(
                "Debug your mood",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.brown[400],
                  fontStyle: FontStyle.italic,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

              const SizedBox(height: 40),

              // Mood Section Title
              Text(
                "How are you feeling?",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 16),

              // Mood Chips
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendations.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = recommendations[index];
                    final isSelected = selectedMood == item;
                    return ChoiceChip(
                          label: Text("${item.emoji} ${item.mood}"),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              selectedMood = selected ? item : null;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: (300 + index * 100).ms)
                        .slideX(begin: 0.2);
                  },
                ),
              ),

              const Spacer(),

              // Recommendation Area
              if (selectedMood != null)
                Center(
                  child:
                      Card(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Recommended Pairing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: Colors.orange[800],
                                          letterSpacing: 1.2,
                                        ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    selectedMood!.chai,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown[900],
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "+",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    selectedMood!.snack,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: Colors.brown[700]),
                                  ),
                                  const SizedBox(height: 32),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange[50],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "\"${selectedMood!.reason}\"",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.brown[600],
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .animate(key: ValueKey(selectedMood))
                          .fadeIn(duration: 500.ms)
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            curve: Curves.easeOutBack,
                          ),
                ),

              if (selectedMood == null)
                Center(
                  child: Text(
                    "Select a mood to get started...",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.black26),
                  ),
                ).animate().fadeIn(delay: 600.ms),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
