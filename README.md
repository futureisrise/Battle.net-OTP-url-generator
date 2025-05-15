# Battle.net OTP-url generator

## How to get BA_TASSADAR token

1. Open your web browser (preferably in Incognito/Private mode)
2. Navigate to: https://account.battle.net/login/en/?ref=localhost
3. Log in to your Battle.net account.
4. You should land on a 'Page Not Found' or similar error page on 'localhost'. This is expected.
5. Look at the full URL in your browser's address bar.
6. Find the part that looks like `ST=XX-........` (where XX is region like US/EU/KR)
7. Copy the *entire* token value starting from the region prefix (e.g., 'US-abcdef1234567890abcdef1234567890').

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
  
