import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../core/di/injection.dart';
import '../../features/feed/data/datasources/feed_remote_datasource.dart';
import '../../features/running/domain/entities/run_record.dart';
import '../../features/running/domain/repositories/run_repository.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _contentCtrl = TextEditingController();
  final _runRepo = getIt<RunRepository>();
  final _dataSource = getIt<FeedRemoteDataSource>();

  List<RunRecord> _records = [];
  RunRecord? _selectedRecord;
  bool _loadingRecords = true;
  bool _posting = false;

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  @override
  void dispose() {
    _contentCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadRecords() async {
    final uid = fb.FirebaseAuth.instance.currentUser?.uid ?? '';
    if (uid.isEmpty) {
      setState(() => _loadingRecords = false);
      return;
    }
    final result = await _runRepo.getRunHistory(uid);
    result.fold(
      (_) => setState(() => _loadingRecords = false),
      (records) => setState(() {
        _records = records;
        _loadingRecords = false;
      }),
    );
  }

  Future<void> _submit() async {
    final content = _contentCtrl.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('게시글 내용을 입력해주세요.')),
      );
      return;
    }

    setState(() => _posting = true);

    try {
      final r = _selectedRecord;
      await _dataSource.postRunFeed(
        content: content,
        runRecordId: r?.id,
        mode: r?.mode,
        shapeLabel: r?.shapeLabel,
        shapeSimilarity: r?.shapeSimilarity ?? 0.0,
        distanceKm: r?.distanceKm ?? 0.0,
        durationSeconds: r?.duration.inSeconds ?? 0,
        avgPace: r?.avgPace ?? "--'--\"",
      );

      if (mounted) Navigator.of(context).pop(true); // 성공 → 피드 새로고침 트리거
    } catch (e) {
      if (mounted) {
        setState(() => _posting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('게시 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: const Text(
          '게시물 작성',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          _posting
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryOrange,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                )
              : TextButton(
                  onPressed: _submit,
                  child: const Text(
                    '게시',
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 텍스트 입력 ───────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _contentCtrl,
                  maxLines: 5,
                  style: const TextStyle(color: AppColors.white, fontSize: 15),
                  decoration: const InputDecoration(
                    hintText: '오늘의 러닝을 공유해보세요!',
                    hintStyle:
                        TextStyle(color: AppColors.textSecondary, fontSize: 15),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── 러닝 기록 첨부 ────────────────────────────────────
              const Text(
                '러닝 기록 첨부 (선택)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '아래 기록 중 하나를 선택하면 함께 게시됩니다.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 12),

              if (_loadingRecords)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                        color: AppColors.primaryOrange),
                  ),
                )
              else if (_records.isEmpty)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      '러닝 기록이 없습니다.',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _records.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) =>
                      _RecordTile(
                        record: _records[i],
                        isSelected: _selectedRecord?.id == _records[i].id,
                        onTap: () => setState(() {
                          _selectedRecord = _selectedRecord?.id == _records[i].id
                              ? null
                              : _records[i];
                        }),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── 러닝 기록 선택 타일 ───────────────────────────────────────────

class _RecordTile extends StatelessWidget {
  final RunRecord record;
  final bool isSelected;
  final VoidCallback onTap;

  const _RecordTile({
    required this.record,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dt = record.startedAt;
    final dateStr =
        '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}';
    final shapeText =
        record.shapeLabel ?? (record.mode == 'random' ? 'Random' : 'Custom');
    final modeColor =
        record.mode == 'random' ? AppColors.primaryOrange : AppColors.neonGreen;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryOrange
                : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // 선택 인디케이터
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryOrange
                      : AppColors.textSecondary,
                  width: 2,
                ),
                color: isSelected ? AppColors.primaryOrange : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: AppColors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        shapeText,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: modeColor.withValues(alpha: 0.6)),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          record.mode.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: modeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$dateStr  ·  ${record.distanceKm.toStringAsFixed(2)} km  ·  ${record.avgPace}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
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
}
