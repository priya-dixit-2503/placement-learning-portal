Placement Learning Portal - README

Checklist
- Install prerequisites: JDK 11+ (or 17), Maven, MySQL, Tomcat 10.x (Tomcat 10+ required because project uses jakarta.*)
- Create the database from `database.sql`
- Build the WAR with Maven
- Deploy the WAR to Tomcat's `webapps` folder
- Start Tomcat and open the app at the correct URL (see below)

1) Prerequisites
- Java (JDK 11 or 17). Ensure `java` and `javac` are on PATH and `JAVA_HOME` is set.
- Apache Maven (`mvn` on PATH).
- MySQL server running and accessible.
- Apache Tomcat 10.x (must be Tomcat 10+ because this project uses Jakarta Servlet 5.0 / `jakarta.*`).

2) Create the database
From a PowerShell prompt (adjust the MySQL user if not `root`):

```powershell
mysql -u root -p < "D:\Priyanka\placement-learning-portal\database.sql"
```

This creates the `placement_portal` database and seeds an admin user:
- email: admin@gmail.com
- password: admin123

3) Build the WAR
From the project root:

```powershell
cd "D:\Priyanka\placement-learning-portal"
mvn clean package
```

After a successful build the WAR will be at:
`target\placement-learning-portal-1.0.war`

4) Deploy to Tomcat
Copy the WAR into Tomcat's `webapps` folder. Replace the Tomcat path below with your installation path.

```powershell
$tomcatHome = "C:\apache-tomcat-10.0.x"   # <- change to your Tomcat folder
Copy-Item -Path .\target\placement-learning-portal-1.0.war -Destination "$tomcatHome\webapps\" -Force
```

Start Tomcat:

```powershell
& "C:\apache-tomcat-10.0.x\bin\startup.bat"
```

Access the app in a browser:
- If deployed as `placement-learning-portal-1.0.war`: http://localhost:8080/placement-learning-portal-1.0/
- To deploy as root (no path) rename the WAR to `ROOT.war` before copying. Example:

```powershell
# remove existing ROOT if present
Remove-Item -Recurse -Force "C:\apache-tomcat-10.0.x\webapps\ROOT" -ErrorAction SilentlyContinue
Copy-Item -Path .\target\placement-learning-portal-1.0.war -Destination "C:\apache-tomcat-10.0.x\webapps\ROOT.war" -Force
& "C:\apache-tomcat-10.0.x\bin\startup.bat"
# then open: http://localhost:8080/
```

5) Remote debugging (optional, for IntelliJ Community)
Start Tomcat with JPDA enabled (default port 5005):

```powershell
$env:JPDA_ADDRESS = "5005"
& "C:\apache-tomcat-10.0.x\bin\catalina.bat" jpda start
```

Create an IntelliJ Remote debug configuration and attach to `localhost:5005`.

6) Common troubleshooting
- Tomcat version: Must be Tomcat 10.x for `jakarta.*` imports. Tomcat 9 uses `javax.*` and will fail.
- Database connection: Check `src/main/java/com/placement/util/DBConnection.java`. Default values:
  - URL: `jdbc:mysql://localhost:3306/placement_portal`
  - USERNAME: `root`
  - PASSWORD: `root`
  Change these if your MySQL credentials differ.
- Missing MySQL driver: the WAR should include `mysql-connector-java` under `WEB-INF/lib`. To inspect the WAR:

```powershell
mkdir D:\tmp\war_expanded -Force
Expand-Archive -Path "D:\Priyanka\placement-learning-portal\target\placement-learning-portal-1.0.war" -DestinationPath D:\tmp\war_expanded -Force
Get-ChildItem -Path D:\tmp\war_expanded\WEB-INF\lib
```

- Logs: Tomcat logs are in `%CATALINA_HOME%\logs\` — check `catalina.*.log` and `localhost.*.log` for stack traces.

7) Notes for development
- Use the exploded WAR for faster iterative changes when using an IDE that supports deployment: deploy the exploded directory under `webapps`.
- If using IntelliJ Ultimate you can configure Tomcat in Run/Debug Configurations and deploy the exploded artifact directly from the IDE.

8) Useful commands summary (PowerShell)

```powershell
# Build
cd "D:\Priyanka\placement-learning-portal"
mvn clean package

# Create DB
mysql -u root -p < "D:\Priyanka\placement-learning-portal\database.sql"

# Deploy (change tomcat path)
$tomcatHome = "C:\apache-tomcat-10.0.x"
Copy-Item -Path .\target\placement-learning-portal-1.0.war -Destination "$tomcatHome\webapps\" -Force
& "$tomcatHome\bin\startup.bat"

# Start with debugger
$env:JPDA_ADDRESS = "5005"
& "$tomcatHome\bin\catalina.bat" jpda start
```

If you want, I can:
- Update `DBConnection.java` to read DB credentials from a `config.properties` file or environment variables.
- Add a simple `deploy-tomcat.ps1` script in the project root that automates build + deploy + start (I can create it for you).

If you'd like me to create the `deploy-tomcat.ps1` script and/or modify `DBConnection.java`, tell me which Tomcat path and MySQL credentials you want baked into the script (or I'll make them configurable with parameters).
