import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';

class CustomShapeScreen extends StatefulWidget {
  const CustomShapeScreen({super.key});

  @override
  State<CustomShapeScreen> createState() => _CustomShapeScreenState();
}

class _CustomShapeScreenState extends State<CustomShapeScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 키보드 자동 포커스
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _confirm() {
    final label = _controller.text.trim();
    if (label.isEmpty) return;
    context.go('/run', extra: {'mode': 'custom', 'shapeLabel': label});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'CUSTOM',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Text(
                '어떤 도형을\n그릴까요?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '달리면서 그릴 도형 이름을 입력해주세요.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 40),
              // 입력창
              _ShapeTextField(
                controller: _controller,
                focusNode: _focusNode,
                onSubmitted: (_) => _confirm(),
              ),
              const SizedBox(height: 20),
              // 예시 태그
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SuggestionChip('하트'),
                  _SuggestionChip('별'),
                  _SuggestionChip('집'),
                  _SuggestionChip('나비'),
                  _SuggestionChip('물고기'),
                  _SuggestionChip('번개'),
                ],
              ),
              const Spacer(),
              // 확인 버튼
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _controller,
                builder: (_, value, __) {
                  final enabled = value.text.trim().isNotEmpty;
                  return SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: enabled ? _confirm : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonGreen,
                        disabledBackgroundColor: AppColors.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        '러닝 시작',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: enabled
                              ? AppColors.black
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Text field ─────────────────────────────────────────────────

class _ShapeTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;

  const _ShapeTextField({
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.done,
      maxLength: 20,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      cursorColor: AppColors.neonGreen,
      decoration: InputDecoration(
        hintText: '도형 이름 입력',
        hintStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGray,
        ),
        counterStyle: const TextStyle(color: AppColors.textSecondary),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.neonGreen, width: 2),
        ),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (_, value, __) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.clear, color: AppColors.textSecondary),
                  onPressed: controller.clear,
                ),
        ),
      ),
    );
  }
}

// ── Suggestion chip ────────────────────────────────────────────

class _SuggestionChip extends StatelessWidget {
  final String label;
  const _SuggestionChip(this.label);

  @override
  Widget build(BuildContext context) {
    // 탭하면 텍스트 필드에 자동 입력
    return GestureDetector(
      onTap: () {
        // find the ancestor _CustomShapeScreenState to access controller
        final state = context
            .findAncestorStateOfType<_CustomShapeScreenState>();
        state?._controller.text = label;
        state?._controller.selection = TextSelection.fromPosition(
          TextPosition(offset: label.length),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.border),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
