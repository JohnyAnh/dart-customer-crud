import 'package:dart_crud_sem4_slot8/dart_crud_sem4_slot8.dart' as dart_crud_sem4_slot8;
import 'package:dart_crud_sem4_slot8/model/customer.dart';
import 'package:dart_crud_sem4_slot8/service/customer_service.dart';
import 'package:dart_crud_sem4_slot8/service/impl/customer_service_impl.dart';
void main(List<String> arguments)async {
  print('Hello world: ${dart_crud_sem4_slot8.calculate()}!');
  //call api
  CustomerService customerService = CustomerServiceImpl();
  List<Customer> customers = await customerService.getAllCustomer();
  print("customer $customers");
  Customer cus = await customerService.findCustomerById(1);
  print("cus $cus");

  // Create
  Customer newCustomer = Customer(name: "Hoang anh", address: "HN", age: 28);
  Customer createdCustomer = await customerService.createCustomer(newCustomer);
  print("Created Customer: $createdCustomer");

  // Update
  int customerIdToUpdate = 1;
  Customer existingCustomer = await customerService.findCustomerById(customerIdToUpdate);

  if (existingCustomer.id != null) {
    existingCustomer.name = "Updated Name";
    existingCustomer.address = "Updated Address";
    existingCustomer.age = 99;

    Customer updatedCustomer = await customerService.updateCustomer(existingCustomer.id!, existingCustomer);
    print("Updated Customer: $updatedCustomer");
  } else {
    print("Customer with ID $customerIdToUpdate not found.");
  }

  // Delete
  int customerIdToDelete = 2;
  await customerService.deleteCustomer(customerIdToDelete);
  print("Customer with ID $customerIdToDelete deleted.");
}
