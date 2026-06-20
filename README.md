# Salesforce Assessment Project

## Overview
This project is a Salesforce application built using Apex, Lightning Web Components (LWC), and Triggers. It demonstrates backend logic, UI development, and automation using Salesforce DX structure.

The project simulates real-world Salesforce development by combining:
- Apex for backend logic
- LWC for frontend UI
- Triggers for automation
- Handler pattern for clean architecture

---

## Project Structure

force-app/
  main/
    default/
      classes/
        AccountSearchController.cls
        OrderController.cls
        OrderItemHandler.cls

      triggers/
        OrderItemTrigger.trigger

      lwc/
        accountsearch/
          accountsearch.html
          accountsearch.js
          accountsearch.js-meta.xml

---

## Features

### Account Search (LWC + Apex)
- LWC provides UI for searching accounts
- Calls Apex controller using @AuraEnabled methods
- Displays dynamic results

### Order Management (Apex)
- Handles order-related backend logic
- Provides reusable methods for processing data

### Order Item Automation (Trigger)
- Trigger runs on OrderItem events
- Uses handler class (OrderItemHandler)
- Implements clean separation of logic

---

## Architecture Flow

LWC → Apex Controller → Salesforce Database  
Trigger → Handler Class → Database Updates

---

## Key Concepts Used
- Apex Classes
- SOQL Queries
- Lightning Web Components
- Triggers
- Handler Pattern
- Salesforce DX structure
- @AuraEnabled communication

---

## Deployment

### Clone Repository
git clone https://github.com/jvy0ti-pal89/salesforce-assessment.git  
cd salesforce-assessment

### Deploy to Org
sf project deploy start

OR  
sfdx force:source:deploy -p force-app

### Open Org
sfdx force:org:open

---

## Tech Stack
- Salesforce Apex
- Lightning Web Components
- SOQL
- Salesforce DX
- Git & GitHub

---

## Notes
- Some components were initially created in Developer Console and later moved into Salesforce DX structure.
- Trigger uses handler pattern for better maintainability.
- XML metadata files ensure proper Salesforce deployment compatibility.

---

## Future Improvements
- Add Apex test classes for coverage
- Improve LWC UI design
- Add authentication and role-based access
- Add logging and error handling
- Add data validation rules

---

## Author
GitHub: https://github.com/jvy0ti-pal89

---

## Status
✔ Apex backend implemented  
✔ LWC frontend implemented  
✔ Trigger automation implemented  
✔ GitHub repository ready  
✔ Project ready for evaluation
