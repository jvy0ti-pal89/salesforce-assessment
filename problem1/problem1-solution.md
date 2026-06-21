# Problem 1 – Library Book Borrowing System

## Objective

Build a no-code Salesforce solution for managing library book borrowing using custom objects, validation rules, and Flow automation.

---

## Data Model

### Book__c

Custom object used to store library book information.

**Fields:**

* Title (Text)
* Author (Text)
* ISBN (Text)
* Status (Picklist)

  * Available
  * Borrowed
* Genre (Picklist)

### Borrowing__c

Custom object used to track borrowing transactions.

**Fields:**

* Book (Master-Detail Relationship to Book__c)
* Due Date (Date)
* Return Date (Date)

---

## Relationship

* Borrowing__c has a Master-Detail relationship with Book__c.
* A single Book record can have multiple Borrowing records.
* Borrowing records inherit ownership and sharing settings from the related Book record.

---

## Validation Rules

### 1. Due_Date_Cannot_Be_Past

**Purpose:**
Prevent users from entering a due date earlier than the current date.

**Formula:**

```text
Due_Date__c < TODAY()
```

**Error Message:**

```text
Due Date cannot be in the past.
```

---

### 2. Book_Already_Borrowed

**Purpose:**
Prevent creation of a borrowing record when the selected book is already marked as Borrowed.

**Formula:**

```text
ISPICKVAL(Book__r.Status__c, "Borrowed")
```

**Error Message:**

```text
This book is already borrowed.
```

---

## Flow Automation

### Borrow Book Screen Flow

**Purpose:**
Allow librarians to search for a book and create a borrowing record.

**Flow Steps:**

1. Enter Book Title and Due Date.
2. Search Book record using Get Records.
3. Create a Borrowing record.
4. Update Book Status to "Borrowed".
5. Display Success Screen.

**Outcome:**
The borrowing transaction is recorded and the selected book becomes unavailable for further borrowing.

---

### Return Book Flow

**Purpose:**
Automatically mark a book as available when it is returned.

**Flow Logic:**

1. Monitor Borrowing records.
2. Detect when Return Date is populated.
3. Update related Book Status to "Available".

**Outcome:**
Returned books become available for future borrowing.

---

## Screenshots Included

* book-object.png
* borrowing-object.png
* master-detail-book.png
* validation-rule-list.png
* validation-rule-due-date.png
* validation-rule-book-borrowed.png
* borrow-flow.png

---

## Assessment Requirements Covered

* Custom Objects
* Master-Detail Relationship
* Validation Rules
* Screen Flow Automation
* Borrowing Record Management
* Book Availability Tracking
