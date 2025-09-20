☕ Smart Ahwa Manager

Smart Ahwa Manager is a Flutter application that helps café owners manage orders in real time, track drinks, and streamline their workflow.

---

## Features

- ➕ Add new customer orders, including:
  - Customer name  
  - Drink type  
  - Special instructions  
- 📋 Display live list of pending orders using **StreamBuilder**  
- ✅ Mark orders as completed  
- ⚡ Real-time updates without manual refresh  

## Screenshots


| Home Screen |  Pending Orders Screen|


<img src="https://github.com/user-attachments/assets/e4351941-e9fc-4581-8a32-465dd987e56f" alt="Home Screen" width="200"/>
<img src="https://github.com/user-attachments/assets/b2658d01-6e33-4fb4-95ac-6acabc95d28d" alt="Home Screen" width="200"/>

## OOP Principles

Encapsulation:

<img src="https://github.com/user-attachments/assets/b42f7036-bc05-4d8d-bb33-44ec85b82f34" alt="Home Screen" width="300"/>

In order model class => _completed is private with controlled mutation via markCompleted()

Abstraction:

<img src="https://github.com/user-attachments/assets/f101fbc0-a05d-4e7c-ba00-9ff89946b0ba" alt="Home Screen" width="300"/>

Here, Drink.of() returns a concrete drink, but the caller only depends on the Drink interface. The code doesn’t care about the type.

Inheritance:

<img src="https://github.com/user-attachments/assets/7eb75cdf-565b-44a0-9b04-d29a3a182473" alt="Home Screen" width="300"/>

Drink type inherits from Drink, so they all share properties like type, displayName, and price. This reduces code duplication and enforces consistency.


## SOLID Principles

Single Responsibility Principle (SRP):
OrderService only coordinates order-related workflows. It doesn’t handle UI or storage logic, keeping a single responsibility.


<img src="https://github.com/user-attachments/assets/8d3be49e-4b3d-44bc-9ee4-5557b38f3c03" alt="Home Screen" width="400"/>


Dependency Inversion Principle (DIP):
OrderService depends on the abstraction (OrderRepository), not a concrete implementation. This allows swapping the repository easily.


<img src="https://github.com/user-attachments/assets/80d1c0c9-e746-4e42-809e-163bedb59e1b" alt="Home Screen" width="400"/>



## Project Structure
<img src="https://github.com/user-attachments/assets/c8eea946-1fc9-484b-92a5-7da29e90d41f" alt="Home Screen" width="400"/>




🚀 Getting Started

Clone this repository 

Run flutter pub get 

Launch the app with flutter run 
