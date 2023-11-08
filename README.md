<h1>Vet-Clinic Database Project</h1>
Welcome to this project, where you'll employ a relational database to establish the foundational data framework for a veterinary clinic. Your tasks will be designing a table dedicated to housing details about various animals, populating it with relevant data, and executing queries to retrieve information.


## Before Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [⭐️ Show your support](#support)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet-Clinic Database <a name="about-project"></a>

Welcome to this project where we'll build a special database for a vet clinic. This database will hold information about different animals, like their names, when they were born, if they tried to escape, if they've been neutered, how heavy they are, and what kind of animal they are. We'll use a language called SQL to set up the database, put in some example info, and ask questions to get useful answers.


## 🛠 Built With <a name="built-with"></a>
The project is built using SQL for database management.
Getting Started

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Database Management:** Create and manage a relational database using SQL commands.
- **Data Manipulation:** Add, update, and remove data of the database using SQL statements.
- **Querying Data:** Utilize SQL queries to extract data from the database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

### 🛠 Setup <a name="setup"></a>

1. Clone this repository to your local machine:

```bash
git clone https://github.com/evanssnave/vet-clinic
```

2. Set up a PostgreSQL database named `vet_clinic`.

### Database Structure

The `schema.sql` file includes SQL commands to create the `animals` table with the following columns:

- `id`: A unique identifier for each animal.
- `name`: The name of the animal.
- `date_of_birth`: The birthdate of the animal.
- `escape_attempts`: The number of escape attempts made by the animal.
- `neutered`: A boolean indicating if the animal is neutered.
- `weight_kg`: The weight of the animal in kilograms.

You can execute the `schema.sql` file to create the table structure by running:

```bash
psql -d vet_clinic -a -f schema.sql
```

Make sure you have PostgreSQL set up on your computer.

## 🛠 Usage <a name="usage"></a>
The data.sql file has special instructions written in SQL. These instructions make pretend information go into the animals table. This way, the table gets filled up with details about lots of animals.

The queries.sql file has more SQL instructions. These help answer different questions about the animal info. The questions are about things like picking certain animals using rules, getting specific details, and doing math with all the info added up.

When you run these instructions and get answers, you can snap pictures of the results to show what you did.

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Kevin Cruz**
- GitHub: [EvansSnave](https://github.com/EvansSnave)
- Twitter: [Kroja13](https://twitter.com/Kroja13)
- LinkedIn: [Kevin Cruz](https://www.linkedin.com/in/kevin-cruz-25159a201/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **User Login:** Make a way for users to log in and do things based on what they're allowed to do.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and know someone who might find it helpful, please share it.
Or give it a **star** ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I want to give a big thanks to Microverse for this great opportunity.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/EvansSnave/vet-clinic/blob/create-tables/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>