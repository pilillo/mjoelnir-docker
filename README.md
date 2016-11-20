# mjoelnir-docker
A docker container for the Mjölnir energy management system.
More at: https://sourceforge.net/projects/mjoelnir/

Build the Dockerfile with: 
```docker build -t mjoelnir .```

Start the Docker container with:
```docker run -d -p 80:80 mjoelnir```

Mjölnir is now reachable from your host at: http://localhost/advisor/

Mind that a further configuration of connection settings might still be necessary.
Please consult the file /advisor/core/userSettings.php for further details.
