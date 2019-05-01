-- Give the total number of recordings in this table
select count(*) as "Total Number of Records"
from graded_classwork;

-- The number of packages listed in this table?
select count( distinct package) as "Total Number of Packages"
from graded_classwork;

-- How many times the package "Rcpp" was downloaded?
select count(package) as "Number of Package Rcpp Downloads"
from graded_classwork
where package='Rcpp';

--How many recordings are from China ("CN")?
select count(country) as "Number of Records from China"
from graded_classwork
where country='CN';

-- Give the package name and how many times they're downloaded.
-- Order by the 2nd column descending.
select package, count(package) as "Number of Downloads"
from graded_classwork
group by package
order by count(package) desc;

-- Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package, count(package) as "Number of Downloads"
from graded_classwork
where time between '09:00:00' and '11:00:00'
group by package
order by count(package) desc;

-- How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select country, count(package)
from graded_classwork
where country in ('CN', 'JP', 'SG')
group by country;

-- Print the countries whose downloaded are more than the downloads from China ("CN")
select country, count(package) as "Number of Downloads"
from graded_classwork
group by country
having count(package)>
       (select count(package)
       from graded_classwork
        where country='CN');

-- Print the average length of the package name of all the UNIQUE packages
select avg(char_length(package)) as "Average Name Length"
from graded_classwork;

-- Get the package whose downloading count ranks 2nd
-- (print package name and it's download count).
select distinct package, count(package) as "Number of Downloads"
from graded_classwork
group by package
order by count(package) desc
offset 1
limit 1;

-- Print the name of the package whose download count is bigger than 1000.
select package, count(package) as "Number of Downloads"
from graded_classwork
group by package
having count(package) > 1000
order by count(package) desc;

-- The field "r_os" is the operating system of the users.
-- Here we would like to know what main system we have,
-- the relevant counts, and the proportion (in percentage).
select r_os, count(r_os) as "Number of Systems", ((count(r_os))/(count(*))*100) as "Percentage"
from graded_classwork
group by r_os
order by "Number of Systems" desc;
