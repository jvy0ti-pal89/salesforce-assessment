# Salesforce Assessment Project

## Overview

This project is a Salesforce application built using Apex, Lightning Web Components (LWC), and Triggers. It demonstrates backend logic, UI development, and automation using Salesforce DX project structure.

The project combines:

* Apex for backend business logic
* Lightning Web Components (LWC) for frontend UI
* Triggers for automation
* Handler Pattern for maintainable architecture

---

## Project Structure

```text
force-app/
└── main/
    └── default/
        ├── classes/
        │   ├── AccountSearchController.cls
        │   ├── OrderController.cls
        │   └── OrderItemHandler.cls
        │
        ├── triggers/
        │   └── OrderItemTrigger.trigger
        │
        └── lwc/
            └── accountsearch/
                ├── accountsearch.html
                ├── accountsearch.js
                └── accountsearch.js-meta.xml
```

---

## Features

### Account Search (LWC + Apex)

* Lightning Web Component provides a user interface for searching Accounts.
* Uses Apex controller methods exposed through `@AuraEnabled`.
* Displays dynamic search results based on user input.

### Order Management (Apex)

* Apex classes handle order-related business logic.
* Encapsulates reusable backend functionality.
* Demonstrates SOQL usage and server-side processing.

### Order Item Automation (Trigger + Handler Pattern)

* Trigger executes on OrderItem events.
* Business logic is separated into a dedicated handler class.
* Follows Salesforce best practices for maintainability and scalability.

---

## Architecture Flow

```text
LWC
 ↓
Apex Controller
 ↓
Salesforce Database

Trigger
 ↓
Handler Class
 ↓
Database Updates
```

---

## Key Concepts Used

* Apex Classes
* SOQL Queries
* Lightning Web Components (LWC)
* Triggers
* Handler Pattern
* Salesforce DX Project Structure
* @AuraEnabled Methods
* Client-Server Communication

---

## Tech Stack

* Salesforce Apex
* Lightning Web Components (LWC)
* SOQL
* Salesforce DX
* Git & GitHub

---

## Deployment

### Clone Repository

```bash
git clone https://github.com/jvy0ti-pal89/salesforce-assessment.git
cd salesforce-assessment
```

### Deployment Commands (Reference)

```bash
sf project deploy start

# OR

sfdx force:source:deploy -p force-app
```

### Open Salesforce Org

```bash
sfdx force:org:open
```

**Note:** These commands require a properly configured Salesforce CLI environment and an authenticated Salesforce org.

---

## Assessment Note

This project was developed using Salesforce DX structure.

Due to Salesforce CLI configuration issues in the local environment, full deployment validation could not be completed. However, the Apex classes, LWC components, Trigger implementation, metadata files, screenshots, and project structure are included in this repository for review.

The repository demonstrates the required Salesforce development concepts and implementation approach requested in the assessment.

---

## Screenshots

### 1. VS Code Project Structure

![VS Code Structure](screenshots/01-vscode-structure.png)

### 2. Lightning Web Component UI

![LWC UI](screenshots/02-lwc-ui.png)

### 3. Apex Class Implementation

![Apex Class](screenshots/03-apex-class.png)

### 4. Trigger Implementation

![Trigger](screenshots/04-trigger.png)

### 5. GitHub Repository

![GitHub Repository](screenshots/05-github-repo.png)

---

## Future Improvements

* Add Apex Test Classes for code coverage
* Improve LWC UI and user experience
* Add validation and error handling
* Add logging and monitoring
* Enhance automation workflows
* Complete deployment validation in Salesforce Org

---

## Status

* ✔ Apex backend implemented
* ✔ Lightning Web Component implemented
* ✔ Trigger automation implemented
* ✔ Handler Pattern implemented
* ✔ Salesforce DX structure maintained
* ✔ GitHub repository documented
* ✔ Screenshots included
* ✔ Source code ready for evaluation

---

## Author

GitHub: https://github.com/jvy0ti-pal89
