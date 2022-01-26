import 'package:demo_1/modal/modal.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDAO {
  @Query('SELECT * FROM User')
  Future<List<User>> getAllUser();

  @Query('SELECT * FROM User  WHERE id = :id')
  Future<void> getAllUserById(int id);

  @Query('SELECT * FROM User')
  Future<void> deleteAllUser();

  @insert
  Future<void> insertUser(User user);

  @Query(
      "UPDATE User SET fristName = :fName , lastName = :lastName , email = :email WHERE id = :id")
  Future<List<User>> updateForEdit(
      String fName, String lastName, String email, int id);

  @Query("UPDATE User SET password = :password WHERE id =:id")
  Future<List<User>> updateForPassword(String password, int id);

  @Query('SELECT * FROM User WHERE email = :email AND password = :password')
  Future<List<User>> loginData(String email, String password);

  @Query('SELECT  * FROM User WHERE email = :email')
  Stream<User?> emailData(String email);

  @Query('DELETE FROM User WHERE id = :id')
  Future<void> deleteUser(int id);
}
