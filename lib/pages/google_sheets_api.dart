import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // credentials from google cloud console
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "saveya",
  "private_key_id": "682baeed764b44482ff946319a93831f386ed910",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQDLsF9PYjLuJa6H\no6kuq8PAnE0ZgI3wd10DjsZjiwL045v6AjGXXeIQ7QADORnfBCHvLIYsbTBOwjOm\nxR8wk6TS12E1M+oEfaiiZvbMjyhbQV5UdHLxXIEaOxcSRzpKeCLoLBe6iJYL+r7J\nOu3aFCd9ah7hgt17JNwwd8iwUedU923BZwQKAisxPhNJ+3+QxmMzdMlA4Jq+Zfto\nQgMzLvt9jWBM/3qQiJ6ydMajo+4S4QumQxHZNvGdoCVxq0h09e958kuHvQMINvQh\nAdtzDqpIhsdAD2MJW3jyysQmAyGtEwaNUnd4QSwTEP5L4HXkbyOhl697da30Xxxr\n1VA/L+pxAgMBAAECgf8XVsjqT6uGSMsMFQn4Twt0W8nPIkEhTIwGhwA0Z7lEViWJ\nKrcuoOibsoxN0j0kpf89aIdMj+D5JUdwfyW+ayx3puDR4nZDYs1FI9x46UO2hnGd\n5mSamKmHrT2iL9x+AUX+qbljpkLgcdq/3qtiUZeKHJ7CjZF94BCwJ7Qsf+CshiO4\nJugKEwnkTwPMj/wJCkQfO9VCgk2l4XHNk1GAtTco7LToyEzCKLEhlV/xDntZjoE+\nVooH3EiiOb3jgqmeyfkiVlV8rSzjH5K8++BPVUkyLMy6BVkMdf0/D7rCdFgpAR5U\nxG5AnTgN2ON9ud2JX2anslulnSqGyt82RQwK+gECgYEA5n8rOahQfqw5giwRtYfu\n3gSlTWiAyv67lT7zKJs5qxoZU2sHbW3zka4Px+GKl0J10acW2pV6+NR8pWF1/m6Y\nFGl06GQ08tkvTeI6cRHBVHTg1S8vn5sikXfZ+QlAZvvwlrwmLUdoD1vSA8MstzNR\nUlwawB0ctD771wS3YlRuqskCgYEA4jnfDoeuFYq21f6xfv/mWCG4mnJ65abJl3et\ny12MIv9STlT5IpjCkzZawucP00RyUBq5v67KrqeaZ8sZNIVVxHaCB5TlMRUmilzT\ngf95lwbl+6bNqKRBTPHFXiD5GDyi6frlpDNducsINKwQojfELh7RL0dR4TW/yy6b\nqzBd7mkCgYAXUlCmUdBrMLPU5u6Xxnw1vJSZI3S8lU+XhzoFJseL92UOmqqyuMhH\nOixglgJ20YOoRda7IRrDKITAGv9cUgZTMmRgyxrMY4s0vyoYnKpKCFVjXJXd+U1j\nGJRWbUg141HxfnICbNIrk6fJN6tDkg6tXaJbQ9bOqfzDQbfoXBCieQKBgQCkqytK\nEEkPNSFRM0tP/kVU8XbGNX5vm7AxqNPArB9NejwW+JNAM6GuNmpqZHaIedIbrNh4\nRmsSJr2lv5hhOozrrLeJfUA3MgYTwO3UOnnvDP5q50fb8XP25iWcFrQ6iCit2AtA\nMoOOsdMPRA/3hFAwog3yNB/Npqos44g8W8CDwQKBgF6fuwuA1y+9svmcT3ZgqHnE\nzdW1jfF12igDF2zoIPlYQRBv8tjjoovmhEfnhqJrD7/dGimUfsRxWBYjH6J4NrCW\nTsMYrRV9yjVCNSryAQG0fhv4I4QpatF10CoK5OR5ziJfx3n0Mzf9lknKA1QSwjok\nS3WS+6dLuTZWI8lEcq2F\n-----END PRIVATE KEY-----\n",
  "client_email": "saveya@saveya.iam.gserviceaccount.com",
  "client_id": "115240864495117452903",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/saveya%40saveya.iam.gserviceaccount.com"
}
  ''';

  // set up & connection to the spreadsheet
  static final _spreadsheetId = '1b3UbwiYlcStmlcKkiWTDcm-svg4phZ0uECWaDtk8ldA';
  static final _gsheets = GSheets(_credentials);
  static Worksheet _worksheet;

  // variables
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialization to the spreadsheet
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('main');
    countRows();
  }

  static Future countRows() async {
    while ((await _worksheet.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // Loading of transactions
    loadTransactions();
  }

  // loading of existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // Stopping the circular loading indicator
    loading = false;
  }

  // insertion of a new transaction
  static Future insert(String name, String amount, bool _isDeposit) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isDeposit == true ? 'deposit' : 'withdraw',
    ]);
    await _worksheet.values.appendRow([
      name,
      amount,
      _isDeposit == true ? 'deposit' : 'withdraw',
    ]);
  }

  // Calculation of deposits
  static double calculateDeposits() {
    double totalDeposit = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'deposit') {
        totalDeposit += double.parse(currentTransactions[i][1]);
      }
    }
    return totalDeposit;
  }

  // Calculation of withdrawals
  static double calculateWithdrawals() {
    double totalWithdraws = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'withdraw') {
        totalWithdraws += double.parse(currentTransactions[i][1]);
      }
    }
    return totalWithdraws;
  }
}
