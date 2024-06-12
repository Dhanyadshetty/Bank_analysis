CREATE DATABASE BANK;
USE BANK;
SELECT * FROM FINANCE1;
SELECT * FROM FINANCE2;

desc finance1;

#Year wise Loan Amount

select year, sum(loan_amnt) as loan_amnt
from finance1
group by year
order by year;

#Grade and sub grade wise revol_bal

select grade , sub_grade , sum(revol_bal) as revol_bal
from finance1
inner join finance2
on finance1.id = finance2.id
group by grade , sub_grade
order by grade , sub_grade;

#Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status , round(sum(total_pymnt),2) as total_payment
from finance1
inner join finance2
on finance1.id = finance2.id
group by verification_status
order by verification_status;

#State wise and last_credit_pull_d wise loan status

select addr_state , loan_status , last_credit_pull_d
from finance1
inner join finance2
on finance1.id = finance2.id
group by addr_state , loan_status , last_credit_pull_d
order by last_credit_pull_d;

#Home ownership Vs last payment date stats

select home_ownership , last_pymnt_d
from finance1
inner join finance2
on finance1.id = finance2.id
group by home_ownership , last_pymnt_d
order by home_ownership desc , last_pymnt_d desc;




