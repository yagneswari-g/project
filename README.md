Introduction
The Airline Reservation System is a database-driven application designed to manage airline
operations, including flight schedules, seat availability, customer records, and bookings. It
streamlines the process of ticket reservation, seat allocation, and booking management, ensuring
a user-friendly and efficient experience for both airline staff and passengers.
Abstract
This project aims to develop a structured and normalized SQL-based airline reservation sys-
tem using MySQL Workbench. The system maintains relational tables such as Flights,
Customers, Seats, and Bookings. It supports key operations like seat booking, flight search,
availability checking, and booking summary reports. Triggers ensure automatic updates of seat
status, and views simplify data access. The system is scalable and demonstrates core principles
of relational database design, integrity constraints, and real-time updates.
Tools Used
• Database: MySQL
• Interface: MySQL Workbench
• Language: SQL (Structured Query Language)
• Operating System: Linux / Windows
Steps Involved in Building the Project
• Requirement Analysis: Identified key entities and relationships — Flights, Customers,
Seats, Bookings.
• Schema Design: Created normalized tables with primary keys and foreign key constraints.
• Sample Data Insertion: Inserted test data for flights, seats, and bookings.
• Query Development:
– Search for flights by source and destination.
– List available seats for a selected flight.
1– Generate booking summary.
• Trigger Creation:
– Automatically mark seat as booked after booking insertion.
– Automatically free up seat after booking cancellation.
• Views:
– Created views for flight availability to support frontend or reports.
• Testing:
– Verified booking logic and seat updates.
– Handled edge cases like double booking prevention.
Conclusion
The Airline Reservation System successfully demonstrates the creation of a robust, normalized
SQL database with support for real-time booking management. Using MySQL Workbench,
the project highlights essential database development skills such as entity design, constraint
enforcement, trigger implementation, and data retrieval using queries and views. This project
can be extended further into a full-stack application using backend frameworks (like Flask,
Spring Boot) and frontend technologies (like React or Angular).
