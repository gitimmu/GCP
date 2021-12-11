echo "##########Creating compute instance###########"
echo "please enter name of the GCE VM: "
read gcevm
echo "Please enter the name of the project to make", $gcevm, "live"
read proj

gcloud compute instances create $gcevm --project=$proj --zone=asia-south1-c --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=TRUE, --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=centos-7-v20210817 --image-project=centos-cloud --boot-disk-size=20GB --boot-disk-type=pd-balanced --boot-disk-device-name=instance-1 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

publicip=$(gcloud compute instances list |grep -i running|awk -F ' ' '{print $5}')
echo "The srebootcamp website can be accessed at: " http://$publicip:80
