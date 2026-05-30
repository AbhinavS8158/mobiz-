# Mobiz Van Sales Application

## Overview

Mobiz Van Sales Application is a Flutter-based mobile application developed for managing van sales operations. The application allows users to log in, manage customers, create invoices, select products, and view sales invoices through API integration.

## Features

### Authentication

* User Login
* Session Management

### Dashboard

* Quick navigation to application modules
* Sales overview

### Customer Management

* Customer List
* Search Customers
* Select Customer for Invoice Creation

### Product Management

* Product List
* Product Detail View
* Product Type Selection

### Invoice Management

* Create Sales Invoice
* Add Multiple Products
* Apply Discounts
* VAT Calculation
* Save Invoice
* View Invoice History

### Invoice List

* Display all created sales invoices
* View customer details and invoice totals

---

## API Integration

### Login

**POST**

```http
/api/login
```

### Get User Detail

**GET**

```http
/api/get_user_detail
```

### Get Customer

**GET**

```http
/api/get_customer
```

### Get Product

**GET**

```http
/api/get_product
```

### Get Product Type

**GET**

```http
/api/get_product_type
```

### Get Product Detail

**GET**

```http
/api/get_product_detail
```

### Create Van Sale

**POST**

```http
/api/vansale.store
```

### Van Sale List

**GET**

```http
/api/vansale.index
```

---

## Application Flow

```text
Login
   ↓
Dashboard
   ↓
Customer List
   ↓
Select Customer
   ↓
Create Invoice
   ↓
Product List
   ↓
Select Product
   ↓
Save Invoice
   ↓
Invoice List
```

---

## Technologies Used

* Flutter
* Dart
* GetX State Management
* Dio HTTP Client
* REST API Integration

---

## Project Structure

```text
lib/
│
├── controller/
│   ├── login_controller.dart
│   ├── dashboard_controller.dart
│   ├── customer_controller.dart
│   ├── product_controller.dart
│   ├── invoice_controller.dart
│   └── sales_invoice_controller.dart
│
├── model/
│
├── services/
│   └── api_service.dart
│
├── view/
│   ├── login/
│   ├── dashboard/
│   ├── customer/
│   ├── product/
│   ├── invoice/
│   └── sales_invoice/
│
└── main.dart
```

---

## Setup Instructions

### Prerequisites

* Flutter SDK
* Android Studio / VS Code
* Android Emulator or Physical Device

### Installation

1. Clone the repository

```bash
git clone https://github.com/AbhinavS8158/mobiz
```

2. Navigate to project directory

```bash
cd mobiz
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the application

```bash
flutter run
```

---

## Login Credentials

```text
Email    : sales@shop.com
Password : 12345678
```

---

## Deliverables

* Complete Flutter Source Code
* Working APK
* API Integrated Application
* Clean and Maintainable Code

---

## Author

Abhinav S

Flutter Developer
