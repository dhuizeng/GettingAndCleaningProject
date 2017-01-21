---
title: "CodeBook"
output: html_document
---


## Data set description

This data set includes the average of the mean and standard deviation of every variable observed
in the test and training data for each subject and activity. Each of 30 subjects performed 6 activities resulting in 180 rows. The 68 variables attributed to each variable are described below.

## Variables

Each variable reported is either the average of the mean or the average of the standard deviation over the observations of a given subject performing a given activity. These are denoted in the data set by "variable-mean()" and "variable-std()", respectively. Some measurements are also broken up into the directional components x, y, and z. For brevity, these are grouped together in the variable description, since they differ only in their direction.

* activity: The activity a subject performed.
* subject id: The subject (1-30) associated with a given activity.
* tbodyacc-xyz: X, Y, and Z components of the subject's body acceleration.
* tgravityacc-xyz: X, Y, and Z components of the acceleration due to gravity.
* tbodyaccjerk-xyz: X, Y, and Z components of the rate of change of the subject's body acceleration.
* tbodygyro-xyz: X, Y, and Z components of the subject's angular velocity.
* tbodygyrojerk-xyz: X, Y, and Z components of the rate of change of the subject's angular velocity.
* tbodyaccmag: The magnitude of the subject's body acceleration.
* tgravityaccmag: The magnitude of the accerelation due to gravity.
* tbodyaccjerkmag: The magnitude of the rate of change of the subject's body acceleration.
* tbodygyromag: The magnitude of the subject's angular velocity.
* tbodygyrojerkmag: The magnitude of the rate of change of the subject's angular velocity.
* fbodyacc-xyz: X, Y, and Z components of the subject's body acceleration, in the frequency domain.
* fbodyaccjerk-xyz:  X, Y, and Z components of the rate of change of the subject's body acceleration, in the frequency domain.
* fbodygyro-xyz:  X, Y, and Z components of the subject's angular velocity, in the frequency domain.
* fbodyaccmag: The magnitude of the subject's body acceleration, in the frequency domain.
* fbodyaccjerkmag: The magnitude of the rate of change of the subject's body acceleration, in the frequency domain.
* fbodygyromag: The magnitude of the subject's angular velocity, in the frequency domain.
* fbodygyrojerkmag: The magnitude of the rate of change of the subject's angular velocity, in the frequency domain.
