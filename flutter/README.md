# Medical Flutter Project

Welcome to the Medical Flutter Project, a part of our third subject project. In this assignment, we're tasked with developing a clone of a medical app.

## Getting Started with Development using Docker

Follow these steps to set up your development environment using Docker:

1. **Install Docker:** Make sure you have Docker installed on your system.

2. **Install VSCode:** If you haven't already, install Visual Studio Code, a powerful code editor.

3. **Install Dev Containers Extension:** In VSCode, install the "Remote - Containers" extension. This will allow you to work seamlessly within a containerized environment.

4. **Build the Docker Container:**
   - Launch VSCode.
   - Open the project folder.
   - Run the "Build Flutter container for development" task. This will create a Docker container configured for Flutter development.

5. **Run the Docker Container:**
   - Run the "Run Flutter container for development" task. This will start the Docker container.

6. **Attach to the Running Container:**
   - Utilize the Dev Containers extension to "Attach to running container."
   - This will open a new VSCode window within the containerized environment.

7. **Open the Project:**
   - Once attached to the container, navigate to the `/flutter/` folder within the new VSCode window.

8. **Install Flutter Extension:**
   - Install the Flutter extension within the containerized VSCode instance.

9. **Run Flutter Doctor:**
   - Open the integrated terminal in VSCode and execute `flutter doctor` to ensure everything is set up correctly.

10. **Run the App:**
    - In the VSCode debug section, choose "Flutter Web Server (Debug) for docker container" and start debugging.

11. **Setup Dart Debug Extension:**
    - Install the [Dart Debug Extension](https://chrome.google.com/webstore/detail/dart-debug-extension/eljbmlghnomdjgdjmbdekegdkbabckhm) in a Chromium-based browser.

12. **Access the App:**
    - In your browser, navigate to [http://localhost:9000](http://localhost:9000) to interact with the running app.
13. **Optional:**
    - If you dont want to have to vscode open to run the app, you can run the following command in the terminal to docker run -it --rm --name flutter-develop-container -v path-to/flutter flutter-dev to run the container 

Feel free to explore the functionalities and make your contributions to the Medical Flutter Project. If you have any questions or need assistance, don't hesitate to ask.


Let's create something great together! 🚀👩‍⚕️👨‍⚕️