Return-Path: <SRS0=5JV7=47=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60354C0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Mar 2020 11:20:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DD62076F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Mar 2020 11:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ztNmQ9im"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DD62076F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0176B87639;
	Sat, 14 Mar 2020 11:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0S4ABr_J1bW; Sat, 14 Mar 2020 11:20:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAC3187620;
	Sat, 14 Mar 2020 11:20:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE226C18D3;
	Sat, 14 Mar 2020 11:20:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B69C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EEF320520
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 11:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKVnfTECgbvL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 11:20:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7897F20423
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 11:20:25 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0CDC2073E;
 Sat, 14 Mar 2020 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584184825;
 bh=dQfzPYyCYdN+44zCm9AjIC54G7c/pVQL8vwGNg36xK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ztNmQ9imaYg944LP2Tp1jJ8ZgvjqCngYPQRGC11tXYfpCbCRmX3lG6VlrNhesKoiL
 2jq4LXNkX4Yb0W7o68AWIZup5z+o12xuG9ESxbf7yoT1mGRh7uQotFPOSRNMjiMtiy
 zqzD4xyg/t8ifygN/+2fSg+esmPPWYBk9U4Jz0X0=
Date: Sat, 14 Mar 2020 12:20:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Message-ID: <20200314112022.GA53794@kroah.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
 <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
Cc: linux-pci@vger.kernel.org, rbilovol@cisco.com, linux-kernel@vger.kernel.org,
 ddutile@redhat.com, bodong@mellanox.com, bhelgaas@google.com,
 Kelsey Skunberg <skunberg.kelsey@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/4] PCI: sysfs: Define device
 attributes with DEVICE_ATTR*
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

On Sat, Mar 14, 2020 at 12:51:47PM +0200, Ruslan Bilovol wrote:
> On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
> <skunberg.kelsey@gmail.com> wrote:
> >
> > Defining device attributes should be done through the helper
> > DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> > __ATTR* to now use its equivalent DEVICE_ATTR*.
> >
> > Example of old:
> >
> > static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
> >
> > Example of new:
> >
> > static DEVICE_ATTR_RO(_name);
> >
> > Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> > ---
> >  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
> >  1 file changed, 27 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > index 965c72104150..8af7944fdccb 100644
> > --- a/drivers/pci/pci-sysfs.c
> > +++ b/drivers/pci/pci-sysfs.c
> > @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
> >         }
> >         return count;
> >  }
> > -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > -                                                       (S_IWUSR|S_IWGRP),
> > -                                                       NULL, dev_rescan_store);
> > +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
> >
> >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> >                             const char *buf, size_t count)
> > @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> >                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
> >         return count;
> >  }
> > -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> > -                                                       (S_IWUSR|S_IWGRP),
> > -                                                       NULL, remove_store);
> > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> > +                                 remove_store);
> >
> >  static ssize_t dev_bus_rescan_store(struct device *dev,
> >                                     struct device_attribute *attr,
> > @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
> >         }
> >         return count;
> >  }
> > -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> > +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
> 
> This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
> There is also mismatch now between real functionality and documentation
> Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
> descriptions.
> 
> Another patch from this patch series also renamed 'rescan' to 'dev_rescan'
> 
> Here is a comparison between two stable kernels (with and without this
> patch series):
> 
> v5.4
> # find /sys -name '*rescan'
> /sys/devices/pci0000:00/0000:00:01.2/dev_rescan
> /sys/devices/pci0000:00/0000:00:01.0/dev_rescan
> /sys/devices/pci0000:00/0000:00:04.0/dev_rescan
> /sys/devices/pci0000:00/0000:00:00.0/dev_rescan
> /sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
> /sys/devices/pci0000:00/0000:00:01.3/dev_rescan
> /sys/devices/pci0000:00/0000:00:03.0/dev_rescan
> /sys/devices/pci0000:00/0000:00:01.1/dev_rescan
> /sys/devices/pci0000:00/0000:00:02.0/dev_rescan
> /sys/devices/pci0000:00/0000:00:05.0/dev_rescan
> /sys/bus/pci/rescan
> 
> v4.19
> # find /sys -name '*rescan'
> /sys/devices/pci0000:00/0000:00:01.2/rescan
> /sys/devices/pci0000:00/0000:00:01.0/rescan
> /sys/devices/pci0000:00/0000:00:04.0/rescan
> /sys/devices/pci0000:00/0000:00:00.0/rescan
> /sys/devices/pci0000:00/pci_bus/0000:00/rescan
> /sys/devices/pci0000:00/0000:00:01.3/rescan
> /sys/devices/pci0000:00/0000:00:03.0/rescan
> /sys/devices/pci0000:00/0000:00:01.1/rescan
> /sys/devices/pci0000:00/0000:00:02.0/rescan
> /sys/devices/pci0000:00/0000:00:05.0/rescan
> /sys/bus/pci/rescan
> 
> Do we maintain this kind of API as non-changeable?

Yeah, that's a bug and should be fixed, sorry for missing that on
review.

Kelsey, can you fix this up?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
