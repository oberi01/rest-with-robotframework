### Testing a Rest Service with Robotframework 
This project shows how to perform testing of a REST web service
using the Robot framework.

#### Prerequisites
A PC (windows, macOS, linux) with a python3.8 installation is suggested.
A virtual env for this project should be created, e.g. with the command

    python3 -m venv flask-rest

The required python modules need to be installed in the virtual environment, 
e.g. with the commands

    activate flask-rest
    cd <git clone folder of this project>
    pip install -r requirements.txt 

#### Server
The server is implemented as a flask app.
It can be started e.g. in PyCharm with a right click on api_pass.py and selecting run.

#### Client: curl
The server can be tested with the curl command.
Hint for windows users: curl is installed with git.

    curl http://127.0.0.1:5000/entries
#### Client: Robotframework (in short RF)
A test is started with the robot command which takes a .robot file as argument
that contains the test suite  

    robot client\api.robot

RF uses a keyword driven test approach. In the example the keywords
**Create Session** and **Get On Session** are used to perform a REST
get request in a test case called **Get Entries**:

    Get Entries
        Create Session    api   http://localhost:5000
        ${resp}  Get On Session   api    /entries

#### Behaviour Driven Test (BDD)
It is possible to write BDD test with Robot Framework.
The example **api_robot.robot** demonstrates this using an BDD-keyword
implementation layer **api_kw.robot**.