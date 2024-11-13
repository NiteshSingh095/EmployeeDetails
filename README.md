# Employee Details App

A Flutter-based mobile application that fetches and displays a list of employees from a mock API. The app allows users to:
- View a list of employees.
- Search for employees by name.
- Tap on an employee to see detailed information.
- Use pull-to-refresh functionality to reload the list of employees.
- Shimmer effect to indicate loading.

## Project Description

The **Employee Details App** pulls employee data from the mock API endpoint `https://jsonplaceholder.typicode.com/users` and displays it in a list. The data includes:
- Employee name
- Username
- Email
- Phone
- Address
- Website

The app features a search bar that allows users to search for employees by name. Tapping on an employee navigates to a detail screen displaying all available information for that employee.

---

## Instructions on How to Run the App

### Prerequisites

To run this app, you need the following:

- **Flutter SDK**: Ensure that Flutter is installed on your machine. Follow the instructions on the [official Flutter installation page](https://flutter.dev/docs/get-started/install).
- **IDE**: Use any Flutter-supported IDE (e.g., Android Studio, VS Code).
- **Internet Connection**: Required for fetching employee data from the API.

### Steps to Run the App

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd employee_details
Install Dependencies:

2. **Run the following command to fetch the necessary packages:**

   ```bash
   flutter pub get
   Run the App:



## Using the App:

Upon launching the app, you'll see a list of employees.
You can search for employees by name using the search bar.
Tapping on an employee's name will take you to a detail screen that displays additional information about the selected employee.
You can pull down to refresh the employee list, which will reload the data from the API.
Troubleshooting
If you encounter issues, ensure that your Flutter SDK is correctly installed and that your device/emulator is running properly.

## Screenshots : 
![Screenshot 2024-11-14 034220](https://github.com/user-attachments/assets/0e06a039-f7f0-4c0d-a95b-ecde15f4aeed)

![image](https://github.com/user-attachments/assets/97561457-e288-4d92-82ab-70ec37985288)

![Screenshot 2024-11-14 034231](https://github.com/user-attachments/assets/98fedeee-b389-440b-afdc-6aefb389cda5)


You can run flutter doctor to check the setup and resolve any issues.
