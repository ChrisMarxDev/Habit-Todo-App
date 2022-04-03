import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';
import 'package:mindful/models/daily/complete_daily_input.dart';
import 'package:mindful/models/daily/streak_entry.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

const userCollection = 'users';
const routinesCollection = 'routines';
const routinesDocument = 'routine';

const dailyEntriesCollection = 'dailyEntries';

const streakCollection = 'dailyEntryStreaks';
const streakDocument = 'dailyEntryStreak';

@injectable
@singleton
class FirestoreManager {
  final FirebaseFirestore firestore;

  // unclean shared pref in lower level repo, only short cut for now
  final SharedPreferencesRepository sharedPref;

  String get userId => sharedPref.getUserId();

  // String get userId => "JNMKu65PSggQ9ab98gbJmIpXnGM2";

  FirestoreManager({required this.sharedPref, required this.firestore});

  // GROUPS
  CollectionReference<CompleteDailyInput> dailyInput() => firestore
      .collection(userCollection)
      .doc(userId)
      .collection(dailyEntriesCollection)
      .withConverter<CompleteDailyInput>(
        fromFirestore: (snapshot, _) {
          return CompleteDailyInput.fromJson(snapshot.data()!);
        },
        toFirestore: (entry, _) => entry.toJson(),
      );

  Future<CompleteDailyInput?> getCompleteEntryMapForDate(DateTime date) async {
    final response = await dailyInput().doc(date.toDocId()).get();
    return response.data();
  }

  Future<List<CompleteDailyInput>> getAllCompleteEntryMap() async {
    final response = await dailyInput().orderBy('date', descending: true).get();
    return response.docs
        .where((element) => element.exists)
        .map((e) => e.data())
        .toList();
  }

  Future<List<CompleteDailyInput>> getCompleteEntryMapUntil(
    DateTime date,
  ) async {
    final response = await dailyInput()
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(date))
        .orderBy('date', descending: false)
        .get();
    return response.docs
        .where((element) => element.exists)
        .map((e) => e.data())
        .toList();
  }

  Future<void> setCompleteEntryMap(CompleteDailyInput entries) async {
    await dailyInput().doc(entries.date.toDocId()).set(entries);
  }

  //___________________ ROUTINE________________________

  CollectionReference<CompleteRoutine> routineReference() => firestore
      .collection(userCollection)
      .doc(userId)
      .collection(routinesCollection)
      .withConverter<CompleteRoutine>(
        fromFirestore: (snapshot, _) {
          return CompleteRoutine.fromJson(snapshot.data()!);
        },
        toFirestore: (entry, _) => entry.toJson(),
      );

  Future<CompleteRoutine?> getRoutine() async {
    final response = await routineReference().doc(routinesDocument).get();
    return response.data();
  }

  Future<void> setRoutine(CompleteRoutine routine) async {
    await routineReference().doc(routinesDocument).set(routine);
  }

  // _________________ Entry Streak _____________________

  DocumentReference streakReference() => firestore
          .collection(userCollection)
          .doc(userId)
          .collection(streakCollection)
          .doc(streakDocument)
          .withConverter<Map<String, StreakEntry>>(
        fromFirestore: (snapshot, options) {
          if (!snapshot.exists) {
            return <String, StreakEntry>{};
          } else {
            // ignore: cast_nullable_to_non_nullable
            final value = snapshot.data() as Map<String, dynamic>;
            return value.map<String, StreakEntry>(
              (key, dynamic value) => MapEntry(
                key,
                StreakEntry.fromJson(value as Map<String, dynamic>),
              ),
            );
          }
        },
        toFirestore: (value, options) {
          return value.map(
            (key, value) => MapEntry(
              key,
              value.toJson(),
            ),
          );
        },
      );

  Future<Map<String, StreakEntry>> getStreakMap() async {
    final streakSnapshot = await streakReference().get();
    final data = streakSnapshot.exists
        ? streakSnapshot.data()!
        : <String, StreakEntry>{};
    return data as Map<String, StreakEntry>;
  }

  Future<void> setStreakForId(StreakEntry streak) async {
    return streakReference().set(
      {
        streak.entryId: streak,
      },
      SetOptions(
        merge: true,
      ),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void toggleNetwork(bool isNetworkActive) {
    isNetworkActive ? firestore.enableNetwork() : firestore.disableNetwork();
  }
}
