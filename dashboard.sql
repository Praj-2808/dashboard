
CREATE TABLE Client (
    client_id VARCHAR(50) PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL
);

CREATE TABLE Investment (
    investment_id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) REFERENCES Client(client_id),
    total_investment_amount DECIMAL(15, 2) NOT NULL,
    current_value DECIMAL(15, 2) NOT NULL,
    value_till_date DATE NOT NULL
);

CREATE TABLE Payout (
    payout_id SERIAL PRIMARY KEY,
    client_id VARCHAR(50) REFERENCES Client(client_id),
    payout_date DATE NOT NULL,
    amount DECIMAL(15, 2) NOT NULL
);

--I will be making few changes to this tomorrow, probably going to add few more columns on client table.
