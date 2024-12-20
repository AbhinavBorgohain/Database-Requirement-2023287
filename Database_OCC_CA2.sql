DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS ManagerialHierarchy;
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS EmploymentStatus;
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    State VARCHAR(255) NOT NULL,
    Eircode VARCHAR(255)
);

CREATE TABLE Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Country VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);
CREATE TABLE Jobs (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    Language VARCHAR(100) NOT NULL,
    RequiredSkills TEXT NOT NULL,
    QualificationLevel VARCHAR(255) NOT NULL
);
CREATE TABLE ManagerialHierarchy (
    HierarchyID INT AUTO_INCREMENT PRIMARY KEY,
    ManagerID INT NOT NULL,
    SubordinateID INT NOT NULL,
    AssignmentDate DATE NOT NULL
);
CREATE TABLE Salary (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    EffectiveDate DATE NOT NULL,
    SalaryType VARCHAR(255) NOT NULL
);
CREATE TABLE EmploymentStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Status VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE
);
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(255) NOT NULL,
    AddressID INT,
    HierarchyID INT,
    ContactID INT,
    DepartmentID INT,
    SalaryID INT,
    EmploymentStatusID INT,
    StatusID INT,
    JobID INT,
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (HierarchyID) REFERENCES ManagerialHierarchy(HierarchyID),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (SalaryID) REFERENCES Salary(SalaryID),
    FOREIGN KEY (EmploymentStatusID) REFERENCES EmploymentStatus(StatusID),
    FOREIGN KEY (StatusID) REFERENCES EmploymentStatus(StatusID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);

