import pymysql
import os
from flask import *
from werkzeug.utils import secure_filename
dt = Flask(__name__)
dt.secret_key = 'abc'
con = pymysql.connect(host='localhost',user='root',password='root',port=3306,db='smartlicense',charset='utf8')
cmd = con.cursor()
import random
import smtplib
from email.mime.text import MIMEText


@dt.route("/logincheck", methods=['GET', 'POST'])
def logincheck():
    try:
        username = request.args.get("UserName")
        password = request.args.get("Password")

        # Using parameterized query to prevent SQL injection
        cmd.execute("SELECT * FROM login WHERE username=%s AND password=%s", (username, password))
        result = cmd.fetchone()

        if result is None:
            return jsonify({'task': "invalid"})
        elif result[3] == 'user':
            print("anoo",result[4])
            return jsonify({'task': "success", 'loginid': result[0], 'type': result[3],'ano':result[4]})
        elif result[3] == 'traffic':
            return jsonify({'task': "success", 'loginid': result[0], 'type': result[3],'ano':result[4]})
    except Exception as e:
        print(e)  # Log the error for debugging
        return jsonify({'task': "error", 'message': 'An error occurred while processing your request'})

    # Close the database connection after execution


# @dt.route("/userregister", methods=['POST'])
# def userregister():
#     print("dfgbhnjm")
#     try:
#         print(request.form)
#         name = request.form.get("username")
#         email = request.form.get("email")
#         print("email",email)
#         password = request.form.get("password")
#         print("pass",password)
#         Adharno = request.form.get("adhaar_number")
#         dob = request.form.get("dob")
#         bloodgroup = request.form.get("bloodgroup")
#         gender = request.form.get("gender")
#         import datetime
#         fn = datetime.datetime.now().strftime("%Y%m%d_%H%M%S") + ".jpg"
#         print(fn)
#         img = request.files["image"]
#         img1=secure_filename(img.filename)
#         img.save(os.path.join('./static/photo',img1))
@dt.route("/userviewvehicle", methods=['get'])
def userviewvehicle():
    adharnum=request.args.get("adharnum")
    cmd.execute("SELECT * FROM `vehicle_registration` WHERE adharnumber='"+adharnum+"'")
    s = cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/userviewliscence", methods=['get'])
def userviewliscence():
    print(request.args)
    adharnum=request.args.get("adharnum")
    cmd.execute("select * from `licence_registration` where adharnumber='"+adharnum+"'")
    s = cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/userviewfine", methods=['get'])
def userviewfine():
    vehiclenum=request.args.get("vehiclenum")
    cmd.execute("select * from fine where vehiclenumber='"+vehiclenum+"'")
    s = cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/rtoviewvehicle", methods=['get'])
def rtoviewvehicle():
    print(request.args)
    vehiclenum=request.args.get("vehiclenum")
    cmd.execute("select * from vehicle_registration where `Registration_number`='"+vehiclenum+"'")
    s = cmd.fetchall()
    print(s)
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/insertfine",methods=['post','get'])
def insertfine():
    photo = request.files.get("Photo")
    photo1 = secure_filename(photo.filename)
    photo.save(os.path.join("static/images", photo1))
    print(photo)
    offence=request.form.get("offence")
    fineamount=request.form.get("fineamount")
    vehiclenumber=request.form.get("vehiclenumber")

    cmd.execute("insert into fine values(null,'"+photo1+"','"+offence+"','"+fineamount+"','"+vehiclenumber+"')")
    con.commit()
    import smtplib
    from email.mime.text import MIMEText
    cmd.execute("SELECT `email` FROM `vehicle_registration` WHERE Registration_number='" + vehiclenumber + "'")
    result = cmd.fetchone()
    mymail = result[0]
    print(mymail)
    try:
        gmail = smtplib.SMTP('smtp.gmail.com', 587)
        gmail.ehlo()
        gmail.starttls()
        gmail.login('rto.keralaa@gmail.com', 'kyuj nfal fopt gtwd')
        # cmd.execute("SELECT result,test FROM result WHERE `logid`='" + loginid + "'")
        # result1 = cmd.fetchone()[0]
        # result2 = cmd.fetchone()[1]
        # print(result2)
        msg_body = "you violited a traffic rule you have a  fine : fine amount is ::" + fineamount
        msg = MIMEText(msg_body)
        msg['Subject'] = 'result'
        msg['To'] = mymail
        msg['From'] = 'rto.keralaa@gmail.com'
        gmail.send_message(msg)
        gmail.quit()
        return ({'task': 'success'})
    except Exception as e:
        return ({'task': 'cannotsend'})

@dt.route("/rtoviewliscence", methods=['get'])
def rtoviewliscence():
    liscencenum=request.args.get("liscencenum")
    cmd.execute("select * from `licence_registration` where `Licence_No`='"+liscencenum+"'")
    s = cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/adharbaseduserview", methods=['get','post'])
def adharbaseduserview():
    print(request.args)
    adhar=request.args.get("adhar")
    cmd.execute("SELECT  `vehicle_registration`.*,`licence_registration`.`Phone`,`licence_registration`.`DOB`,`licence_registration`.`Gender` FROM `vehicle_registration` JOIN `licence_registration` ON `licence_registration`.`adharnumber`=`vehicle_registration`.`adharnumber` WHERE `vehicle_registration`.`adharnumber`='"+adhar+"'")
    res=cmd.fetchall()
    print(res)
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in res: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)

# @dt.route("/adharbaseduserview", methods=['GET', 'POST'])
# def adharbaseduserview():
#     print(request.args)
#     adhar = request.args.get("adhar")
#     cmd.execute("SELECT `vehicle_registration`.*, `licence_registration`.`Phone`, `licence_registration`.`DOB`, `licence_registration`.`Gender` FROM `vehicle_registration` JOIN `licence_registration` ON `licence_registration`.`adharnumber` = `vehicle_registration`.`adharnumber` WHERE `vehicle_registration`.`adharnumber` = %s", (adhar,))
#     res = cmd.fetchall()
#     print(res)
#     json_data = []
#     for result in res:
#         json_data.append(result)
#     print(json_data)
#     return jsonify(json_data)
@dt.route("/generateusernameandpassword", methods=['get','post'])
def generateusernameandpassword():
    print("frtgc")
    adhar=request.args.get("adhar")
    username = request.args.get("username")
    password = request.args.get("password")
    cmd.execute("select * from login where username='"+username+"'  ")
    s=cmd.fetchone()
    if s==None:
        cmd.execute("insert into login values(null,'"+username+"','"+password+"','user','"+adhar+"')")
        con.commit()
        return jsonify({'task': 'success'})
    else:
        return jsonify({'task': 'already existed user'})




# embedded part
@dt.route("/alertnotification", methods=['get','post'])
def alertnotification():
    #liscence=request.args.get("liscence")
    #vehicle=request.args.get("vehicle")
    liscence=request.form['lic']
    vehicle=request.form['vno']
    print(liscence)
    print(vehicle)
    cmd.execute("SELECT `adharnumber` FROM `licence_registration` WHERE `Licence_No`='"+liscence+"'")
    resliscence=cmd.fetchone()[0]
    print(resliscence)
    cmd.execute("SELECT `adharnumber` FROM  `vehicle_registration` WHERE `Registration_number`='" + vehicle + "'")
    resvehicle = cmd.fetchone()[0]
    print(resvehicle)
    if resliscence==resvehicle:
        return jsonify ({'task':'a'})
    else:
        cmd.execute("insert into notification values(null,'"+vehicle+"','"+liscence+"',curdate(),curtime(),'notify')")
        con.commit()
        import smtplib
        from email.mime.text import MIMEText
        cmd.execute("SELECT `email` FROM `vehicle_registration` WHERE `adharnumber`='"+resvehicle+"'")
        result=cmd.fetchone()
        mymail = result[0]
        print(mymail)
        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('rto.keralaa@gmail.com', 'kyuj nfal fopt gtwd')
            # cmd.execute("SELECT result,test FROM result WHERE `logid`='" + loginid + "'")
            # result1 = cmd.fetchone()[0]
            # result2 = cmd.fetchone()[1]
            # print(result2)
            msg_body = "some one is trying to access your car"+vehicle
            msg = MIMEText(msg_body)
            msg['Subject'] = 'result'
            msg['To'] = mymail
            msg['From'] = 'rto.keralaa@gmail.com'
            gmail.send_message(msg)
            gmail.quit()
            return jsonify({'result': 'success'})
        except Exception as e:
            return jsonify({'result': 'error'})

@dt.route("/insert_readings", methods=['get','post'])
def insert_readings():
    print(request.form)
    liscence=request.form['lic']
    vehicle=request.form['vno']
    speed=request.form['speed']
    alcohol=request.form['alco']
    lattitude=request.form['lati']
    longitude=request.form['longi']
    cmd.execute("insert into `vechiclestatus` values(null,'"+vehicle+"','"+liscence+"','"+speed+"','"+alcohol+"','"+lattitude+"','"+longitude+"',curdate(),curtime())")
    con.commit()
    return jsonify({'task': 'success'})

# //
@dt.route("/viewnotification", methods=['get','post'])
def viewnotification():
    print(request.args)
    vehicleno = request.args.get("vehicleno")
    cmd.execute("SELECT * FROM notification WHERE `vehicle_no`='" + vehicleno + "' AND STATUS='notify' ORDER BY id DESC")
    res = cmd.fetchall()
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in res: json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@dt.route("/ownerallow", methods=['get','post'])
def ownerallow():
    vehiclenum=request.args.get("vehiclenum")
    cmd.execute("UPDATE `notification` SET STATUS='allow' WHERE `vehicle_no`='"+vehiclenum+"'")
    con.commit()
    return({'task':'allowed'})

@dt.route("/ownerreject", methods=['get', 'post'])
def ownerreject():
    vehiclenum = request.args.get("vehiclenum")
    cmd.execute("UPDATE `notification` SET STATUS='reject' WHERE `vehicle_no`='" + vehiclenum + "'")
    con.commit()
    return ({'task': 'rejected'})
@dt.route("/checkuserdecision", methods=['get', 'post'])
def checkuserdecision():
      vehiclenum=request.args.get("vehiclenum")
      cmd.execute("select * from notification where vehicle_no='"+vehiclenum+"' and status='allow'")
      res = cmd.fetchall()
      row_headers = [x[0] for x in cmd.description]
      json_data = []
      for result in res: json_data.append(dict(zip(row_headers, result)))
      print(json_data)
      return jsonify(json_data)
@dt.route("/viewaccessedpeople", methods=['GET'])
def viewaccessedpeople():
    print("FFG",request.args)
    vehicleno = request.args.get("vehicleno")
    cmd.execute("SELECT notification.*, licence_registration.*,`vechiclestatus`.* FROM notification JOIN licence_registration ON notification.licence_number = licence_registration.Licence_No JOIN `vechiclestatus` ON  `vechiclestatus`.`Vehicle_number`=`notification`.`vehicle_no` WHERE notification.vehicle_no =%s  AND notification.status = 'allow' ORDER BY notification.id DESC LIMIT 5", (vehicleno,))
    data = cmd.fetchall()
    print("bbhn",data)

    if data:
        # Extract column names
        row_headers = [x[0] for x in cmd.description]
        # Convert data to JSON format
        json_data = [dict(zip(row_headers, result)) for result in data]
        return jsonify(json_data)
    else:
        return jsonify({"message": "No data found for the given vehicle number and status 'allow'"}), 404


@dt.route("/getprofile", methods=['GET'])
def getprofile():
    adhar_num = request.args.get("adharnum")
    user_type = request.args.get("type")

    if user_type == 'traffic':
        cmd.execute("SELECT login.*, traffic_reg.* FROM login JOIN traffic_reg ON traffic_reg.loginid = login.id WHERE login.adhar_number=%s", (adhar_num,))
    elif user_type == 'user':
        cmd.execute("SELECT * FROM licence_registration WHERE adharnumber=%s", (adhar_num,))

    data = cmd.fetchall()

    if data:
        # Extract column names
        row_headers = [x[0] for x in cmd.description]
        # Convert data to JSON format
        json_data = [dict(zip(row_headers, result)) for result in data]
        return jsonify(json_data)
    else:
        return jsonify({"message": "No data found for the given Aadhar number and type"}), 404

@dt.route("/checkotp",methods=['post','get'])
def checkotp():
    email = request.args.get("email")
    print(email)
    otp=request.args.get("otp")
    cmd.execute("SELECT * FROM `login` WHERE `username`='"+email+"'")
    s=cmd.fetchone()

    lid=s[0]
    print("logid")
    print(lid)
    cmd.execute("SELECT * FROM `otp` WHERE `logid`='"+str(lid)+"' ORDER BY `id` DESC")
    re=cmd.fetchone()
    otp_value = re[2]
    print(otp_value)
    if otp==otp_value:
        password=request.args.get("password")
        print(password)
        cmd.execute("UPDATE login SET `password`='"+password+"' WHERE `id`='"+str(lid)+"'")
        con.commit()
        return jsonify({'status': 'sucess', 'message': 'Success'})
    else:
        return jsonify({'status': 'error', 'message': 'Incorrect OTP'})


@dt.route("/forgot_password", methods=['POST','get'])
def forgot_password():
    print(request.args)
    print("dfghj")
    # email = request.json.get('email')
    email_id = 'www.yaswanth534@gmail.com'
    list_of_chars1 = "2345698"
    otp = "11"
    length1 = 3
    for _ in range(length1):
        otp += random.choice(list_of_chars1)

    mymail = request.args.get('email')
    print(mymail)# Fetch the email address
    cmd.execute("SELECT * FROM `login` WHERE `username`='"+mymail+"'")

    result=cmd.fetchone()
    print(result)
    if result:
        lid = result[0]
        # mymail='anjuraj118@gmail.com'

        try:
                    gmail = smtplib.SMTP('smtp.gmail.com', 587)
                    gmail.ehlo()
                    gmail.starttls()
                    gmail.login('www.yaswanth534@gmail.com', 'pwky dxtb sgez lxja')

                    msg = MIMEText("Your otp number is: " + otp)
                    msg['Subject'] = 'otp'
                    msg['To'] = mymail
                    msg['From'] = 'www.yaswanth534@gmail.com'

                    gmail.send_message(msg)
                    gmail.quit()
                    cmd.execute("INSERT INTO `otp` VALUES(NULL,'"+str(lid)+"','"+otp+"')")
                    con.commit()
                    return jsonify({'status': 'sucess', 'message': 'Success.'})
        except Exception as e:
                    print("Couldn't sendemail:",e)

                    return jsonify({'status': 'error', 'message': 'User notfound.'})
    else:
        return jsonify({'status': 'error', 'message': 'Incorrect Email.'})
@dt.route("/checking", methods=['POST','get'])
def checking():
    print("ok")
    cmd.execute("select * from notification order by id desc limit 1")
    res=cmd.fetchall()
    v=res[0][5]
    print(res[0][5])
    return jsonify({'result':'success','status':str(v)})
dt.run(host='0.0.0.0',port=5000)

