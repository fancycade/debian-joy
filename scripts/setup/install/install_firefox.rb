def install_firefox()
  `sudo apt install firefox-esr`
  `cd ~/.mozilla/firefox/*.default`
  `echo 'user_pref("layout.css.devPixelsPerPx", "2");' > user.js`
  `cd ~/projects/debian-joy/scripts`
end
