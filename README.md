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

 
![WhatsApp Image 2025-09-19 at 16 55 25_16d595df](https://github.com/user-attachments/assets/e4351941-e9fc-4581-8a32-465dd987e56f)

![WhatsApp Image 2025-09-19 at 16 55 26_046bb98a](https://github.com/user-attachments/assets/b2658d01-6e33-4fb4-95ac-6acabc95d28d)


<!--
Encapsulation:
Data is kept private inside classes, and access is provided only through well-defined public methods. This protects the integrity of the data and reduces coupling.

Inheritance:
Common functionality is abstracted into base classes and extended by specialized subclasses, reducing duplication and improving reusability.

Polymorphism:
Interfaces and abstract classes are used to allow different implementations to be substituted interchangeably without affecting the rest of the system.

🧩 SOLID Principles
The codebase was designed following the SOLID principles to achieve flexibility and maintainability:

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
Clone this repository -->
Run flutter pub get 
Launch the app with flutter run
