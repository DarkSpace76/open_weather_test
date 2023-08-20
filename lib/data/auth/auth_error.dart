const Map<String, String> authError = {
  'user-not-found':
      'Нет существующей записи пользователя, соответствующей предоставленному идентификатору',
  'invalid-password':
      'Предоставленное значение для свойства пользователя password недопустимо. Это должна быть строка, состоящая не менее чем из шести символов.',
  'wrong-password': 'Пароль недействителен или у пользователя нет пароля.',
};

String? getAuthError(String? code) {
  return authError[code];
}
