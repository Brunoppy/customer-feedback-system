-- Create Feedback_Types table
CREATE TABLE Feedback_Types (
    FeedbackTypeID INT AUTO_INCREMENT PRIMARY KEY,
    FeedbackTypeName VARCHAR(50) NOT NULL
);

-- Create Feedbacks table
CREATE TABLE Feedbacks (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderID INT NOT NULL,
    FeedbackTypeID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FeedbackDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (FeedbackTypeID) REFERENCES Feedback_Types(FeedbackTypeID)
);

-- Insert sample data into Feedback_Types
INSERT INTO Feedback_Types (FeedbackTypeName) VALUES
('Product Quality'),
('Delivery Service'),
('Customer Support');

-- Insert sample data into Feedbacks
INSERT INTO Feedbacks (CustomerID, OrderID, FeedbackTypeID, Rating, Comments, FeedbackDate) VALUES
(1, 1, 1, 5, 'The product was excellent!', '2025-01-20'),
(2, 3, 2, 4, 'Delivery was quick, but the package was slightly damaged.', '2025-01-19'),
(3, 2, 3, 3, 'Customer support was helpful but could be faster.', '2025-01-18');

-- Query to list all feedbacks with details
SELECT 
    Feedbacks.FeedbackID,
    Customers.CustomerName,
    Orders.OrderID,
    Feedback_Types.FeedbackTypeName AS FeedbackType,
    Feedbacks.Rating,
    Feedbacks.Comments,
    Feedbacks.FeedbackDate
FROM Feedbacks
JOIN Customers ON Feedbacks.CustomerID = Customers.CustomerID
JOIN Orders ON Feedbacks.OrderID = Orders.OrderID
JOIN Feedback_Types ON Feedbacks.FeedbackTypeID = Feedback_Types.FeedbackTypeID;

-- Query to calculate the average rating for each feedback type
SELECT 
    Feedback_Types.FeedbackTypeName AS FeedbackType,
    AVG(Feedbacks.Rating) AS AverageRating
FROM Feedbacks
JOIN Feedback_Types ON Feedbacks.FeedbackTypeID = Feedback_Types.FeedbackTypeID
GROUP BY Feedback_Types.FeedbackTypeName;

-- Query to find feedbacks with low ratings (1 or 2)
SELECT 
    Feedbacks.FeedbackID,
    Customers.CustomerName,
    Feedback_Types.FeedbackTypeName AS FeedbackType,
    Feedbacks.Rating,
    Feedbacks.Comments
FROM Feedbacks
JOIN Customers ON Feedbacks.CustomerID = Customers.CustomerID
JOIN Feedback_Types ON Feedbacks.FeedbackTypeID = Feedback_Types.FeedbackTypeID
WHERE Feedbacks.Rating <= 2;

-- Query to count
