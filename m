Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369BFC1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 07:17:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDCD206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 07:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUPtUUzS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CDCD206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFCDB87DB2;
	Wed, 25 Mar 2020 07:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHPAi1xndiAG; Wed, 25 Mar 2020 07:17:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5143187BA6;
	Wed, 25 Mar 2020 07:17:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40B97C1D7C;
	Wed, 25 Mar 2020 07:17:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 367BEC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 07:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1F4482547E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 07:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8INz8lby9Wo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 07:17:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A40E253CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 07:17:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77303206F6;
 Wed, 25 Mar 2020 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585120625;
 bh=EXBxL+l16lcKgIJFP14hYin8T/lF/hDqYzlqJZUhW0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZUPtUUzSUZC2q+c4d+F4bADrziUIxc+bqUp93wTg5ygluXXyZBLn1H+oLe+KeBlRt
 7mFPvzaui/E6OM95DIf2toXKZljUlWdhcLh7Yt369ThOftYLGgtThdBmjWJqXAbvUo
 nvNLgYMGaqlAFoPIb6CpBWO1s060zk01BCeuyxKs=
Date: Wed, 25 Mar 2020 08:17:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kelsey <skunberg.kelsey@gmail.com>
Message-ID: <20200325071702.GB2978943@kroah.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
 <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
 <20200314112022.GA53794@kroah.com>
 <CAFVqi1T1Fipajca8exrzs6uQAorSZeke80LYy43aCBpT45nFdA@mail.gmail.com>
 <20200324062422.GA1977781@kroah.com>
 <CAFVqi1Sqnn6L9xLQ0=BZp6D=aYz74tRMP0WYEXXVsz2cYXaoHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFVqi1Sqnn6L9xLQ0=BZp6D=aYz74tRMP0WYEXXVsz2cYXaoHA@mail.gmail.com>
Cc: linux-pci@vger.kernel.org, rbilovol@cisco.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Don Dutile <ddutile@redhat.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bodong Wang <bodong@mellanox.com>
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

On Tue, Mar 24, 2020 at 05:53:59PM -0600, Kelsey wrote:
> On Tue, Mar 24, 2020 at 12:24 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 24, 2020 at 12:10:33AM -0600, Kelsey wrote:
> > > On Sat, Mar 14, 2020 at 5:20 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Sat, Mar 14, 2020 at 12:51:47PM +0200, Ruslan Bilovol wrote:
> > > > > On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
> > > > > <skunberg.kelsey@gmail.com> wrote:
> > > > > >
> > > > > > Defining device attributes should be done through the helper
> > > > > > DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> > > > > > __ATTR* to now use its equivalent DEVICE_ATTR*.
> > > > > >
> > > > > > Example of old:
> > > > > >
> > > > > > static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
> > > > > >
> > > > > > Example of new:
> > > > > >
> > > > > > static DEVICE_ATTR_RO(_name);
> > > > > >
> > > > > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> > > > > > ---
> > > > > >  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
> > > > > >  1 file changed, 27 insertions(+), 32 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > > > index 965c72104150..8af7944fdccb 100644
> > > > > > --- a/drivers/pci/pci-sysfs.c
> > > > > > +++ b/drivers/pci/pci-sysfs.c
> > > > > > @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
> > > > > >         }
> > > > > >         return count;
> > > > > >  }
> > > > > > -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > > -                                                       NULL, dev_rescan_store);
> > > > > > +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
> > > > > >
> > > > > >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > > >                             const char *buf, size_t count)
> > > > > > @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > > >                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
> > > > > >         return count;
> > > > > >  }
> > > > > > -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> > > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > > -                                                       NULL, remove_store);
> > > > > > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> > > > > > +                                 remove_store);
> > > > > >
> > > > > >  static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > > >                                     struct device_attribute *attr,
> > > > > > @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > > >         }
> > > > > >         return count;
> > > > > >  }
> > > > > > -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> > > > > > +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
> > > > >
> > > > > This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
> > > > > There is also mismatch now between real functionality and documentation
> > > > > Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
> > > > > descriptions.
> > > > >
> > > > > Another patch from this patch series also renamed 'rescan' to 'dev_rescan'
> > > > >
> > > > > Here is a comparison between two stable kernels (with and without this
> > > > > patch series):
> > > > >
> > > > > v5.4
> > > > > # find /sys -name '*rescan'
> > > > > /sys/devices/pci0000:00/0000:00:01.2/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.0/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:04.0/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:00.0/dev_rescan
> > > > > /sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.3/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:03.0/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.1/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:02.0/dev_rescan
> > > > > /sys/devices/pci0000:00/0000:00:05.0/dev_rescan
> > > > > /sys/bus/pci/rescan
> > > > >
> > > > > v4.19
> > > > > # find /sys -name '*rescan'
> > > > > /sys/devices/pci0000:00/0000:00:01.2/rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.0/rescan
> > > > > /sys/devices/pci0000:00/0000:00:04.0/rescan
> > > > > /sys/devices/pci0000:00/0000:00:00.0/rescan
> > > > > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.3/rescan
> > > > > /sys/devices/pci0000:00/0000:00:03.0/rescan
> > > > > /sys/devices/pci0000:00/0000:00:01.1/rescan
> > > > > /sys/devices/pci0000:00/0000:00:02.0/rescan
> > > > > /sys/devices/pci0000:00/0000:00:05.0/rescan
> > > > > /sys/bus/pci/rescan
> > > > >
> > > > > Do we maintain this kind of API as non-changeable?
> > > >
> > > > Yeah, that's a bug and should be fixed, sorry for missing that on
> > > > review.
> > > >
> > > > Kelsey, can you fix this up?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > I'd be happy to help get this fixed up.
> > >
> > > Would it be proper to go back to using DEVICE_ATTR() for 'bus_rescan'
> > > and 'dev_rescan' in order to change their names back to 'rescan'?
> >
> > Yes.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> Ack. Sent a patch out. Will stay posted in case any updates need to be made.
> 
> commit 4cb9e42d3226 ("PCI: sysfs: Change bus_rescan and dev_rescan to rescan")

That's your local commit, not the commit in Linus's tree :)

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
