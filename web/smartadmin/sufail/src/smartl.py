import os
from turtle import update

import qrcode
from flask import *
import pymysql as pymysql
from werkzeug.utils import secure_filename

con = pymysql.connect(host="localhost", user="root",password="root",port=3306,db="smartlicense",charset="utf8")
cmd=con.cursor()
slicense=Flask(__name__)
slicense.secret_key="123"
import functools
def login_required(func):
    @functools.wraps(func)
    def secure_function():
        if "lid" not in session:
            return redirect("/")
        return func()

    return secure_function
@slicense.route('/logout')
def logout():
    session.clear()
    return redirect('/')
@slicense.route('/')
def login():
    return render_template('Login.html')
@slicense.route('/logincheck',methods=['post'])
def logincheck():
    username=request.form['textfield']
    password=request.form['textfield2']
    cmd.execute("select * from login where username='"+username+"' and password='"+password+"'")
    result=cmd.fetchone()
    if result is None:
        return '''<script>alert("INVALID USERNAME or PASSWORD");window.location='/'</script>'''
    elif result[3] == "ADMIN":
        session['lid']=result[0]
        return render_template("Admin.html")
    elif result[3] == "traffic":
         session['lid'] = result[0]
         return render_template("index.html")
@slicense.route('/adminhome')
def adminhome():
    return render_template("Admin.html")
@slicense.route('/licenseregister')
@login_required
def licenseregister():
    return render_template('Licencereg.html')
@slicense.route('/addlicencedetails',methods=['post'])
@login_required
def addlicencedetails():
    name=request.form['textfield']
    Licence_No=request.form['textfield2']
    AuthorizationToDrive=request.form['textfield3']
    Phone=request.form['number']
    adhar=request.form['adharnumber']
    Email=request.form['email']
    Issuedate=request.form['date']
    Validity=request.form['date2']
    Blood_group=request.form['textfield5']
    relation=request.form['relation']
    dob=request.form['date3']
    Gender=request.form['gender']
    Perment_Address=request.form['textarea4']
    Present_Address=request.form['textarea5']
    fileupload=request.files['fileField']
    fi = secure_filename(fileupload.filename)
    fileupload.save(os.path.join("static/images",fi))
    # Check if email already exists
    cmd.execute("SELECT * FROM licence_registration WHERE Email = %s", (Email,))
    existing_email = cmd.fetchone()

    if existing_email:
        return "Email Already Exists"

    cmd.execute("insert into licence_registration values(null,'" + name + "','" + Licence_No + "','" + AuthorizationToDrive + "','" + Phone + "','" + Email + "','" + Issuedate + "','" + Validity + "','" + Blood_group + "','" + relation + "','" + dob + "','" + Gender + "','" + Perment_Address + "','" + Present_Address + "','" + fi + "','null','pending','"+adhar+"')")
    id1 = cmd.lastrowid
    con.commit()
    cmd.execute("SELECT *FROM  licence_registration ORDER BY id DESC")
    res = cmd.fetchone()
    qrname = str(id1) + "." + "png"
    print(qrname)
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(res)
    qr.make(fit=True)

    # Create an image from the QR Code instance
    img = qr.make_image(fill_color="black", back_color="white")

    # Save the image
    qrs = "./static/QR/" + str(id1) + ".png"
    img.save(qrs)

    cmd.execute("update licence_registration set QR='" + qrname + "' where id='" + str(id1) + "'")
    con.commit()
    # img_name = str(id1) + ".png"
    # print("imggg--------------" + str(img_name))
    session['slot'] = qrname
    # big_code.png(qrs, scale=8, module_color=[0, 0, 0, 128], background=[0xff, 0xff, 0xff])
    import smtplib
    from email.mime.text import MIMEText

    # Assuming you have a database connection object named 'conn' and a cursor object named 'cmd'

    # Fetch username and password
    cmd.execute("SELECT Licence_No FROM licence_registration WHERE id = %s", (id1,))
    result = cmd.fetchone()[0]

    # Fetch email
    cmd.execute("SELECT Email FROM licence_registration WHERE id = %s", (id1,))
    mymail = cmd.fetchone()[0]  # Fetch the email address
    print(mymail)

    try:
        gmail = smtplib.SMTP('smtp.gmail.com', 587)
        gmail.ehlo()
        gmail.starttls()
        gmail.login('rto.keralaa@gmail.com', 'kyuj nfal fopt gtwd')

        msg = MIMEText("Sir/madam your Licence number is :'" + result + "'")
        msg['Subject'] = 'Licence  Number'
        msg['To'] = mymail
        msg['From'] = 'rto.keralaa@gmail.com'

        gmail.send_message(msg)
        gmail.quit()

    except Exception as e:
        print("Couldn't send email:", e)
    else:
        print("User not found.")

    return '''<script>alert("Success");window.location='/licence'</script>'''
@slicense.route('/licence')
@login_required
def licences():
    cmd.execute("select * from licence_registration")
    result=cmd.fetchall()
    return render_template('Licenceview.html',values=result)
@slicense.route('/licedtls',methods=['post'])
@login_required
def licedtls():
    text = request.form['Search']
    cmd.execute("SELECT * FROM licence_registration WHERE Licence_No='" + text + "'")
    result = cmd.fetchall()
    print(result)
    return render_template('Licenceview.html', values=result)
@slicense.route('/viewdetailslicence')
@login_required
def viewdetailslicence():
    vid=request.args.get("id")
    cmd.execute("select * from licence_registration where id='"+str(vid)+"'")
    result = cmd.fetchall()
    print(result)
    return render_template('MoreLicence.html', values=result)


@slicense.route('/licencedelete')
@login_required
def licencedelete():
    vid=request.args.get("id")
    cmd.execute("delete from licence_registration where id = '"+vid+"'")
    con.commit()
    return '''<script>alert("deleted");window.location='/licence'</script>'''
@slicense.route('/licenceedit')
@login_required
def licenceedit():
    eid=request.args.get("id")
    session['kid']=eid
    cmd.execute("select * from licence_registration where id='"+str(eid)+"'")
    result=cmd.fetchone()
    return render_template('Licenceregedit.html',values=result)
@slicense.route('/updatelicence',methods=['post'])
@login_required
def updatelicence():
    fid=session['kid']
    name = request.form['textfield']
    Licence_No = request.form['textfield2']
    AuthorizationToDrive = request.form['textfield3']
    Phone = request.form['number']
    Email = request.form['email']
    Issuedate = request.form['date']
    Validity = request.form['date2']
    Blood_group = request.form['textfield5']
    relation = request.form['relation']
    dob = request.form['date3']
    Gender = request.form['gender']
    Perment_Address = request.form['textarea4']
    Present_Address = request.form['textarea5']
    cmd.execute("update licence_registration set Name='"+name+"', Licence_No='"+Licence_No+"',Authorization_To_Drive='"+AuthorizationToDrive+"',Phone='"+Phone+"',Email='"+Email+"',Date_of_Issue='"+Issuedate+"',validity='"+Validity+"',Blood_Group='"+Blood_group+"',relation='"+relation+"',DOB='"+dob+"',Gender='"+Gender+"',Permanent_Address='"+Perment_Address+"',Present_Address='"+Present_Address+"'where id = '"+fid+"'")
    con.commit()
    return '''<script>alert("updated");window.location='/licence'</script>'''
@slicense.route('/changeimage')
@login_required
def changeimage():
    return render_template('changeimage.html')
@slicense.route('/updateimage',methods=['POST'])
@login_required
def updateimage():
    cid = session['kid']
    fileupload = request.files['fileField']
    fi = secure_filename(fileupload.filename)
    fileupload.save(os.path.join("static/images", fi))
    cmd.execute("update licence_registration set photo='"+fi+"' where id ='"+cid+"'")
    con.commit()
    return '''<script>alert("image updated");window.location='/licence'</script>'''


@slicense.route('/vehiclereg')
@login_required
def vehiclereg():
   return render_template('vechiclereg.html')
@slicense.route('/addvehicle',methods=['post'])
@login_required
def addvehicle():
    Registration_number = request.form['registration_number']
    Brief_discription = request.form['brief_description']
    Address=request.form['address']
    Makers_Name=request.form['makers_name']
    Name_of_Regd_Owner=request.form['name_of_owner']
    relation=request.form['relationship']
    Temporary_address=request.form['temporary_address']
    Class_of_vechicle=request.form['vehicle_class']
    Makers_Classification=request.form['makers_classification']
    Type_of_body=request.form['body_type']
    Chassis_Number=request.form['chassis_number']
    Engine_Number=request.form['engine_number']
    Fuel=request.form['fuel']
    Colour=request.form['colour']
    Month_of_Manufacture=request.form['manufacture_month']
    Year_of_Manufacture=request.form['manufacture_year']
    Horse_Power=request.form['horse_power']
    Weight=request.form['weight']
    Number_of_cilinders=request.form['cylinders']
    Seating_Capacity=request.form['seating_capacity']
    Tax_licence_No=request.form['tax_license_number']
    Date_of_Delivery=request.form['delivery_date']
    licnum=request.form['licnum']
    email=request.form['Email']
    adhar=request.form['adharnum']
    cmd.execute("INSERT INTO vehicle_registration values (null,'" + Registration_number + "','" + Brief_discription + "','" + Address + "','" + Makers_Name + "','" + Name_of_Regd_Owner + "','" + relation + "','" + Temporary_address + "','" + Class_of_vechicle + "','" + Makers_Classification + "','" + Type_of_body + "','" + Chassis_Number + "','" + Engine_Number + "','" + Fuel + "','" + Colour + "','" + Month_of_Manufacture + "','" + Year_of_Manufacture + "','" + Horse_Power + "','" + Weight + "','" + Number_of_cilinders + "','" + Seating_Capacity + "','" + Tax_licence_No + "','" + Date_of_Delivery + "','"+licnum+"','"+email+"','pending','"+adhar+"')")
    id=cmd.lastrowid
    con.commit()


    import smtplib
    from email.mime.text import MIMEText

    # Assuming you have a database connection object named 'conn' and a cursor object named 'cmd'

    # Fetch username and password
    cmd.execute("SELECT Registration_number FROM vehicle_registration WHERE id = %s", (id,))
    result = cmd.fetchone()[0]



        # Fetch email
    cmd.execute("SELECT email FROM vehicle_registration WHERE id = %s", (id,))
    mymail = cmd.fetchone()[0]  # Fetch the email address
    print(mymail)

    try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('rto.keralaa@gmail.com', 'kyuj nfal fopt gtwd')

            msg = MIMEText("Sir/madam Your vehicle registration number is :'"+result+"'")
            msg['Subject'] = 'Vehicle Registration Number'
            msg['To'] = mymail
            msg['From'] = 'rto.keralaa@gmail.com'

            gmail.send_message(msg)
            gmail.quit()

    except Exception as e:
            print("Couldn't send email:", e)
    else:
        print("User not found.")

        return '''<script>alert("Success");window.location='/viewvechicle'</script>'''
@slicense.route('/viewvechicle')
@login_required
def viewvechicle():
    cmd.execute("select * from vehicle_registration")
    result = cmd.fetchall()
    return render_template('vechicle.html', values=result)
@slicense.route('/vehicledtls',methods=['post'])
@login_required
def vehicledtls():
    text = request.form ['Search']
    cmd.execute("SELECT * FROM vehicle_registration WHERE Registration_number='" + text + "'")
    result = cmd.fetchall()
    print(result)
    return render_template('vechicle.html', values=result)
@slicense.route('/viewallvehicledetails')
@login_required
def viewallvehicledetails():
    vid=request.args.get("id")
    cmd.execute("select * from vehicle_registration where id='"+str(vid)+"'")
    result = cmd.fetchall()
    return render_template('MoreVechicle.html', values=result)

@slicense.route('/viewaccessed')
@login_required
def viewaccessed():
    vehiclenum=request.args.get("id")
    cmd.execute("SELECT `licence_number` FROM `notification` WHERE `status`='allow'AND `vehicle_no`='"+vehiclenum+"' ORDER BY `Date` DESC LIMIT 3")
    result2 = cmd.fetchall()
    print(result2)
    return render_template('Viewlist.html',value2=result2)

@slicense.route('/vehdelete')
@login_required
def vehdelete():
    vid=request.args.get("id")
    cmd.execute("delete from vehicle_registration where id = '"+vid+"'")
    con.commit()
    return '''<script>alert("deleted");window.location='/viewvechicle'</script>'''
@slicense.route('/vehicleedit')
@login_required
def vehicleedit():
    eid = request.args.get("id")
    session['kid'] = eid
    cmd.execute("select * from vehicle_registration where id='"+eid+"'")
    result = cmd.fetchone()
    return render_template('vechicleregedit.html', values=result)
@slicense.route('/updateveh',methods=['POST'])
@login_required

def updateveh():
    print(request.form)
    fid = session['kid']
    Registration_number = request.form['registration_number']
    Brief_discription = request.form['brief_description']
    Address = request.form['address']
    Makers_Name = request.form['makers_name']
    Name_of_Regd_Owner = request.form['name_of_owner']
    relation = request.form['relationship']
    Temporary_address = request.form['temporary_address']
    Class_of_vechicle = request.form['vehicle_class']
    Makers_Classification = request.form['makers_classification']
    Type_of_body = request.form['body_type']
    Chassis_Number = request.form['chassis_number']
    Engine_Number = request.form['engine_number']
    Fuel = request.form['fuel']
    Colour = request.form['colour']
    Month_of_Manufacture = request.form['manufacture_month']
    Year_of_Manufacture = request.form['manufacture_year']
    Horse_Power = request.form['horse_power']
    Weight = request.form['weight']
    Number_of_cilinders = request.form['cylinders']
    Seating_Capacity = request.form['seating_capacity']
    Tax_licence_No = request.form['tax_license_number']
    Date_of_Delivery = request.form['delivery_date']
    licnum = request.form['licnum']
    email=request.form['Email']
    cmd.execute("update vehicle_registration set Registration_number='"+Registration_number+"',Brief_discription='"+Brief_discription+"',Address='"+Address+"',Makers_Name ='"+Makers_Name +"',Name_of_Regd_Owner ='"+ Name_of_Regd_Owner+"', relation='"+ relation+"',Temporary_address ='"+ Temporary_address+"',Class_of_vechicle ='"+ Class_of_vechicle+"', Makers_Classification='"+ Makers_Classification+"',Type_of_body ='"+Type_of_body +"', Chassis_Number='"+Chassis_Number +"', Engine_Number='"+Engine_Number +"',Fuel ='"+ Fuel+"',Colour ='"+ Colour+"', Month_of_Manufacture='"+ Month_of_Manufacture+"',Year_of_Manufacture ='"+ Year_of_Manufacture+"', Horse_Power='"+Horse_Power +"', Weight='"+ Weight+"', Number_of_cilinders='"+ Number_of_cilinders+"',Seating_Capacity ='"+Seating_Capacity +"',Tax_licence_No ='"+ Tax_licence_No+"',Date_of_Delivery='"+Date_of_Delivery+"',licnum='"+licnum+"',email='"+email+"'where id='"+fid+"'")
    con.commit()
    return '''<script>alert("updated");window.location='/viewvechicle'</script> '''
@slicense.route('/viewvehiclestatus')
@login_required
def viewvehiclestatus():
    cmd.execute("select * from vechiclestatus")
    result=cmd.fetchall()
    return render_template('latitude.html',value=result)

@slicense.route('/status',methods=['post'])
@login_required
def status():
    text = request.form['Search']
    print(text)
    cmd.execute("SELECT * FROM vechiclestatus WHERE Vehicle_number='" + text + "'")
    result = cmd.fetchall()
    print(result)
    return render_template('latitude.html', value=result)

@slicense.route('/trafficreg')
@login_required
def trafficreg():
    return render_template('trafficreg.html')
@slicense.route('/addtraffic',methods=['POST'])
@login_required
def addtraffic():
    Name=request.form['Name']
    Email=request.form['Email']
    Password=request.form['Password']
    Badge_Number=request.form['Badge_Number']
    Gender=request.form['gender']
    DOB=request.form['dob']
    adharnumber=request.form['adharnumber']
    fileupload = request.files['Profile_Photo']
    fi = secure_filename(fileupload.filename)
    fileupload.save(os.path.join("static/images", fi))
    cmd.execute("insert into login values(null,'" +Email+ "','" +Password+"','traffic','"+adharnumber+"')")
    id=cmd.lastrowid
    cmd.execute("insert into traffic_reg values(null,'"+Name+"','"+Badge_Number+"','"+Gender+"','"+DOB+"','"+fi+"','"+Email+"','"+str(id)+"')")
    con.commit()
    import smtplib
    from email.mime.text import MIMEText

    # Assuming you have a database connection object named 'conn' and a cursor object named 'cmd'

    # Fetch username and password
    cmd.execute("SELECT username, password FROM login WHERE id = %s", (id,))
    result = cmd.fetchone()

    if result:
        username, password = result

        # Fetch email
        cmd.execute("SELECT email FROM traffic_reg WHERE loginid = %s", (id,))
        mymail = cmd.fetchone()[0]  # Fetch the email address
        print(mymail)

        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('rto.keralaa@gmail.com', 'kyuj nfal fopt gtwd')

            msg = MIMEText(f"Your username: {username}\nYour password: {password}")
            msg['Subject'] = 'username and password'
            msg['To'] = mymail
            msg['From'] = 'rto.keralaa@gmail.com'

            gmail.send_message(msg)
            gmail.quit()

        except Exception as e:
            print("Couldn't send email:", e)
    else:
        print("User not found.")
    return '''<script>alert("Success");window.location='/viewtraffic'</script>'''
@slicense.route('/viewtraffic')
@login_required
def viewtraffic():
    cmd.execute("select * from traffic_reg")
    result = cmd.fetchall()
    return render_template('Traffic.html', values=result)
@slicense.route('/viewalltrafficdetails')
@login_required
def viewalltrafficdetails():
    tid=request.args.get("id")
    cmd.execute("select * from traffic_reg where id='"+str(tid)+"'")
    result = cmd.fetchall()

    return render_template('Moretraffic.html', values=result)

@slicense.route('/trafficdelete')
def trafficdelete():
    pid=request.args.get("id")
    cmd.execute("delete from traffic_reg where id = '"+pid+"'")
    con.commit()
    return '''<script>alert("deleted");window.location='/viewtraffic'</script>'''
@slicense.route('/trafficedit')
@login_required
def trafficedit():
    eid = request.args.get("id")
    session['kid'] = eid
    cmd.execute("select * from traffic_reg where id='"+str(eid)+"'")
    result = cmd.fetchone()
    return render_template('trafficregedit.html', values=result)
@slicense.route('/updatetraffic',methods=['post'])
@login_required
def updatetraffic():
    tid=session['kid']
    Name = request.form['Name']
    Email = request.form['Email']
    Badge_Number = request.form['Badge_Number']
    Gender = request.form['gender']
    DOB = request.form['dob']
    cmd.execute(
        "update traffic_reg set Name='" + Name + "',Badge_Number='" + Badge_Number + "',Gender='" + Gender + "',DOB ='" + DOB + "',email ='" + Email + "' where id='"+str(tid)+"'")
    con.commit()
    return '''<script>alert("updated");window.location='/viewtraffic'</script> '''


@slicense.route('/trafficchangeimage')
@login_required
def  trafficchangeimage():
    return render_template('changeimagetraffic.html')
@slicense.route('/trafficimageupdate',methods=['post'])
@login_required
def  trafficimageupdate():
    tid = session['kid']
    fileupload = request.files['fileField']
    fi = secure_filename(fileupload.filename)
    fileupload.save(os.path.join("static/images", fi))
    cmd.execute( "update traffic_reg set Profile_Photo='"+fi+"' where id='"+str(tid)+"'")
    con.commit()
    return '''<script>alert("updated");window.location='/viewtraffic'</script> '''

@slicense.route('/viewnotification')
@login_required
def viewnotification():
   cmd.execute("select * from notification")
   result=cmd.fetchall()
   return render_template('viewnotification.html',value=result)

@slicense.route('/viewcomplaints')
@login_required
def viewcomplaints():
    cmd.execute("select * from fine")
    result = cmd.fetchall()
    print(result)
    return render_template('Complaints.html',value=result)
@slicense.route('/searchcomplaints',methods=['post'])
@login_required
def searchcomplaints():
    text = request.form['Search']
    cmd.execute("SELECT * FROM fine WHERE vehiclenumber='" + text + "'")
    result = cmd.fetchall()
    return render_template('Complaintsnew.html', value=result)
# @slicense.route('/send_replay')
# @login_required
# def send_replay():
#     replyid=request.args.get("id")
#     print(replyid)
#     return render_template('replay.html',comid=replyid)
# @slicense.route('/reply',methods=['post'])
# @login_required
# def reply():
#     replylid=request.form['comid']
#     print(replylid)
#     des=request.form['complaints']
#     cmd.execute("update complaints set replay='"+des+"' where `com_id`='"+str(replylid)+"'")
#     con.commit()
#     return '''<script>alert("updated");window.location='/viewcomplaints'</script> '''
@slicense.route('/blocklicence')
@login_required
def blocklicence():
    cmd.execute("select * from licence_registration ")
    result = cmd.fetchall()
    return render_template('blocklicence.html',value=result)
@slicense.route('/searchlicence',methods=['post'])
@login_required
def searchlicence():
    text = request.form['Search']
    cmd.execute("SELECT * FROM licence_registration WHERE Licence_No='" + text + "'")
    result = cmd.fetchall()
    return render_template('blocklicence.html', value=result)
@slicense.route('/blocklicencefulldetails')
@login_required
def blocklicencefulldetails():
    vid = request.args.get("id")
    print(vid)
    cmd.execute("select * from licence_registration where id='"+str(vid)+"'")
    result=cmd.fetchall()
    return render_template('licenceblock.html', value=result)
@slicense.route('/blocklicences')
@login_required
def blocklicences():
    did = request.args.get("id")
    cmd.execute("UPDATE licence_registration SET status='blocked' WHERE id=%s", (did,))
    con.commit()
    return '''<script>alert("Successfully Blocked");window.location='/blocklicence'</script>'''
@slicense.route('/unblocklicences')
@login_required
def unblocklicences():
    cid = request.args.get("id")
    cmd.execute("UPDATE licence_registration SET status='Unblock' WHERE id=%s", (cid,))
    con.commit()
    return '''<script>alert("Successfully Unblocked");window.location='/blocklicence'</script>'''

@slicense.route('/vsearch')
@login_required
def vsearch():
    cmd.execute("select * from vehicle_registration ")
    result=cmd.fetchall()
    return render_template('blockvehicle.html',value=result)
@slicense.route('/searchvehicle',methods=['post'])
@login_required
def searchvehicle():
    text = request.form['Search']
    cmd.execute("SELECT * FROM vehicle_registration WHERE Registration_number='" + text + "'")
    result = cmd.fetchall()
    return render_template('blockvehicle.html', value=result)
@slicense.route('/blockvehiclefulldetails')
@login_required
def blockvehiclefulldetails():
    vid = request.args.get("id")
    print(vid)
    cmd.execute("select * from vehicle_registration where id='"+str(vid)+"'")
    result=cmd.fetchall()
    return render_template('vechicleblock.html', value=result)

@slicense.route('/blockvehicle')
@login_required
def blockvehicle():
    did = request.args.get("id")
    cmd.execute("UPDATE vehicle_registration SET status='blocked' WHERE id=%s", (did,))
    con.commit()
    return '''<script>alert("Successfully Blocked");window.location='/vsearch'</script>'''

@slicense.route('/unblockvehicle')
@login_required
def unblockvehicle():
    cid = request.args.get("id")
    cmd.execute("UPDATE vehicle_registration SET status='Unblock' WHERE id=%s", (cid,))
    con.commit()
    return '''<script>alert("Successfully Unblocked");window.location='/vsearch'</script>'''
slicense.run(debug=True)
