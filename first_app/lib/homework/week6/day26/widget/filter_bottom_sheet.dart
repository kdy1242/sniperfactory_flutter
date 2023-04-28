import 'package:flutter/material.dart';

// 필터링 옵션
enum TodoFilter { all, completed, incompleted }

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet(
      {Key? key, required this.filter, required this.onApply})
      : super(key: key);
  final TodoFilter filter;            // 현재 선택된 필터링 옵션 저장
  final Function(TodoFilter) onApply; // 선택된 필터링 옵션 적용

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  onApply(TodoFilter filter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Filter applied: $filter'),
      ),
    );
    widget.onApply(filter);   // 선택된 필터링 옵션 적용
    Navigator.pop(context);   // bottom sheet 닫기
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('All'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.all,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.all);
              },
            ),
          ),
          ListTile(
            title: const Text('Completed'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.completed,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.completed);
              },
            ),
          ),
          ListTile(
            title: const Text('InCompleted'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.incompleted,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.incompleted);
              },
            ),
          ),
        ],
      ),
    );
  }
}