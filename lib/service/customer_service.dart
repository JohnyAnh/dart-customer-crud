import 'package:dart_crud_sem4_slot8/model/customer.dart';
abstract class CustomerService{
  Future<List<Customer>> getAllCustomer();
  Future<Customer> findCustomerById(int id);
  Future<Customer> createCustomer(Customer customer);
  Future<Customer> updateCustomer(int id, Customer customer);
  Future<void> deleteCustomer(int id);

}