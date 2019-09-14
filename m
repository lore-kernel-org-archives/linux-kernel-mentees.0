From: lkp@intel.com (kbuild test robot)
Date: Sat, 14 Sep 2019 11:14:52 +0800
Subject: [Linux-kernel-mentees] [PATCH] uvc/vsp1/ipu3: use
	VFL_TYPE_METADATA for metadata device.
In-Reply-To: <20190911101023.29003-1-bnvandana@gmail.com>
References: <20190911101023.29003-1-bnvandana@gmail.com>
Message-ID: <201909141139.VFTXKucY%lkp@intel.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190914031452.tb4GKE9FB7rwn55wC7VQh-zbkSw7ey4v_oh7c-_btEk@z>

Hi Vandana,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[cannot apply to v5.3-rc8 next-20190904]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Vandana-BN/uvc-vsp1-ipu3-use-VFL_TYPE_METADATA-for-metadata-device/20190914-074954
base:   git://linuxtv.org/media_tree.git master
config: ia64-allmodconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=ia64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp at intel.com>

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_driver.c: In function 'uvc_register_video_device':
>> drivers/media/usb/uvc/uvc_driver.c:1979:14: error: 'VFL_TYPE_METADATA' undeclared (first use in this function); did you mean 'VFL_TYPE_MAX'?
      vfl_type = VFL_TYPE_METADATA;
                 ^~~~~~~~~~~~~~~~~
                 VFL_TYPE_MAX
   drivers/media/usb/uvc/uvc_driver.c:1979:14: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/vsp1/vsp1_histo.c: In function 'vsp1_histogram_init':
>> drivers/media/platform/vsp1/vsp1_histo.c:554:26: error: 'VFL_TYPE_METADATA' undeclared (first use in this function); did you mean 'VFL_TYPE_MAX'?
     histo->video.vfl_type = VFL_TYPE_METADATA;
                             ^~~~~~~~~~~~~~~~~
                             VFL_TYPE_MAX
   drivers/media/platform/vsp1/vsp1_histo.c:554:26: note: each undeclared identifier is reported only once for each function it appears in

vim +1979 drivers/media/usb/uvc/uvc_driver.c

  1935	
  1936	int uvc_register_video_device(struct uvc_device *dev,
  1937				      struct uvc_streaming *stream,
  1938				      struct video_device *vdev,
  1939				      struct uvc_video_queue *queue,
  1940				      enum v4l2_buf_type type,
  1941				      const struct v4l2_file_operations *fops,
  1942				      const struct v4l2_ioctl_ops *ioctl_ops)
  1943	{
  1944		int ret;
  1945		int vfl_type = VFL_TYPE_GRABBER;
  1946	
  1947		/* Initialize the video buffers queue. */
  1948		ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
  1949		if (ret)
  1950			return ret;
  1951	
  1952		/* Register the device with V4L. */
  1953	
  1954		/*
  1955		 * We already hold a reference to dev->udev. The video device will be
  1956		 * unregistered before the reference is released, so we don't need to
  1957		 * get another one.
  1958		 */
  1959		vdev->v4l2_dev = &dev->vdev;
  1960		vdev->fops = fops;
  1961		vdev->ioctl_ops = ioctl_ops;
  1962		vdev->release = uvc_release;
  1963		vdev->prio = &stream->chain->prio;
  1964		if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
  1965			vdev->vfl_dir = VFL_DIR_TX;
  1966		else
  1967			vdev->vfl_dir = VFL_DIR_RX;
  1968	
  1969		switch (type) {
  1970		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
  1971		default:
  1972			vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
  1973			break;
  1974		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
  1975			vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
  1976			break;
  1977		case V4L2_BUF_TYPE_META_CAPTURE:
  1978			vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> 1979			vfl_type = VFL_TYPE_METADATA;
  1980			break;
  1981		}
  1982	
  1983		strscpy(vdev->name, dev->name, sizeof(vdev->name));
  1984	
  1985		/*
  1986		 * Set the driver data before calling video_register_device, otherwise
  1987		 * the file open() handler might race us.
  1988		 */
  1989		video_set_drvdata(vdev, stream);
  1990	
  1991		ret = video_register_device(vdev, vfl_type, -1);
  1992		if (ret < 0) {
  1993			uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
  1994				   v4l2_type_names[type], ret);
  1995			return ret;
  1996		}
  1997	
  1998		kref_get(&dev->ref);
  1999		return 0;
  2000	}
  2001	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 54564 bytes
Desc: not available
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20190914/426ec56e/attachment-0001.bin>
