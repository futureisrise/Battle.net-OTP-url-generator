# Battle.net OTP-url generator

## How to get BA-tassadar token
1. Open Developer tools in browser on Network section
2. Open http://account.battle.net
3. Sign in #*NOTE: You will receive this cookie only once when you sign in. If you signed in, log out and repeat*
4. Ctrl+F in developer tools and search - BA-tassadar=
<img src="https://github.com/user-attachments/assets/8068f153-d024-4a28-9be7-ec8dc028b702" width="500px">

## How to get Serial Key and Recovery code
<img src="https://github.com/user-attachments/assets/273a7991-a664-4b51-9bfa-837551c3a875" width="150px">
<img src="https://github.com/user-attachments/assets/bdfaed61-d6df-4c39-be94-825c47239400" width="150px">
<img src="https://github.com/user-attachments/assets/f9714dfd-c0c9-4209-a5dd-40ef2d56d7fc" width="150px">
<img src="https://github.com/user-attachments/assets/5fc8d45f-bab2-4191-ad18-f2cec09cd828" width="150px">

## Run script 
_Replace `BA_TASSADAR`, `SERIAL_NUMBER` and `RECOVERY_CODE` with your real data_

```shell
ruby generate_battle_net_otp.rb BA_TASSADAR SERIAL_NUMBER RECOVERY_CODE
```
As result you will get the next OTP-url
```
otpauth://totp/Battle.net?secret=YOUSECRETLINE&digits=8
```

## How to use generated url (1Password example)
1. Add One-time password field into your record  
</br><img src="https://github.com/user-attachments/assets/4a194dc2-2201-4c87-bc90-c798c68583af" width="500px"></br>
  
2. Insert your OTP-url given on previous step into appeared field.  
</br><img src="https://github.com/user-attachments/assets/b3e8c05d-0679-4c3c-86dd-d3342ff2d6e9" width="500px"></br>
  
