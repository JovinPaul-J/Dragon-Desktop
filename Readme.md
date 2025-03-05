# 🐉 **Dragon Desktop** 🖥️

This project demonstrates how to set up a **VNC server** inside a **Docker container** with **SSL/TLS encryption** and create an **Electron app** to securely view the remote desktop via WebSocket. 🔒

## **Project Overview** 🌐

This project enables you to securely access a remote desktop hosted inside a Docker container using **TigerVNC**, **noVNC**, and **Electron**. The VNC server runs inside a Docker container, with SSL/TLS encryption for secure connections. The Electron app connects to the server via WebSocket and renders the remote desktop in a web-based interface.

### **Key Components** 🔑
- **Docker** 🐳: Containerization platform to encapsulate the VNC server and its dependencies.
- **Ubuntu MATE** 🖥️: Lightweight desktop environment installed inside the Docker container.
- **TigerVNC** 🖥️: VNC server used for sharing the desktop.
- **noVNC** 🌐: A WebSocket-to-VNC gateway to access the desktop via a web browser.
- **Electron** 💻: Framework to build cross-platform desktop applications with web technologies, used here to create the VNC client app.

## **Features** 🌟

- **Secure Connection** 🔐: VNC server with SSL/TLS encryption using a self-signed certificate.
- **Cross-Platform Access** 🌍: Electron app allows access to the remote desktop from any platform (Windows, macOS, Linux).
- **WebSocket Integration** 🔗: Connect to the VNC server through WebSocket for seamless interaction.
- **Dockerized Environment** 🐳: The VNC server runs inside a Docker container, making it easy to deploy and manage.

## **Prerequisites** ⚙️

Before you begin, ensure you have the following installed:
- **Docker** 🐳: To build and run the container.
- **Node.js** 🌱: To run the Electron app.
- **npm or yarn** 🧶: For managing Electron app dependencies.

## **Getting Started** 🚀

Follow these steps to get the project running on your local machine.

### 1. Clone the Repository

```bash
git clone https://github.com/JovinPaul-J/dragon-desktop.git
cd dragon-desktop
```

### 2. Build the Docker Image

Build the Docker image using the provided `Dockerfile`:

```bash
docker build -t dragon-container .
```

### 3. Run the Docker Container

Start the container with the appropriate ports exposed:

```bash
docker run -d -p 5901:5901 dragon-container
```

This will start the VNC server on port `5901` inside the container. You can access the remote desktop through **localhost** or the Electron app.

### 4. Configure SSL/TLS (Optional)

The project includes a self-signed SSL certificate. You can generate your own certificates if needed or modify the existing ones in the `ssl-certs` folder. To generate a new certificate, run:

```bash
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/ssl/private/vnc.key -out /etc/ssl/certs/vnc.crt
```

### 5. Start the Electron App

Navigate to the `electron-app` directory and install the dependencies:

```bash
cd App
npm install
```

Then, start the Electron app:

```bash
npm start
```

The Electron app will open a window showing the remote desktop from the Docker container.

### 6. Access the Remote Desktop via **localhost** 🌐

In addition to the Electron app, you can also access the remote desktop via your web browser. To do so, open the browser and navigate to:

```text
https://localhost:6080
```

This will open the **noVNC** web interface, where you can securely interact with the remote desktop using the `wss://` protocol.

## **How It Works** 🔧

1. **VNC Server** 🖥️: Inside the Docker container, we run a **TigerVNC** server on port `5901` with SSL/TLS encryption enabled.
2. **noVNC WebSocket** 🌐: The VNC server is connected to **noVNC**, which listens for WebSocket connections and provides the graphical interface in the browser.
3. **Electron App** 💻: The Electron app connects to the VNC server over WebSocket (`wss://`) and securely renders the desktop.

### **Electron App Details** 📱
The Electron app is built using Web technologies (HTML, JavaScript, and CSS) and communicates with the VNC server using the **noVNC** library. The app is designed to make it easy for users to access a remote desktop securely and interactively.

## **Security** 🔒

- The connection to the VNC server is encrypted using **SSL/TLS**.
- The Electron app uses the `wss://` (WebSocket Secure) protocol to ensure the data is transmitted securely.
- The project uses **self-signed certificates** for SSL. You can replace them with certificates from a trusted Certificate Authority (CA) in a production environment.

## **Testing** 🧪

1. **Start the Docker container**: Ensure that the VNC server is running inside the Docker container with SSL/TLS enabled.
2. **Run the Electron app**: Start the Electron app, and you should see the remote desktop interface in the app window.
3. **Interact with the desktop**: You can interact with the desktop inside the Electron app just as you would with a local VNC client.
4. **Access via localhost**: Open your browser and visit `https://localhost:6080` to access the remote desktop interface directly via noVNC.

## **Troubleshooting** ⚠️

- **VNC Server Not Connecting**: Ensure the Docker container is running and that the VNC server is correctly configured with SSL.
- **Electron App Issues**: Ensure that you have installed the required dependencies (`npm install`) and are running the app in the correct directory (`electron-app`).
- **Certificate Errors**: If you're using self-signed certificates, you might encounter certificate warnings. You can add the certificate to your trusted store or disable warnings for testing purposes.

## **License** 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Author

**Jovin Paul J**

- Email: [jovinpaulj@gmail.com](mailto:jovinpaulj@gmail.com)
- GitHub: [https://github.com/JovinPaul-J](https://github.com/JovinPaul-J)
- LinkedIn: [https://www.linkedin.com/in/jovin-paul-j-772658324](https://www.linkedin.com/in/jovin-paul-j-772658324)

---
