# R on OpenShift

Very simple way & interface to deploy R to OpenShift.

## Installation

In the steps my application is named "r", you can name it whatever you want.

First create a new application using the DIY cartridge with this reposiotry as a template

```
rhc app create r diy --from-code=https://github.com/openshift-quickstart/r-quickstart.git
```

once created, we need to setup R in the gear. This can not be automated, because the compilation process takes too long and the deployment timeouts and kills the compilation process.

```
rhc ssh r
cd app-root/repo
./deploy.sh
```

Once the process ends, R is ready to be used on OpenShift.

## Usage

This template comes with *extremely* simple interface to run R on OpenShift.

Simply navigate to your application URL - in my case would be

```
http://r-mjelen.rhcloud.com
```

and enter your R code on the left .... once you click the button, the code is sent to the backend and evaluated. The result is than displayed on the right side.