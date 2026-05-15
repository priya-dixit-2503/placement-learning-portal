# Placement Learning Portal

A comprehensive web-based portal for managing placement-related learning resources and student information. Built with Java, Jakarta EE, and MySQL for secure user authentication and role-based access control.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [User Roles](#user-roles)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

The Placement Learning Portal is a web application designed to facilitate placement-related learning and resource management. It provides secure user authentication, role-based access control, and a user-friendly interface for both administrators and regular users to manage and access learning materials.

## ✨ Features

- **User Authentication**: Secure login and registration system
- **Role-Based Access Control**: Different access levels for Admin and User roles
- **User Management**: Admin dashboard for managing user accounts
- **Responsive Design**: User-friendly web interface
- **Secure Password Handling**: Safe password storage and validation
- **Database Integration**: MySQL database for persistent data storage
- **Session Management**: Secure session handling for authenticated users

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| **Backend** | Java, Jakarta EE 5.0 |
| **Build Tool** | Apache Maven 4.0.0 |
| **Database** | MySQL 8.0 |
| **Servlet Container** | Jakarta Servlet 5.0 |
| **Front-end** | JSP, HTML5, CSS3 |
| **Driver** | MySQL Connector/J 8.0.28 |

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Java Development Kit (JDK)**: Version 11 or higher
- **Apache Maven**: Version 3.6 or higher
- **MySQL Server**: Version 8.0 or higher
- **Apache Tomcat** or any Jakarta EE compatible application server (version 10.0+)
- **Git**: For version control

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd placement-learning-portal
```

### 2. Build the Project

```bash
mvn clean install
```

This command will:
- Clean previous build artifacts
- Download dependencies
- Compile the source code
- Package the application as a WAR file

### 3. Deploy to Tomcat

```bash
# Copy the generated WAR file to Tomcat's webapps directory
cp target/placement-learning-portal-1.0.war $CATALINA_HOME/webapps/
```

## 🗄️ Database Setup

### 1. Create Database

Open MySQL command line or MySQL Workbench and execute:

```bash
mysql -u root -p < database.sql
```

Or manually run the commands from `database.sql`:

```sql
CREATE DATABASE placement_portal;
USE placement_portal;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20)
);

INSERT INTO users(name, email, password, role)
VALUES('Admin', 'admin@gmail.com', 'admin123', 'admin');
```

### 2. Verify Database Connection

Ensure your MySQL server is running and accessible on `localhost:3306`

## ⚙️ Configuration

### 1. Database Configuration

Update the database connection details in `src/main/java/com/placement/util/DBConnection.java`:

- **Database Host**: `localhost`
- **Database Port**: `3306`
- **Database Name**: `placement_portal`
- **MySQL Username**: `root`
- **MySQL Password**: `your_password`

### 2. Application Server Configuration

Ensure your application server (Tomcat) has sufficient memory:

```bash
export CATALINA_OPTS="-Xmx1024m -Xms512m"
```

## 💻 Usage

### 1. Start the Application

Start your Tomcat server:

```bash
$CATALINA_HOME/bin/startup.sh  # On Linux/Mac
$CATALINA_HOME\bin\startup.bat # On Windows
```

### 2. Access the Application

Open your web browser and navigate to:

```
http://localhost:8080/placement-learning-portal/
```

### 3. Login

Use the default admin credentials:
- **Email**: `admin@gmail.com`
- **Password**: `admin123`

Or create a new account by clicking the register button.

## 📁 Project Structure

```
placement-learning-portal/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── placement/
│       │           ├── controller/
│       │           │   ├── LoginServlet.java      # Handle login requests
│       │           │   └── RegisterServlet.java   # Handle registration requests
│       │           ├── dao/
│       │           │   └── UserDAO.java           # Database operations for users
│       │           ├── model/
│       │           │   └── User.java              # User model class
│       │           └── util/
│       │               └── DBConnection.java      # Database connection utility
│       └── webapp/
│           ├── index.jsp                          # Landing page
│           ├── css/
│           │   └── style.css                      # Application styles
│           ├── jsp/
│           │   ├── admin.jsp                      # Admin dashboard
│           │   ├── dashboard.jsp                  # User dashboard
│           │   ├── login.jsp                      # Login page
│           │   └── register.jsp                   # Registration page
│           └── WEB-INF/
│               └── web.xml                        # Web application deployment descriptor
├── database.sql                                   # Database initialization script
├── pom.xml                                        # Maven configuration file
└── README.md                                      # This file
```

## 🔌 API Endpoints

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/LoginServlet` | User login |
| POST | `/RegisterServlet` | User registration |

### Pages

| Endpoint | Description |
|----------|-------------|
| `/` | Landing page |
| `/jsp/login.jsp` | Login page |
| `/jsp/register.jsp` | Registration page |
| `/jsp/dashboard.jsp` | User dashboard |
| `/jsp/admin.jsp` | Admin panel |

## 👥 User Roles

### Admin
- Full access to the portal
- Can manage user accounts
- Can access admin dashboard
- Default credentials: `admin@gmail.com` / `admin123`

### User
- Limited access to learning resources
- Can access personal dashboard
- Can view assigned materials
- Created through registration

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please ensure your code follows the project's coding standards and includes appropriate documentation.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📞 Support

For issues, questions, or suggestions, please create an issue on the repository or contact the development team.

## 🔐 Security Notes

- Never commit sensitive information (passwords, API keys) to version control
- Always use HTTPS in production environments
- Regularly update dependencies for security patches
- Implement input validation and sanitization
- Use prepared statements to prevent SQL injection (already implemented in UserDAO)

## 🎓 Learning Resources

- [Jakarta EE Documentation](https://jakarta.ee/)
- [Apache Maven Documentation](https://maven.apache.org/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [JSP Tutorials](https://www.oracle.com/java/technologies/jsp.html)

---

**Last Updated**: May 16, 2026
