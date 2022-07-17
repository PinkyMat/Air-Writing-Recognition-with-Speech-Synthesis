**AIR WRITING RECOGNITION WITH SPEECH SYNTHESIS**

This project is a low-cost solution to translate air-written characters into speech enabling smooth communication for people with speech disorders. The system detects air drawn characters using Tesseract Optical Character Recognition engine. Image editor is created using MATLAB for text extraction, by comparing with built-in database of preprocessed characters. Text to speech translation feature is implemented by leveraging MATLAB TTR libraries.

![image](https://user-images.githubusercontent.com/89673773/179422865-fda81d78-edd5-4a26-be37-b4bc4f98645b.png)

**Steps to run the system:**

* Create MATLAB project and add all the files.

* Find Webcam ID using the following steps:
1. Click the Start button, located at the bottom left of the screen.
2. Open the Control Panel (as shown in red below).
3. Select Hardware and Sound.
4. Open Device Manager and double-click on Imaging Devices. Your webcam should be listed there.

* AirWriting.m is the main file. Replace Line 221 with the webcame ID. Run the file on MATLAB.
* Following GUI will appear.

![image](https://user-images.githubusercontent.com/89673773/179423377-ef00ba28-c3e3-47bb-9a6d-81a008c0b999.png)

* Click 'Start' button to begin writing with any pointed object in red and blue color, red on right side and blue on left side.
* Once you finish writing, flip the colors to store the text (blue on right side and red on left side).
* Click 'Speak' button to get the audio output of text.

