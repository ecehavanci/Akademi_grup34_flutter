import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';

class SliderLabelWidget extends StatefulWidget {
  var onChanged;

  SliderLabelWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SliderLabelWidgetState createState() => _SliderLabelWidgetState();
}

class _SliderLabelWidgetState extends State<SliderLabelWidget> {
  int indexTop = 0;
  double valueBottom = 20;

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: const SliderThemeData(
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderTopLabel() {
    final labels = [
      '\u{1F624}',
      '\u{1F612}',
      '\u{1F610}',
      '\u{1F642}',
      '\u{1F600}',
    ];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                final selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
            value: indexTop.toDouble(),
            min: min,
            max: max,
            divisions: divisions,
            // label: labels[indexTop],
            onChanged: (value) => onChanged(value)),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  onChanged(double value) {
    setState(() => this.indexTop = value.toInt());
    widget.onChanged = value.toInt();
    print(widget.onChanged);
  }
}

class Utils {
  static List<Widget> modelBuilder<M>(List<M> models, Widget Function(int index, M model) builder) =>
      models.asMap().map<int, Widget>((index, model) => MapEntry(index, builder(index, model))).values.toList();
}
