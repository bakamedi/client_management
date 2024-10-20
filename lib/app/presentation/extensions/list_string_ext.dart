extension ListStringExt on List<String> {
  String formatNames() {
    if (isEmpty) return '';

    if (length == 1) {
      return this[0];
    } else if (length == 2) {
      return '${this[0]} y ${this[1]}';
    } else {
      var formatted = join(', '); // Une todos los elementos con ', '
      var lastCommaIndex = formatted.lastIndexOf(', ');
      formatted = formatted.replaceRange(
        lastCommaIndex,
        lastCommaIndex + 2,
        ' y ', // Reemplaza la última coma con ' y '
      );
      return formatted;
    }
  }
}
