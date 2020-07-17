Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA527C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 10:49:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70669207E8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 10:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="mYRoWBW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70669207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4388587EB0;
	Fri, 17 Jul 2020 10:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2KzB83HttsB; Fri, 17 Jul 2020 10:49:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB79F87EAF;
	Fri, 17 Jul 2020 10:49:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FFBFC0865;
	Fri, 17 Jul 2020 10:49:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 097BDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 10:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD31F203AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 10:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT-AIUIgzMkV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 10:49:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C36F203A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 10:49:50 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id wNvzjCfERNPeYwNw2jaOh8; Fri, 17 Jul 2020 12:49:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1594982988; bh=JS/t+raJpRIh7LU/UhCHDAVLtLmzy+TOU7CNbEiDdu0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=mYRoWBW3u0xkHn6ixCaauHml7saV8JPP4Rz0KjsNi4mldwhvnY5Bynu8jWDK5bUTu
 tI6wS2DfKJ3oCt0U67Xtmo4CnSfjhrqY2gBjUgnpRGMzO/sza++aN+zNBcrAZpQqGb
 NBsGitWooZWUrvZbtkzl09m/quE5PCGoYXsSAf6Zxt2oRdtF35LAWWc39MpwnlhSj0
 Jb1GRtoFhhWBDAYjG8OajwEsaBeaGelye26W51vvoxcbNsUPUauxZhL2KR1QfQWX5j
 gQypYuEfcMALBUifxPfopwRFVMC+hq7OVodThX/BPgPMeg4qg8u2dk2Wz8qGQP+bC1
 ZS6GOGc09uzEg==
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-media@vger.kernel.org
References: <20200717035608.97254-5-vaibhavgupta40@gmail.com>
 <202007171515.gDbDZtkQ%lkp@intel.com> <20200717072440.GA217230@gmail.com>
 <20200717103105.GA452501@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1b3303cb-31c1-f7a6-d6eb-c64cd6f40db6@xs4all.nl>
Date: Fri, 17 Jul 2020 12:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717103105.GA452501@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPkubAtmpjxVBEcTGbLMKTR66ZISGvDuiFi93wgEsJD211DwzZsHAyDT8ERdtHPf8or37Ft4LsEINumNoSkbimvkGyacbWRQaVlYnDINntOn4ne386w9
 A1xYDP4YEjIYGyGIOM0EM5Q1biZgH3u4nQPnBTVbMJt/N3siqdogNAOFJRp/h39FPYfnWe6ARMzSqP8pBT5bcowppuQjWSYnxWcJaMoAMhbFbT9mWcio52T7
 CT7QSh0zP8doD3lRMoI6A2qpOD/bW5QhXPYyxoy2zgsTF5feEZjXMNB+3DGcWg9RzfBue/P9y9SNRitJ2x1yXTKstrC7AVFFZs46Vbff6MHH6uuFGBMzC2wN
 6xDBD6S8W9uD1b7VFpzRQJvCg+0bChK+MasjjMYBBlE4HJ6UAqNHPX8YiCtNrcMnUjMD6FWzA0jmRFCb5hmO30ZTEpObgzY4n1Al5cnSMKngWRwZaTAV0Ufu
 m8qtCDFgUFbCJSYIbGvjKlcOlD5abZvTqieywg==
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 4/6] cx88: use generic power
	management
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 17/07/2020 12:31, Vaibhav Gupta wrote:
> On Fri, Jul 17, 2020 at 12:54:40PM +0530, Vaibhav Gupta wrote:
>> On Fri, Jul 17, 2020 at 03:14:28PM +0800, kernel test robot wrote:
>>> Hi Vaibhav,
>>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on linuxtv-media/master]
>>> [also build test ERROR on pci/next v5.8-rc5 next-20200716]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/pci-use-generic-power-management/20200717-120145
>>> base:   git://linuxtv.org/media_tree.git master
>>> config: s390-allmodconfig (attached as .config)
>>> compiler: s390-linux-gcc (GCC) 9.3.0
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # save the attached .config to linux build tree
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_suspend':
>>>>> drivers/media/pci/cx88/cx88-video.c:1564:3: error: implicit declaration of function 'stop_video_dma'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
>>>     1564 |   stop_video_dma(dev);
>>>          |   ^~~~~~~~~~~~~~
>>>          |   start_video_dma
>>>    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_resume':
>>>>> drivers/media/pci/cx88/cx88-video.c:1600:3: error: implicit declaration of function 'restart_video_queue'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
>>>     1600 |   restart_video_queue(dev, &dev->vidq);
>>>          |   ^~~~~~~~~~~~~~~~~~~
>>>          |   start_video_dma
>>>    cc1: some warnings being treated as errors
>>>
>>> vim +1564 drivers/media/pci/cx88/cx88-video.c
>>>
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1553  
>>> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1554  static int __maybe_unused cx8800_suspend(struct device *dev_d)
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1555  {
>>> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1556  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1557  	struct cx88_core *core = dev->core;
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1558  	unsigned long flags;
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1559  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1560  	/* stop video+vbi capture */
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1561  	spin_lock_irqsave(&dev->slock, flags);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1562  	if (!list_empty(&dev->vidq.active)) {
>>> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1563  		pr_info("suspend video\n");
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1564  		stop_video_dma(dev);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1565  	}
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1566  	if (!list_empty(&dev->vbiq.active)) {
>>> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1567  		pr_info("suspend vbi\n");
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1568  		cx8800_stop_vbi_dma(dev);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1569  	}
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1570  	spin_unlock_irqrestore(&dev->slock, flags);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1571  
>>> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1572  	if (core->ir)
>>> 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1573  		cx88_ir_stop(core);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1574  	/* FIXME -- shutdown device */
>>> e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1575  	cx88_shutdown(core);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1576  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1577  	dev->state.disabled = 1;
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1578  	return 0;
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1579  }
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1580  
>>> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1581  static int __maybe_unused cx8800_resume(struct device *dev_d)
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1582  {
>>> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1583  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1584  	struct cx88_core *core = dev->core;
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1585  	unsigned long flags;
>>> 08adb9e20be83b drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1586  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1587  	dev->state.disabled = 0;
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1588  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1589  	/* FIXME: re-initialize hardware */
>>> e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1590  	cx88_reset(core);
>>> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1591  	if (core->ir)
>>> 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1592  		cx88_ir_start(core);
>>> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1593  
>>> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1594  	cx_set(MO_PCI_INTMSK, core->pci_irqmask);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1595  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1596  	/* restart video+vbi capture */
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1597  	spin_lock_irqsave(&dev->slock, flags);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1598  	if (!list_empty(&dev->vidq.active)) {
>>> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1599  		pr_info("resume video\n");
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1600  		restart_video_queue(dev, &dev->vidq);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1601  	}
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1602  	if (!list_empty(&dev->vbiq.active)) {
>>> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1603  		pr_info("resume vbi\n");
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1604  		cx8800_restart_vbi_queue(dev, &dev->vbiq);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1605  	}
>>> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1606  	spin_unlock_irqrestore(&dev->slock, flags);
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1607  
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1608  	return 0;
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1609  }
>>> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1610  
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>
>> Got it. Thanks!
>> Fixed in v3.
>>
>> --Vaibhav Gupta
> 
> I fixed the error reported, in this v2 patch-series, by Kbuild and floated v3
> in the mailing list.
> But then I got notification from "[linux-media] Patchwork". It has applied my
> v2 patch series. Please use v3.

The message you got should say that is was superseded, not accepted.

I only marked v2 as Superseded, it wasn't applied.

Regards,

	Hans

> 
> --Vaibhav Gupta
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
