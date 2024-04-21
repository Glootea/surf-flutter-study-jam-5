// These imports are necessary to open the sqlite3 database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Offset, Color;
import 'package:meme_generator/entity/label_struct.dart';
import 'package:meme_generator/entity/meme_struct.dart';
import 'package:meme_generator/data/screenshot_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
part 'database.g.dart';

// ... the TodoItems table definition stays the same
class Memes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get imagePath => text()();
  TextColumn get previewPath => text()();
}

class LabelsOnMeme extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
  RealColumn get x => real()();
  RealColumn get y => real()();
  IntColumn get color => integer()();
  RealColumn get scale => real()();
  IntColumn get memeId => integer().references(Memes, #id)();
}

@DriftDatabase(tables: [Memes, LabelsOnMeme])
class MemeDatabase extends _$MemeDatabase {
  MemeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (kDebugMode) {
          await delete(memes).go();
          await delete(labelsOnMeme).go();
          print("Cleaned");
          await m.createAll();
        }
      },
    );
  }

  Future<void> addMeme(String imagePath, String cachedPreviewPath) async {
    await into(memes).insert(MemesCompanion.insert(imagePath: imagePath, previewPath: cachedPreviewPath));
  }

  Future<void> updateMemeLabels(MemeStruct meme, {Offset? size}) async {
    await (into(memes)).insert(
        MemesCompanion.insert(
            id: Value(meme.id),
            imagePath: meme.url,
            previewPath: await ScreenshotMaker.getCachedImagePath(meme.url,
                labels: meme.labels, size: size ?? const Offset(200, 200))),
        mode: InsertMode.insertOrReplace);

    await Future.wait(meme.labels.map((element) async => await updateLabel(element, meme.id)));
  }

  Future<void> deleteMeme(int id) async {
    await (delete(memes)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> addLabel(int memeId, String label, Offset offset, Color color, double scale) async {
    return into(labelsOnMeme).insert(LabelsOnMemeCompanion.insert(
        memeId: memeId, label: label, x: offset.dx, y: offset.dy, color: color.value, scale: scale));
  }

  Future<void> updateLabel(LabelStruct label, int memeID) async {
    (into(labelsOnMeme)).insert(
        LabelsOnMemeCompanion(
          id: Value(label.id),
          memeId: Value(memeID),
          label: Value(label.text),
          x: Value(label.offset.dx),
          y: Value(label.offset.dy),
          color: Value(label.color.value),
          scale: Value(label.scale),
        ),
        mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteLabel(int id) async {
    await (delete(labelsOnMeme)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<MemeStruct>> getAllMemes() async {
    final result = <MemeStruct>[];
    final memeList = await select(memes).get();
    for (final meme in memeList) {
      final labels = await (select(labelsOnMeme)..where((tbl) => tbl.memeId.equals(meme.id))).get().then((value) =>
          value
              .map((label) =>
                  LabelStruct(label.id, label.label, Offset(label.x, label.y), Color(label.color), label.scale))
              .toList());
      result.add(MemeStruct(meme.id, meme.imagePath, meme.previewPath, labels));
    }
    print("Got memes");
    return result;
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
