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

<img src="https://github.com/user-attachments/assets/b42f7036-bc05-4d8d-bb33-44ec85b82f34" alt="Home Screen" width="400"/>

In order model class => _completed is private with controlled mutation via markCompleted()

Abstraction:

<img src="https://github.com/user-attachments/assets/f101fbc0-a05d-4e7c-ba00-9ff89946b0ba" alt="Home Screen" width="400"/>

Here, Drink.of() returns a concrete drink, but the caller only depends on the Drink interface. The code doesn’t care about the type.

Inheritance:

<img src="https://github.com/user-attachments/assets/7eb75cdf-565b-44a0-9b04-d29a3a182473" alt="Home Screen" width="400"/>

Drink type inherits from Drink, so they all share properties like type, displayName, and price. This reduces code duplication and enforces consistency.


<!-- ## SOLID Principles

Single Responsibility Principle (SRP):
Each class has one clearly defined responsibility. For example, data models only hold and validate data, while services handle business logic.

Open/Closed Principle (OCP):
The system is open to extension but closed to modification. New features (e.g., new drink types) can be added without altering existing core logic.

Liskov Substitution Principle (LSP):
Subclasses can replace their base classes without breaking the application. This ensures that derived classes conform to the expected behavior of their parents.

Interface Segregation Principle (ISP):
Interfaces are small and focused, ensuring that classes only implement what they actually need rather than being forced to implement unused methods.

Dependency Inversion Principle (DIP):
High-level modules depend on abstractions rather than concrete implementations. This decouples components and makes the system easier to test and extend.

🧩 Project Structure
Models — Define the core data structures (e.g., Order, Drink).
Services — Contain the business logic (e.g., OrderService manages all order operations).
Screens & Widgets — Handle the presentation layer (decoupled from business logic).
This layered structure supports scalability and future feature additions without breaking existing code.

🚀 Getting Started
Clone this repository 
Run flutter pub get 
Launch the app with flutter run -->
