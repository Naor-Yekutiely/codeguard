rs.initiate( { _id: "rs0", members: [ { _id : 0, host : "mongodb1:27017" }, { _id : 1, host : "mongodb2:27017" }, { _id : 2, host : "mongodb3:27017" } ] } )
db.codegard.createCollection("codegard_cache");
db.codegard_cache.insertMany([
    {
        "name": "matplotlib",
        "description": "A plotting library for the Python programming language and its numerical mathematics extension NumPy"
    },
    {
        "name": "requests",
        "description": "A simple HTTP library for Python, built for human beings"
    },
    {
        "name": "scipy",
        "description": "A Python-based ecosystem of open-source software for mathematics, science, and engineering"
    },
    {
        "name": "numpy",
        "description": "A powerful N-dimensional array object and tools for working with these arrays"
    },
    {
        "name": "pandas",
        "description": "A library providing high-performance, easy-to-use data structures and data analysis tools"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pytest",
        "description": "A testing framework that makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries"
    },
    {
        "name": "tweepy",
        "description": "A Python library for accessing the Twitter API"
    },
    {
        "name": "flask",
        "description": "A microframework for Python based on Werkzeug, Jinja 2 and good intentions"
    },
    {
        "name": "django",
        "description": "A high-level Python Web framework that encourages rapid development and clean, pragmatic design"
    },
    {
        "name": "sqlalchemy",
        "description": "The Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL"
    },
    {
        "name": "gevent",
        "description": "A coroutine-based Python networking library that uses greenlet to provide a high-level synchronous API on top of the libev or libuv event loop"
    },
    {
        "name": "openpyxl",
        "description": "A library for reading and writing Excel 2010 xlsx/xlsm/xltx/xltm files"
    },
    {
        "name": "pyyaml",
        "description": "A YAML parser and emitter for Python"
    },
    {
        "name": "bs4",
        "description": "Beautiful Soup is a Python library designed for quick turnaround projects like screen-scraping"
    },
    {
        "name": "selenium",
        "description": "A portable framework for testing web applications"
    },
    {
        "name": "pytz",
        "description": "World timezone definitions, modern and historical"
    },
    {
        "name": "ipython",
        "description": "An enhanced interactive Python shell, providing tab completion, object introspection, and much more"
    },
    {
        "name": "scikit-learn",
        "description": "A simple and efficient tools for data mining and data analysis in Python"
    },
    {
        "name": "pymongo",
        "description": "Python driver for MongoDB, a document-oriented database"
    },
    {
        "name": "pygobject",
        "description": "A set of Python bindings to the GObject library"
    },
    {
        "name": "pycurl",
        "description": "A Python interface to libcurl, the multiprotocol file transfer library"
    },
    {
        "name": "pypdf2",
        "description": "A Pure-Python library built as a PDF toolkit"
    },
    {
        "name": "pyqt",
        "description": "Python bindings for the Qt cross-platform application and UI framework"
    },
    {
        "name": "xlrd",
        "description": "A library for reading data and formatting information from Excel files"
    },
    {
        "name": "pip",
        "description": "The Python package installer"
    },
    {
        "name": "virtualenv",
        "description": "A tool for creating isolated Python environments"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyinstaller",
        "description": "A program that converts (packages) Python programs into stand-alone executables"
    },
    {
        "name": "nltk",
        "description": "A suite of libraries and programs for symbolic and statistical natural language processing for English"
    },
    {
        "name": "pyodbc",
        "description": "An open source Python module that provides access to ODBC databases"
    },
    {
        "name": "pyserial",
        "description": "A Python interface to the RS-232 serial port"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyopencl",
        "description": "A Python wrapper for the OpenCL API"
    },
    {
        "name": "pycrypto",
        "description": "A collection of cryptographic algorithms and protocols, implemented for use from Python"
    },
    {
        "name": "pyspider",
        "description": "A powerful and versatile web crawler framework for Python"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pytest",
        "description": "A testing framework that makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries"
    },
    {
        "name": "fabric",
        "description": "A library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks"
    },
    {
        "name": "pexpect",
        "description": "A Pure Python Expect-like module"
    },
    {
        "name": "pygmaps",
        "description": "A Python wrapper for Google Maps API"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pylons",
        "description": "A lightweight web framework emphasizing flexibility and rapid development"
    },
    {
        "name": "pyqrcode",
        "description": "A pure Python QR Code generator"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyquery",
        "description": "A jQuery-like library for Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyside",
        "description": "A Python binding of the cross-platform GUI toolkit Qt"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyobjc",
        "description": "Python bindings for the Objective-C and Cocoa frameworks"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyinstaller",
        "description": "A program that converts (packages) Python programs into stand-alone executables"
    },
    {
        "name": "pyqrcode",
        "description": "A pure Python QR Code generator"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyquery",
        "description": "A jQuery-like library for Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyside",
        "description": "A Python binding of the cross-platform GUI toolkit Qt"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyobjc",
        "description": "Python bindings for the Objective-C and Cocoa frameworks"
    },
    {
        "name": "pyyaml",
        "description": "A YAML parser and emitter for Python"
    },
    {
        "name": "pywin32",
        "description": "A set of Python extensions for accessing the Win32 API"
    },
    {
        "name": "py2app",
        "description": "A Python setuptools command which will allow you to make standalone Mac OS X application bundles and plugins from Python scripts"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyqrcode",
        "description": "A pure Python QR Code generator"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyquery",
        "description": "A jQuery-like library for Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyside",
        "description": "A Python binding of the cross-platform GUI toolkit Qt"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyobjc",
        "description": "Python bindings for the Objective-C and Cocoa frameworks"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pycairo",
        "description": "Python bindings for the cairo graphics library"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyquery",
        "description": "A jQuery-like library for Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyside",
        "description": "A Python binding of the cross-platform GUI toolkit Qt"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyobjc",
        "description": "Python bindings for the Objective-C and Cocoa frameworks"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pywin32",
        "description": "A set of Python extensions for accessing the Win32 API"
    },
    {
        "name": "py2app",
        "description": "A Python setuptools command which will allow you to make standalone Mac OS X application bundles and plugins from Python scripts"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pyqrcode",
        "description": "A pure Python QR Code generator"
    },
    {
        "name": "pygments",
        "description": "A syntax highlighting package written in Python"
    },
    {
        "name": "pyquery",
        "description": "A jQuery-like library for Python"
    },
    {
        "name": "pyzmq",
        "description": "Python bindings for zeromq, a high-performance asynchronous messaging library"
    },
    {
        "name": "pyside",
        "description": "A Python binding of the cross-platform GUI toolkit Qt"
    },
    {
        "name": "py2exe",
        "description": "A distutils extension to create standalone Windows executable programs from Python scripts"
    },
    {
        "name": "pyobjc",
        "description": "Python bindings for the Objective-C and Cocoa frameworks"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    },
    {
        "name": "pycurl",
        "description": "A Python interface to libcurl, the multiprotocol file transfer library"
    },
    {
        "name": "pyglet",
        "description": "A cross-platform windowing and multimedia library for Python"
    },
    {
        "name": "pygame",
        "description": "A set of Python modules designed for writing games"
    }
]);