
Select *
FROM PortfolioProject..CovidDeath
WHERE continent is not null
order by 3,4


--Select *
--FROM PortfolioProject..CovidVaccination
--order by 3,4

-- Select Data that we are going to use.

  
Select Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeath
order by 1,2


--Looking at total cases vs total deaths
--likelihood of dying if contacted covid in your country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeath
Where location like '%states%'
order by 1,2


--looking at the total cases vs population
--shows what percentage of population got covid

Select Location, date, population, total_cases, (total_cases/population)*100 as DeathPercentage
FROM PortfolioProject..CovidDeath
Where location like '%states%'
--where location like'%states%'
order by 1,2

--looking at countries with highest infection rates compared to Population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as Percentpopulationinfected
FROM PortfolioProject..CovidDeath
--where location like'%states%'
Group by Location, population 
order by Percentpopulationinfected desc

--showing countries with highest death count per population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeath
--where location like'%states%'
WHERE continent is not null
Group by Location
order by TotalDeathCount desc

--LETS BREAK THINGS DOWN BY CONTINENT

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeath
--where location like'%states%'
WHERE continent is not null
Group by continent
order by TotalDeathCount desc


--showing continents with the highest death count per population


Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeath
--where location like'%states%'
WHERE continent is not null
Group by continent
order by TotalDeathCount desc



--Global Numbers

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeath
--Where location like '%states%'
Where continent is not null
--Group by date
order by 1,2
