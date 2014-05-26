# Accelerometer Data

Describes each of the variables in the two files "AccelerometerData.txt" and "AverageAccelerometerData.txt"

## "AccelerometerData.txt"

### Column 1: Activity Label
Integer value taking one of the following values:

-1
-2
-3
-4
-5
-6

Labels what the test subject was doing when the accelerometer measurement was taken

### Column 2: Activity Name
Character value taking one of the following values:

-WALKING
-WALKING_UPSTAIRS
-WALKING_DOWNSTAIRS
-SITTING
-STANDING
-LAYING

The values in this column have a 1 to 1 relation with the values in column 1 as follows:

-1:WALKING
-2:WALKING_UPSTAIRS
-3:WALKING_DOWNSTAIRS
-4:SITTING
-5:STANDING
-6:LAYING

### Column 3: Subject ID
Integer taking a value between 1 and 30
Each unique value corresponds to a different test subject

### Columns 3 - 69: Accelerometer Data
Real numeric value between -1 and 1
Each column name indicates the specific type of measurement value, with the following format:

<Domain><Object><Reading Type><Aggregate Function><Axis Orientation>

##### Domain
One character indicating whether the reading is a time domain signal (t) or if a Fast Fourier Transform was performed to get the value (f)

##### Object
Either 'Gravity' or 'Body'

##### Reading Type
One of the following:

Acc
AccJerk
Gyro
GyroJerk
AccMag
AccJerkMag
GyroMag
GyroJerkMag
BodyAccJerkMag
BodyGyroMag
BodyGyroJerkMag

##### Aggregate Function
Either 'Mean' or 'Std'

##### Axis Orientation (optional)
Either 'X', 'Y', or 'Z'
Axis along which the reading is oriented
This is not present for magnitude reading types (reading types containing 'mag')