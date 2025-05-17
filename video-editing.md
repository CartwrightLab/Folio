# Video Editing

## Standard Tools

 - Recording: [OBS Studio](https://obsproject.com/)
 - Editing: [Shotcut](https://www.shotcut.org/)
 - Audio Recording and Editing: [Audacity](https://www.audacityteam.org/)
 - Images: [LuaLaTeX](https://www.luatex.org/) and [Tikz](https://tikz.net/)
 - Images: [ImageMagick](https://imagemagick.org)

## Audio Editing
 - Write a script.
 - Record the script in Audacity making changes as needed.
 - Export audio from Audacity using a WAV with pcm_s24le format.
 - Create a draft cut of the video with audio.
 - Listen to the draft and adjust the volume of any sections that need it.
 - Export the audio track from Audacity as a WAV in pcm_s24le format.
 - Import audio into Audacity. Listen to output and do a another pass volume adjustment as needed.
 - Apply EQ filter to remove non-speech sounds.
 - Remove background noise
 - Listen again and patch any clicks that remain.
 - Do Loudness Normalization (multiple options)
   - (1) Use the speechnorm filter in ffmpeg
     - E.G. ffmpeg -i main_temp.wav -filter:a speechnorm=p=0.67:e=5:r=0.001:l=1 -c:a pcm_s24le main_speechnorm.wav
   - (2) Use Audacity Filters
     - Normalize RMS to -20db
     - Soft Limit to -3.5db
   - (3) Use Audacity Compressor with Podcast preset followed by limitor with VO present
   - (4) Use Level Speech 2
  - Run ACX checks and Measure LUFS
  - Loudness: -18dB RMS is a typical value for speech. Youtube loudness spec is -14 LUFs.
  - CR has a loudness of -18.5 (Use a critical role video/clip as a reference next time)