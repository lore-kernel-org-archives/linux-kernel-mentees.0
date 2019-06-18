From: lnowakow@eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Tue, 18 Jun 2019 00:47:02 -0700
Subject: [Linux-kernel-mentees] [PATCH v4] Media: Radio: Change devm_k*alloc
	to k*alloc
Message-ID: <f6821f6c-bd89-00bd-a3d9-721f3e3a11cd@eng.ucsd.edu>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618074702.WaD1Xd7ZvBiW7lL1GVOa0sYgiANZtP-m7tuqcU-CGAo@z>

Change devm_k*alloc to k*alloc to manually allocate memory. 

Memory is freed in v4l2.release callback which now calls 
raremono_device_release to free up the appropriate memory, 
just like in radio-shark driver. 


Reported-by: syzbot+a4387f5b6b799f6becbf at syzkaller.appspotmail.com
Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
---
diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 5e782b3c2fa9..ba471dd015f8 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -271,6 +271,14 @@ static int vidioc_g_frequency(struct file *file, void *priv,
        return 0;
 }
 
+static void raremono_device_release(struct v4l2_device *v4l2_dev)
+{
+       struct raremono_device *radio = to_raremono_dev(v4l2_dev);
+       kfree(radio->buffer);
+       kfree(radio);
+}
+
+
 /* File system interface */
 static const struct v4l2_file_operations usb_raremono_fops = {
        .owner          = THIS_MODULE,
@@ -295,12 +303,14 @@ static int usb_raremono_probe(struct usb_interface *intf,
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
+       radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
+       if (!radio->buffer) {
+               kfree(radio);
                return -ENOMEM;
+       }
 
        radio->usbdev = interface_to_usbdev(intf);
        radio->intf = intf;
@@ -324,16 +334,16 @@ static int usb_raremono_probe(struct usb_interface *intf,
        if (retval != 3 ||
            (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
                dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
-               return -ENODEV;
+               retval = -ENODEV;
+               goto free_mem;
        }
-
        dev_info(&intf->dev, "Thanko's Raremono connected: (%04X:%04X)\n",
                        id->idVendor, id->idProduct);
 
        retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
        if (retval < 0) {
       		dev_err(&intf->dev, "couldn't register v4l2_device\n");
-               return retval;
+               goto free_mem;
        }
 
        mutex_init(&radio->lock);
@@ -345,11 +355,10 @@ static int usb_raremono_probe(struct usb_interface *intf,
        radio->vdev.ioctl_ops = &usb_raremono_ioctl_ops;
        radio->vdev.lock = &radio->lock;
        radio->vdev.release = video_device_release_empty;
+       radio->v4l2_dev.release = raremono_device_release;
 
        usb_set_intfdata(intf, &radio->v4l2_dev);
-
        video_set_drvdata(&radio->vdev, radio);
-
        raremono_cmd_main(radio, BAND_FM, 95160);
 
        retval = video_register_device(&radio->vdev, VFL_TYPE_RADIO, -1);
@@ -360,6 +369,10 @@ static int usb_raremono_probe(struct usb_interface *intf,
        }
        dev_err(&intf->dev, "could not register video device\n");
        v4l2_device_unregister(&radio->v4l2_dev);
+
+free_mem:
+       kfree(radio->buffer);
+       kfree(radio);
        return retval;
 }
