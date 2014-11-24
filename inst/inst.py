import os
import traceback

def oper(filename, cmd):
	f = open(filename)
	lines = f.read().split('\n')
	for i in lines:
		if len(i)>0:
			if i[0]!='#':
				os.system("./"+cmd+" "+i)
	f.close()

try:
        os.system('sudo add-apt-repository multiverse')
	os.system('sudo apt-get update')
	oper("inst_first.txt", "inst.sh")
	oper("tocopy.txt", "tocopy.sh")
	os.system("echo '44 * * * * backup.sh' >> /var/spool/cron/crontabs/root")
	os.system("echo '00 * * * * copy_backup.sh' >> /var/spool/cron/crontabs/root")
	print("\n\ncopied\ncopied\ncopied\n\n\n")
	oper("inst.txt", "inst.sh")
	
except:
	print("Something occured")
	print(traceback.format_exc())
