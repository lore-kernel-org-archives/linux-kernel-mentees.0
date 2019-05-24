From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Fri, 24 May 2019 00:49:09 -0700
Subject: [Linux-kernel-mentees] [PATCH v2] Media: Radio: Change devm_k*alloc
	to k*alloc
Message-ID: <f797d04a-0a5c-f352-c69e-6d590d7c4b57@eng.ucsd.edu>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Changed devm_k*alloc to k*alloc to manually allocate memory. Memory is freed in vdev.release callback which is now in raremono_device_release.

This patch aims to fix the use-after-free read described in
https://syzkaller.appspot.com/bug?extid=a4387f5b6b799f6becbf

Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
---
 drivers/media/radio/radio-raremono.c | 39 ++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 5e782b3c2fa9..b3fb0893182d 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -271,6 +271,18 @@ static int vidioc_g_frequency(struct file *file, void *priv,
        return 0;
 }
 
+static void raremono_device_release(struct video_device *vdev)
+{
+       struct raremono_device *radio = 
+               video_get_drvdata(vdev);
+       
+       if (radio) {
+               kfree(radio->buffer);
+               kfree(radio);
+       }
+}
+
+
 /* File system interface */
 static const struct v4l2_file_operations usb_raremono_fops = {
        .owner          = THIS_MODULE,
@@ -295,12 +307,15 @@ static int usb_raremono_probe(struct usb_interface *intf,
        struct raremono_device *radio;
        int retval = 0;
 
-       radio = devm_kzalloc(&intf->dev, sizeof(struct raremono_device), GFP_KERNEL);
-       if (radio)
-               radio->buffer = devm_kmalloc(&intf->dev, BUFFER_LENGTH, GFP_KERNEL);
-
-       if (!radio || !radio->buffer)
+       radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);
+       if (!radio)
+               return -ENOMEM;
+       
+       radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
+       if (!radio->buffer) {
+               kfree(radio);
                return -ENOMEM;
+       }
 
        radio->usbdev = interface_to_usbdev(intf);
	radio->intf = intf;
@@ -324,7 +339,9 @@ static int usb_raremono_probe(struct usb_interface *intf,
        if (retval != 3 ||
            (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
                dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
-               return -ENODEV;
+               
+               retval = -ENODEV;
+               goto free_mem;
        }
 
        dev_info(&intf->dev, "Thanko's Raremono connected: (%04X:%04X)\n",
@@ -333,7 +350,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
        retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
        if (retval < 0) {
                dev_err(&intf->dev, "couldn't register v4l2_device\n");
-               return retval;
+               goto free_mem;
        }
 
        mutex_init(&radio->lock);
@@ -344,7 +361,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
        radio->vdev.fops = &usb_raremono_fops;
        radio->vdev.ioctl_ops = &usb_raremono_ioctl_ops;
        radio->vdev.lock = &radio->lock;
-       radio->vdev.release = video_device_release_empty;
+       radio->vdev.release = raremono_device_release;
 
        usb_set_intfdata(intf, &radio->v4l2_dev);
 
@@ -353,13 +370,19 @@ static int usb_raremono_probe(struct usb_interface *intf,
        raremono_cmd_main(radio, BAND_FM, 95160);
 
        retval = video_register_device(&radio->vdev, VFL_TYPE_RADIO, -1);
+       
        if (retval == 0) {
                dev_info(&intf->dev, "V4L2 device registered as %s\n",
                                video_device_node_name(&radio->vdev));
                return 0;
        }
+       
        dev_err(&intf->dev, "could not register video device\n");
        v4l2_device_unregister(&radio->v4l2_dev);
+free_mem:
+       kfree(radio->buffer);
+       kfree(radio);
+
        return retval;
 }
 
-- 
2.20.1
