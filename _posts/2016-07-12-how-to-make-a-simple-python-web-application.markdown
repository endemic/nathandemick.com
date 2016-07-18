---
layout: post
status: publish
published: false
title: How to make a simple Python web application
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-07-12 15:22:29 -0400
categories:
- programming
tags:
- python
- tutorial
- webapps
comments: []
---
1. Install Python on the computer you will use for development (https://www.python.org/downloads/)
  * I installed Python 3 for OS X
  * OS X has a built-in Python at `/usr/bin/python`, which is 2.7
  * The Python installer will install `python3.5` into `/usr/local/bin`

2. Get into your terminal!
  * Create a directory to hold the project
  * Move inside the directory, then create a "virtual environment" to encapsulate
    the Python environment (interpreter, packages, etc.) that the app will use
    * This is very similar to any other environment management tool, such as nvm, rvm, rbenv, etc.
  * http://docs.python-guide.org/en/latest/dev/virtualenvs/
  * I'm naming my virtual environment folder "venv" and making sure it uses Python 3.5: `virtualenv -p python3.5 venv`
  * Activate the environment: `source venv/bin/activate`
  * You should see the name of the virtual environment in parentheses on your prompt
    * If you're working with many different projects, you could name the virtualenv folder
      something more descriptive, like "my_project_venv"
  * (When you're done, type `deactivate` to get out of the virtual environment)
  * Now install the package dependency we'll use for the webapp: [CherryPy](http://www.cherrypy.org/)
    * `pip install cherrypy`
    * Why CherryPy?
      * Dead simple
      * Few dependencies
      * Includes its own (fast) HTTP server, so you don't need to use an app server
        to run your app (e.g. you can't use WebBrick to serve Rails applications, you
        need to use Puma or Thin or Whatever, but CherryPy can use itself)
  * Freeze the list of deps so we can easily re-install everything when the app is run on an actual server: `pip freeze > requirements.txt`

3. Awww yiss! Let's start coding!
  * Create a Python source file, `server.py`
  * Paste the following:
      ```
      import cherrypy

      class HelloWorld(object):
          def index(self):
              return "Hello World!"
          index.exposed = True

      cherrypy.quickstart(HelloWorld())
      ```
  * Run the app! `python server.py` and go to http://localhost:8080/ to see the
    (simple) app being served from your computer.

4. Development environment setup complete! What's next?
  * I want an app that will randomly show a banner or badge for an affiliate program
  * I want the app to be hosted on my own domain, so that ad-blockers won't be bothered by it
  * I want to create banner/badge images myself (or at least choose which ones I show),
    so that visitors are shown something that I approve
  * I want to "weight" certain banners/badges so they are displayed more often
  * I want to be able to easily test a banner that I add to the system, to ensure
    that the image displays and the referral link is correct
  * I want to be able to track the number of clicks on each banner (views/impressions
    don't really matter for affiliate links)
  * I will manage banner inventory by directly modifying the app's database, because I'm too lazy to create a GUI

5. Schema CREATE!
  * Let's use SQLite as the database for this application
    * It's reasonably fast, especially for personal/hobbyist projects
    * The database is a file; easy-peasy to back up and/or restore
    * No extra database application/server to deal with
  * ```
    CREATE TABLE "units" (
       "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
       "imgsrc" TEXT NOT NULL,
       "description" TEXT NOT NULL,
       "url" TEXT NOT NULL,
       "weight" REAL NOT NULL DEFAULT 1.0,
       "clicks" INTEGER NOT NULL DEFAULT 0,
       "active" INTEGER NOT NULL DEFAULT 0
    );
    ```

6. Routes CREATE!
  * GET /
    Get a JSON representation of a "random" banner unit, so it can be embedded/displayed in a page
  * GET /:id
    Get a JSON representation of a _specific_ banner unit (for testing or whatever)
  * GET /:id/forward
    Forward user to end `url`, of a unit, after incrementing the `clicks` column
