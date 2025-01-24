
abstract class AuthRepo{
   Future<void> registerNewAccount({required String email , required String password});
   Future<void> loginAccount({required String email , required String password});
}