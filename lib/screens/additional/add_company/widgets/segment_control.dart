part of add_company;

class _SegmentControl extends StatefulWidget {
  final int groupValue;
  final ValueSetter<int> groupChanged;
  const _SegmentControl({
    Key? key,
    required this.groupValue,
    required this.groupChanged,
  }) : super(key: key);

  @override
  State<_SegmentControl> createState() => __SegmentControlState();
}

class __SegmentControlState extends State<_SegmentControl> {
  // -- Build --
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      backgroundColor: Theme.of(context).own().dashboardBackground,
      thumbColor: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(8),
      groupValue: widget.groupValue,
      children: {
        0: buildSegment(text: "ИП", value: 0),
        1: buildSegment(text: "ТОО", value: 1),
        2: buildSegment(text: "АО", value: 2),
      },
      onValueChanged: (value) {
        widget.groupChanged(value as int);
      },
    );
  }

  // -- Widgets --
  Widget buildSegment({required String text, required int value}) {
    bool active = widget.groupValue == value;
    Color color = active ? Colors.white : Theme.of(context).textTheme.bodySmall!.color!;

    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }
}
