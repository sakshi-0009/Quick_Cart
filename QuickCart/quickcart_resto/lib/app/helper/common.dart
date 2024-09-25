part of 'helper.dart';

class Common {
  Common();

  ///Return a INR format
  static String formatMoney(dynamic number) {
    if(number == null) return '';

    if(number is String) {
      number = double.tryParse(number);
    }
    if(number is int) {
      number = double.parse(number.toString());
    }
    final oCcy = NumberFormat("#,##0");
    return oCcy.format(number);
  }
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###");
      int num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
