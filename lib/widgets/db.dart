import 'package:mysql_client/mysql_client.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 이름 저장용

class Db {
  static final Db _instance = Db._internal();
  factory Db() => _instance;
  Db._internal();

  MySQLConnection? _connection;

  // 데이터베이스 연결
  Future<void> connect() async {
    try {
      print("Connecting to MySQL server...");
      _connection = await MySQLConnection.createConnection(
        host: '27.117.119.85',  // MySQL 서버 호스트
        port: 3306,              // MySQL 포트
        userName: 'user',        // MySQL 사용자명
        password: '0000',        // MySQL 비밀번호
        databaseName: 'Chair',   // 데이터베이스 이름
      );
      await _connection!.connect();
      print("Connected to MySQL");
    } catch (e) {
      print("Error connecting to MySQL: $e");
    }
  }

  // 데이터베이스 연결 종료
  Future<void> close() async {
    if (_connection != null) {
      await _connection!.close();
      print("MySQL connection closed");
      _connection = null;
    }
  }

  // db에 회원 가입을 하는 함수(member 추가, 일반회원!)
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

  // db에 기업을 추가하는 함수 (Corporation 추가, 사업자!)
  Future<void> addCorporation(String id, String password, String email, String name, String businessNum, String call) async {
    if (_connection == null) return;

    try {
      await _connection!.execute(
        'INSERT INTO corporation (c_id, c_pw, c_email, c_name, c_businessNum, c_call) VALUES (:id, :password, :email, :name, :businessNum, :call)',
        {
          'id': id,
          'password': password,
          'email': email,
          'name': name,
          'businessNum': businessNum,
          'call': call,
        },
      );
      print("Corporation added successfully");
    } catch (e) {
      print("Error adding corporation: $e");
    }
  }

  // db에 상품을 추가하는 함수 (goods 추가, 의자!)
  Future<void> addGoods(String name, String description, double price, String imageUrl) async {
    if (_connection == null) return;

    try {
      await _connection!.execute(
        'INSERT INTO goods (g_name, g_description, g_price, g_imageUrl) VALUES (:name, :description, :price, :imageUrl)',
        {
          'name': name,
          'description': description,
          'price': price,
          'imageUrl': imageUrl,
        },
      );
      print("Goods added successfully");
    } catch (e) {
      print("Error adding goods: $e");
    }
  }

  // 로그인 함수
  // 로그인 함수
  Future<bool> login(String mId, String mPw) async {
    try {
      if (_connection == null) {
        await connect();
      }
      // SQL 쿼리 작성 및 실행
      String query = 'SELECT * FROM member WHERE m_id = :mId AND m_pw = :mPw';
      IResultSet results = await _connection!.execute(query, {'mId': mId, 'mPw': mPw});

      if (results.rows.isEmpty) {
        return false; // 로그인 실패
      } else {
        // 로그인 성공
        await saveUserId(mId); // 사용자 ID 저장
        return true;
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    } finally {
      await close(); // 연결 종료
    }
  }


  // SharedPreferences에 사용자 정보 저장
  Future<void> saveUserInfo(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
    print("User info saved: $name");
  }

  // SharedPreferences에서 사용자 정보 불러오기
  Future<String?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    print("Current saved username: $username");
    return username;
  }

  // SharedPreferences에서 사용자 ID 불러오기
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id'); // 로그인 시 저장한 ID
    print("Current saved user ID: $userId");
    return userId;
  }

  // SharedPreferences에 사용자 ID 저장
  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    print("User ID saved: $userId"); // 저장 확인용 로그
  }

  // db에서 주소 가져오기
  Future<Map<String, String?>> getAddresses(String userId) async {
    try {
      if (_connection == null) {
        await connect();
      }

      String query = "SELECT m_address, m_D_address FROM member WHERE m_id = :userId;";
      IResultSet result = await _connection!.execute(query, {"userId": userId});

      if (result.rows.isNotEmpty) {
        String mAddress = result.rows.first.colAt(0) ?? 'No Address';
        String mDAddress = result.rows.first.colAt(1) ?? 'No Detailed Address';
        print("Addresses fetched from DB: $mAddress, $mDAddress");

        return {
          'm_address': mAddress,
          'm_D_address': mDAddress,
        };
      } else {
        print("No address found for userId: $userId");
        return {'m_address': null, 'm_D_address': null}; // 결과가 없는 경우
      }
    } catch (e) {
      print("Error fetching addresses from MySQL: $e");
      return {'m_address': null, 'm_D_address': null}; // 오류 발생 시 null 반환
    }
  }

  // SharedPreferences에 사용자 주소 저장
  Future<void> saveAddress(String username, String city, String road, String detail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('${username}_city', city);
    await prefs.setString('${username}_road', road);
    await prefs.setString('${username}_detail', detail);
    print("Address saved for $username: $city, $road, $detail");
  }

  // SharedPreferences에서 사용자 주소 불러오기
  Future<Map<String, String?>> getAddress(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? city = prefs.getString('${username}_city');
    String? road = prefs.getString('${username}_road');
    String? detail = prefs.getString('${username}_detail');

    print("Loaded address for $username: $city, $road, $detail");

    return {'city': city, 'road': road, 'detail': detail};
  }

  // db에 주소 업데이트
  Future<void> addAddress(String mId, String address, String dAddress) async {
    try {
      if (_connection == null) {
        await connect();
      }

      await _connection!.execute(
        'UPDATE member SET m_address = :address, m_D_address = :dAddress WHERE m_id = :mId',
        {
          'mId': mId,
          'address': address,
          'dAddress': dAddress,
        },
      );
      print("Address updated in DB: $address, $dAddress");
    } catch (e) {
      print("Error updating address: $e");
    }
  }
}
