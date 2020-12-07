# Pewlett-Hackard-Analysis
# Overview

Pewlett-Hackard, is about to face a complicated situation, where a big chunk of their workforce will be retiring soon. But they dont have complete and concrete information about "How Many" and "Who" part of the question.
So we have been approached by find out the critical parts of the information i.e.
1. No. of retiring employees for each Title.
2. No. of eligible employees who are eligible to participate in a mentorship program.

To answer the above questions we have first migrated the company HR data from excel sheets to SQL DB - PostgreSQL-12.
After importing all the CSV files to the PostgreSQL DB we have created and executed many SQL queries to get the required information form the current data.

To answer the first question we first created a SQL query where we have retrieved the titles of current employees who were born between January 1, 1952 and December 31, 1955 and stored that in a table - **retirement_titles** and exported this table as **retirement_titles.csv**.
Now since an employee mayhave held multiple titles throughout his service period so we used **DISTINCT ON ()** function to get the latest title and stored this information in **unique_titles** table and exported this table as **unique_titles.csv.csv**.
At last, to get the total number of employees, retiring from each department, we used **count ()** function and saved this information in a new table - **retiring_titles** and exported it as **retiring_titles.csv**.


# Results:  

1. We can observe from the table **unique_titles** that there are **90,398** employees who will retiring from the **Pewlett Hackered**.
2. Company Management should focus on a strategy to train or hire new people for title **Senior Engineer and Senior Staff** as there would be almost **60K** employees which is around **57,668/90,398 = 63.79%** retiring from these 2 positions.
3. Therer are only **2** managerial retirees. 
4. There are more then **1500** employees who are prospective mentors.

# Summary: 

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  
    In total there are almost **90K** roles that would be getting vacant. The most impacted roles are  **Senior Engineer and Senior Staff** from **Silver Tsunami**.


---
<img src = ".\Data\retiring_titles.png"></img>
---

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

    We could identify **~1500** employees who are prospective mentors. As we know that there are almost **~90,000**  upcoming open positions, so if each employee has to become mentor then each of them has to train 60 new employees. 

---
<img src = ".\Data\mentorship_eligibility.png"></img>
---

## Additional Insights

    For additional insights, we can extract the data from the current employees table and identify the list of employees based on a set of predefined criteria such as "Time spent on a level/title" etc and they can be promoted to fill up the senior positions from within the company instead of hiring new people at seior positions.

    We can add the Salary details and their respective promotion dates to the data set.
