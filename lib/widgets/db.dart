import 'package:mysql_client/mysql_client.dart';

class Db {
  static final Db _instance = Db._internal();
  factory Db() => _instance;
  Db._internal();

  MySQLConnection? _connection;

  Future<void> connect() async {
    try {
      print("Connecting to MySQL server...");
      _connection = await MySQLConnection.createConnection(
        host: '27.117.119.85',
        port: 3306,
        userName: 'user',
        password: '0000',
        databaseName: 'Chair',
      );
      await _connection!.connect();
      print("Connected to MySQL");
    } catch (e) {
      print("Error connecting to MySQL: $e");
    }
  }

  Future<void> close() async {
    if (_connection != null) {
      await _connection!.close();
      print("MySQL connection closed");
    }
  }

  // 데이터베이스에서 주소를 가져오는 함수
  Future<String?> getAddress(String userId) async {
    try {
      if (_connection == null) {
        await connect();
      }

      String query = "SELECT m_address FROM member WHERE m_id = :userId;";
      IResultSet result = await _connection!.execute(query, {"userId": userId});

      if (result.rows.isNotEmpty) {
        // 결과가 있을 경우 첫 번째 행의 "m_address" 컬럼 값을 반환
        return result.rows.first.colAt(0); // 또는 .assoc()["m_address"]
      } else {
        return null; // 결과가 없는 경우
      }
    } catch (e) {
      print("Error fetching address from MySQL: $e");
      return null;
    }
  }

  //db에 아이디 이름 비번을 입력하는 함수(member추가)
  Future<void> addUser(String id, String password, String email, String name, String birthDate, String phone) async {
    if (_connection == null) return;

    try {
      await _connection!.execute(
        'INSERT INTO member (m_id, m_pw, m_email, m_name, m_birthday, m_call) VALUES (:id, :password, :email, :name, :birthDate, :phone)',
        {
          'id': id,
          'password': password,
          'email': email,
          'name': name,
          'birthDate': birthDate,
          'phone': phone,
        },
      );
      print("User added successfully");
    } catch (e) {
      print("Error adding user: $e");
    }
  }



}
