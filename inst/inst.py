import os
import commands
import traceback

def oper(filename, cmd):
    f = open(filename)
    lines = f.read().split('\n')
    for i in lines:
        if len(i)>0:
            if i[0]!='#':
                os.system("./"+cmd+" "+i)
    f.close()

def to_cron(tim, cmd):
    if commands.getstatusoutput("sudo cat /var/spool/cron/crontabs/root | grep ' "+cmd+"' | wc -l")[1] == '0':
        os.system("sudo sh -c \"echo '"+tim+" "+cmd+"' >> /var/spool/cron/crontabs/root\"")


try:
    os.system('sudo add-apt-repository multiverse')
    os.system('sudo apt-get update')
    oper("inst_first.txt", "inst.sh")
    oper("tocopy.txt", "tocopy.sh")
    to_cron('44 * * * *', 'backup.sh')
    to_cron('00 23 * * 1', 'copy_backup.sh')
    print("\n\ncopied\ncopied\ncopied\n\n\n")
    oper("inst.txt", "inst.sh")
except:
    print("Something occured")
    print(traceback.format_exc())
