-- Create Client table
CREATE TABLE Client (
    client_id VARCHAR(50) PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    date_of_birth DATE
);

-- Create InvestmentType table
CREATE TABLE InvestmentType (
    investment_type_id SERIAL PRIMARY KEY,
    investment_type_name VARCHAR(50)
);

-- Create Investment table
CREATE TABLE Investment (
    investment_id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) REFERENCES Client(client_id),
    total_investment_amount DECIMAL(15, 2) NOT NULL,
    current_value DECIMAL(15, 2) NOT NULL,
    value_till_date DATE NOT NULL,
    investment_type_id INT REFERENCES InvestmentType(investment_type_id),
    start_date DATE,
    expected_return_rate DECIMAL(5, 2)
);

-- Create Payout table
CREATE TABLE Payout (
    payout_id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) REFERENCES Client(client_id),
    payout_date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    payout_type VARCHAR(50)
);

-- Create Transaction table
CREATE TABLE Transaction (
    transaction_id SERIAL PRIMARY KEY,
    investment_id INT REFERENCES Investment(investment_id),
    transaction_date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type VARCHAR(50)
);

-- Create Portfolio table
CREATE TABLE Portfolio (
    portfolio_id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) REFERENCES Client(client_id),
    portfolio_name VARCHAR(100),
    created_date DATE NOT NULL
);

