import 'package:mysql_client/mysql_client.dart';

class DatabaseHelper {
  // Singleton 패턴으로 단일 인스턴스 유지
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  MySQLConnection? _connection; // 데이터베이스 연결을 저장할 변수

  // 데이터베이스에 연결하는 함수
  Future<void> connect() async {
    try {
      print("Connecting to MySQL server...");
      _connection = await MySQLConnection.createConnection(
        host: 'your_host',
        port: 3306, // 사용 중인 MySQL의 포트 번호
        userName: 'your_username',
        password: 'your_password',
        databaseName: 'testdb', // optional
      );
      await _connection!.connect();
      print("Connected to MySQL");
    } catch (e) {
      print("Error connecting to MySQL: $e");
    }
  }

  // 데이터베이스 연결을 닫는 함수
  Future<void> close() async {
    if (_connection != null) {
      await _connection!.close();
      print("MySQL connection closed");
    }
  }

// 다른 데이터베이스 관련 함수들도 여기에 추가할 수 있습니다.
}
