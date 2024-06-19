# Task Manager

Task Manager is a web application built with Ruby on Rails, designed to help users efficiently manage their tasks. The application leverages modern web technologies such as Importmaps, Hotwire, and Tailwind CSS to provide a seamless and responsive user experience.

## Features

- **User Authentication:** Secure user authentication using Devise for hassle-free account management.
- **Task Management:** Efficiently organize and manage tasks with categories and due dates.
- **Rich Text Editing:** Create detailed task descriptions with rich text editing capabilities.
- **Real-time Updates:** Utilizes Turbo Frames and Streams to deliver real-time updates without page reloads.
- **Responsive Design:** Responsive design powered by Tailwind CSS and Flowbite for a seamless experience across devices.

## Project Status

The project is actively maintained and regularly updated to incorporate new features, improvements, and bug fixes. Check the issues section for a list of known issues or to report a new one. Contributions are welcome!

## Getting Started

### Prerequisites

- Ruby (version 3.3.0)
- Rails (version 7.1.3.2)
- PostgreSQL

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/cimafrancamae/taskman.git

2. Navigate to the project directory:

   ```bash
   cd taskman
  
3. Install dependencies:

    ```bash
    bundle install

4. Set up the database:

    ```bash
    rails db:create
    rails db:migrate

5. Start the Rails server:

    ```bash
    rails server

6. Open your browser and visit http://localhost:3000 to view the application.


### Testing

Task Manager includes a comprehensive test suite to ensure stability and reliability. 
- **Run the tests with the following command:**

    ```bash
    rails test

Contributions to this project should include new tests when introducing features or fixing bugs.

## Usage

- Create an account or log in if you already have one.
- Add categories to organize your tasks.
- Create new tasks and assign them to specific categories.
- Manage your tasks - mark them as completed, edit, or delete.

## Screenshots

Login Page

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/72d472ba-5695-4d5b-8b2a-3f7dfd03892b">

Homepage

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/93417fe4-2928-43d1-98e5-2a54b554500c">

Task Creation

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/f32b5b5d-8865-414c-828d-297917ed8c5f">

Task Page

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/55e0477c-c7c6-4864-97f9-59f86fa3b75c">

Category Page

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/f4d29c33-9658-44c0-a507-73d34d8bd1d5">

Tasks Due

<img width="960" alt="image" src="https://github.com/cimafrancamae/taskman/assets/65450522/1ef1af34-5744-4049-815b-119ecceab3fe">



## Contributing

If you'd like to contribute, please fork the repository and create a new pull request. Issues and feature requests are also welcome!
