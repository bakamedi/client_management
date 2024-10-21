enum DbRecord {
  contacts(key: 'CONTACTS_RECORD');

  const DbRecord({
    required this.key,
  });
  final String key;
}
