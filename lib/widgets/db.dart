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
        host: '27.117.119.85',
        // MySQL 서버 호스트
        port: 3306,
        // MySQL 포트
        userName: 'user',
        // MySQL 사용자명
        password: '0000',
        // MySQL 비밀번호
        databaseName: 'Chair', // 데이터베이스 이름
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
  Future<void> addUser(String id, String password, String email, String name,
      String birthDate, String phone) async {
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
  Future<void> addCorporation(String id, String password, String email,
      String name, String businessNum, String call) async {
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
  Future<void> addGoods(
      String name, String description, double price, String imageUrl) async {
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
  Future<bool> login(String mId, String mPw) async {
    try {
      if (_connection == null) {
        await connect();
      }
      String query = 'SELECT * FROM member WHERE m_id = :mId AND m_pw = :mPw';
      IResultSet results =
          await _connection!.execute(query, {'mId': mId, 'mPw': mPw});

      if (results.rows.isEmpty) {
        return false;
      } else {
        var userInfo = results.rows.first;
        print("Login successful: ${userInfo.colAt(3)}"); // 사용자 이름 출력
        await saveUserId(mId); // 사용자 ID 저장
        String? username = userInfo.colAt(3);
        if (username != null) {
          await saveUserInfo(username); // 사용자 이름 저장
        } else {
          // username이 null일 때의 처리 (예: 기본값 사용, 에러 메시지 출력 등)
        }
        return true;
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    } finally {
      await close();
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

  // 사용자 정보를 ID로 가져오는 함수
  Future<Map<String, dynamic>?> getUserInfoById(String userId) async {
    try {
      if (_connection == null) {
        await connect();
      }
      String query = "SELECT * FROM member WHERE m_id = :userId;";
      IResultSet result = await _connection!.execute(query, {"userId": userId});

      if (result.rows.isNotEmpty) {
        var userInfo = result.rows.first;
        return {
          'm_id': userInfo.colAt(0),
          'm_pw': userInfo.colAt(1),
          'm_email': userInfo.colAt(2),
          'm_name': userInfo.colAt(3),
          'm_birthday': userInfo.colAt(4),
          'm_call': userInfo.colAt(5),
          'm_address': userInfo.colAt(6),
          'm_D_address': userInfo.colAt(7),
          'm_signupday': userInfo.colAt(8),
        };
      } else {
        print("No user found for userId: $userId");
        return null;
      }
    } catch (e) {
      print("Error fetching user info from MySQL: $e");
      return null;
    }
  }

  // db에서 주소 가져오기
  Future<Map<String, String?>> getAddresses(String userId) async {
    try {
      if (_connection == null) {
        await connect();
      }

      String query =
          "SELECT m_address, m_D_address FROM member WHERE m_id = :userId;";
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
  Future<void> saveAddress(
      String username, String city, String road, String detail) async {
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

  // mysql에서 상품 추천하기 ----------------------------------------------
  Future<List<Map<String, dynamic>>> recommendChairs(String memberId) async {
    try {
      // 연결이 없으면 연결을 생성
      if (_connection == null) {
        await connect();
      }

      // 회원의 사이즈 정보 가져오기
      var memberResult = await _connection!.execute(
        'SELECT m_size_calfL, m_size_thighW, m_size_thighL, m_size_backH FROM member WHERE m_id = :memberId',
        {'memberId': memberId},
      );

      if (memberResult.rows.isEmpty) {
        return []; // 해당 회원이 없으면 빈 리스트 반환
      }

      // 회원 정보 (String? -> double 변환)
      var member = memberResult.rows.first;
      double? m_calfL =
          double.tryParse(member.colByName('m_size_calfL') ?? '0');
      double? m_thighW =
          double.tryParse(member.colByName('m_size_thighW') ?? '0');
      double? m_thighL =
          double.tryParse(member.colByName('m_size_thighL') ?? '0');
      double? m_backH =
          double.tryParse(member.colByName('m_size_backH') ?? '0');

      // 의자 정보 가져오기 및 각 의자와 회원 정보 비교
      var chairsResult = await _connection!.execute(
          'SELECT g_num,g_size_height, g_size_seatW, g_size_seatL, g_size_backH FROM goods');
      List<Map<String, dynamic>> recommendations = [];

      for (var chair in chairsResult.rows) {
        double? g_num = double.tryParse(chair.colByName('g_num') ?? '0');
        double? g_height =
            double.tryParse(chair.colByName('g_size_height') ?? '0');
        double? g_seatW =
            double.tryParse(chair.colByName('g_size_seatW') ?? '0');
        double? g_seatL =
            double.tryParse(chair.colByName('g_size_seatL') ?? '0');
        double? g_backH =
            double.tryParse(chair.colByName('g_size_backH') ?? '0');

        // 항목 일치 카운트
        double matchCount = 0;

        // 종아리 길이 우선순위 가중치 계산
        if (m_calfL != null && g_height != null) {
          double difference = (g_height - m_calfL);
          // 차이가 10 이상인 경우
          if (difference.abs() >= 10) {
            matchCount += 0;
          }
          else {
            if (difference <= 5) {
              matchCount += 0.5;
            } else if (difference <= 4) {
              matchCount += 1.0;
            } else if (difference <= 3) {
              matchCount += 1.5;
            } else if (difference <= 2) {
              matchCount += 2.0;
            } else if (difference <= 0) {
              matchCount += 1.5;
            } else if (difference <= -2) {
              matchCount += 1.0;
            } else if (difference == -3) {
              matchCount += 0.5;
            } else {
              matchCount += 0.2; // 기본 가중치
            }
          }
        }

        // 허벅지 길이
        if (m_thighL != null && g_seatL != null) {
          double difference = g_seatL - m_thighL;
          if ((difference).abs() >= 10) {
            matchCount += 0;
          } else {
            if (difference <= 2) {
              matchCount += 0.5;
            } else if (difference <= 0) {
              matchCount += 1.0;
            } else if (difference <= -1.5) {
              matchCount += 1.5;
            } else if (difference == -3.5) {
              matchCount += 0.5;
            } else {
              matchCount += 0.2;
            }
          }
        }

        // 허벅지 너비
        if (m_thighW != null && g_seatW != null) {
          double difference = g_seatW - m_thighW;

          if (difference <= 0) {
            matchCount += 0;
          } else {
            if (difference <= 6) {
              matchCount += 0.8;
            } else if (difference <= 12) {
              matchCount += 0.5;
            } else if (difference <= 9) {
              matchCount += 0.8;
            } else if (difference <= 7) {
              matchCount += 1.0;
            } else if (difference <= 5) {
              matchCount += 0.8;
            } else if (difference == 3) {
              matchCount += 0.3;
            } else {
              matchCount += 0.2;
            }
          }
        }

        // 등 길이
        if (m_backH != null && g_backH != null) {
          double difference = g_backH - m_backH;

          if (g_backH == 0) {
            matchCount += 0;
          } else {
            if (difference == 10) {
              matchCount += 0.2;
            } else if (difference == 5) {
              matchCount += 0.3;
            } else if (difference == 0) {
              matchCount += 0.5;
            } else if (difference == -5) {
              matchCount += 0.4;
            } else if (difference == -10) {
              matchCount += 0.3;
            } else {
              matchCount += 0.1;
            }
          }
        }
        // 매칭 카운트를 바탕으로 추천 리스트에 추가
        if (matchCount > 0) {
          recommendations.add({
            'g_num': g_num,
            'g_size_height': g_height,
            'g_size_seatW': g_seatW,
            'g_size_seatL': g_seatL,
            'g_size_backH': g_backH,
            'matchCount': matchCount,
          });
        }
      }
      // 매칭 항목 수에 따라 의자를 내림차순으로 정렬
      recommendations
          .sort((a, b) => b['matchCount'].compareTo(a['matchCount']));

      return recommendations;
    } catch (e) {
      print('Error recommending chairs: $e');
      return [];
    }
    // 연결을 여기서 닫지 않음, 필요한 경우 별도 로직으로 닫기 처리
  }
}
