#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Create an attractive HTML page with CSS
echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Welcome to Terraform Deployment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            font-size: 36px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .content {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
        }
        p {
            font-size: 18px;
            color: #555;
        }
        .footer {
            font-size: 14px;
            color: #777;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class='content'>
    <h1>Welcome to Terraform Deployment</h1>
    <p>Terraform has successfully deployed your infrastructure!</p>
    <p>We hope you enjoy the simplicity of infrastructure as code!</p>
</div>

<div class='footer'>
    <p>Created by mR.Abhis on $(hostname)</p>
</div>

</body>
</html>" > /var/www/html/index.html
