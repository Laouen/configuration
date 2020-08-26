# Aliases
alias aws_sigmind_test='ssh -i "~/.ssh/ar-lab-test-apirest.pem" ubuntu@ec2-54-166-192-65.compute-1.amazonaws.com'
alias mount_piaget='sshfs lbelloli@piaget.exp.dc.uba.ar:/home/lbelloli/git/ /home/laouenbelloli/piaget/'
alias unmount_piaget='fusermount -u /home/laouenbelloli/piaget/'
alias mount_signos='sshfs lbelloli@signos.liaa.inv.dc.uba.ar:/home/lbelloli/ /home/laouenbelloli/signos/ -o ssh_command="ssh -J lbelloli@zorzal.dc.uba.ar"'
alias unmount_signos='fusermount -u /home/laouenbelloli/signos/'
