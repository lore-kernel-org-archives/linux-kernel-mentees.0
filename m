Return-Path: <SRS0=1He7=5J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EBBC10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 23:54:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A860320719
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 23:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNAICxcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A860320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80C5888039;
	Tue, 24 Mar 2020 23:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPtah1GxwdCu; Tue, 24 Mar 2020 23:54:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF3958758B;
	Tue, 24 Mar 2020 23:54:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5FB9C089F;
	Tue, 24 Mar 2020 23:54:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70CD5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B89F384E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4VAHr6zkpv8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D18FB84921
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:54:12 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h14so613955qke.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 16:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWdQrSC8E4qph62LTErgxscMGGiPy7reC5vJ9ah9h8k=;
 b=nNAICxcBx0Pd+m7pJ2cu767ivyvG+BJBZ7CnmIRNMGl1+j5Qv4Hioi0DGMhn0udMwC
 0Sj+v2o4t2wmAjP4WNZr8YjuKF1Rq0hxXvGvKD6ZGXd3QbJ9okgMYT1FwxIUeRJFSXdS
 i4d9ZDEUQ7jrRM371rEkYhxGU655fTzy1yJ2aOcv4/wlSL3m8g6ARfwOz++ZSbRJIHr/
 9hR8rmjizVcSSdAncaxPMSx6ERntT2iXWLX3bpMk+OjPExyiTGAXjg0QeUibDEy5V7js
 H2VvNMBkK3akQBiiot6BhL7noTLbdljNVc/SORkSDu9mXccRtM7u8/ogVMZ48YmqCETs
 eptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWdQrSC8E4qph62LTErgxscMGGiPy7reC5vJ9ah9h8k=;
 b=TBRmXpQFMS3vUwMiOZYUUG8dTwiJzqxSE3x6yoliCLbCDoqUW4q/HDy/PEMv52IupE
 l9xK23KVbZ1Msp2xhyvWD3rpNkzM0C8BymXCzX4bQbgxp7VmlF4PIvFv7n7iaacIIK0v
 SOkfzu9+ttEyCt2hQG8CLCOJEPrIHM6iG/XQcDOLdbAHOppZrKxgEFRpuEx7WFPtSKMK
 U/XzVu2ZdUGClFszvRpT+AVAwXNYI/Avy8kP5/F235pZUbbJMaFiCYc2VL/2gvRmEl9G
 tmaJSPUHBsRzJOOWIsStDSq3F0+be2lT9MuguxmjgpPs2DxIfD1GSuuBaU3YPl9UPH0/
 ZNqg==
X-Gm-Message-State: ANhLgQ1S3MMGVNq41EQzVaMc+8enIM2IRWacnjOV/zyBXaHYt8Mjwxcz
 UMzt4IoF+mSjuaIM1qtnMaSXZ6VxzcRVQPdZ9ZI=
X-Google-Smtp-Source: ADFU+vu8TmmTFhtp932LiK5RXfQw1JiikKNrT3JD96Mn5TJPqPZzPw9VhGygP/zkNCp4+8rHf5Myv3bSXCNTnDLS6WY=
X-Received: by 2002:a37:4015:: with SMTP id n21mr447066qka.76.1585094051677;
 Tue, 24 Mar 2020 16:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
 <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
 <20200314112022.GA53794@kroah.com>
 <CAFVqi1T1Fipajca8exrzs6uQAorSZeke80LYy43aCBpT45nFdA@mail.gmail.com>
 <20200324062422.GA1977781@kroah.com>
In-Reply-To: <20200324062422.GA1977781@kroah.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Tue, 24 Mar 2020 17:53:59 -0600
Message-ID: <CAFVqi1Sqnn6L9xLQ0=BZp6D=aYz74tRMP0WYEXXVsz2cYXaoHA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

On Tue, Mar 24, 2020 at 12:24 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 24, 2020 at 12:10:33AM -0600, Kelsey wrote:
> > On Sat, Mar 14, 2020 at 5:20 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Mar 14, 2020 at 12:51:47PM +0200, Ruslan Bilovol wrote:
> > > > On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
> > > > <skunberg.kelsey@gmail.com> wrote:
> > > > >
> > > > > Defining device attributes should be done through the helper
> > > > > DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> > > > > __ATTR* to now use its equivalent DEVICE_ATTR*.
> > > > >
> > > > > Example of old:
> > > > >
> > > > > static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
> > > > >
> > > > > Example of new:
> > > > >
> > > > > static DEVICE_ATTR_RO(_name);
> > > > >
> > > > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> > > > > ---
> > > > >  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
> > > > >  1 file changed, 27 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > > index 965c72104150..8af7944fdccb 100644
> > > > > --- a/drivers/pci/pci-sysfs.c
> > > > > +++ b/drivers/pci/pci-sysfs.c
> > > > > @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
> > > > >         }
> > > > >         return count;
> > > > >  }
> > > > > -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > -                                                       NULL, dev_rescan_store);
> > > > > +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
> > > > >
> > > > >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > >                             const char *buf, size_t count)
> > > > > @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > >                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
> > > > >         return count;
> > > > >  }
> > > > > -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > -                                                       NULL, remove_store);
> > > > > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> > > > > +                                 remove_store);
> > > > >
> > > > >  static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > >                                     struct device_attribute *attr,
> > > > > @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > >         }
> > > > >         return count;
> > > > >  }
> > > > > -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> > > > > +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
> > > >
> > > > This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
> > > > There is also mismatch now between real functionality and documentation
> > > > Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
> > > > descriptions.
> > > >
> > > > Another patch from this patch series also renamed 'rescan' to 'dev_rescan'
> > > >
> > > > Here is a comparison between two stable kernels (with and without this
> > > > patch series):
> > > >
> > > > v5.4
> > > > # find /sys -name '*rescan'
> > > > /sys/devices/pci0000:00/0000:00:01.2/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:01.0/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:04.0/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:00.0/dev_rescan
> > > > /sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
> > > > /sys/devices/pci0000:00/0000:00:01.3/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:03.0/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:01.1/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:02.0/dev_rescan
> > > > /sys/devices/pci0000:00/0000:00:05.0/dev_rescan
> > > > /sys/bus/pci/rescan
> > > >
> > > > v4.19
> > > > # find /sys -name '*rescan'
> > > > /sys/devices/pci0000:00/0000:00:01.2/rescan
> > > > /sys/devices/pci0000:00/0000:00:01.0/rescan
> > > > /sys/devices/pci0000:00/0000:00:04.0/rescan
> > > > /sys/devices/pci0000:00/0000:00:00.0/rescan
> > > > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
> > > > /sys/devices/pci0000:00/0000:00:01.3/rescan
> > > > /sys/devices/pci0000:00/0000:00:03.0/rescan
> > > > /sys/devices/pci0000:00/0000:00:01.1/rescan
> > > > /sys/devices/pci0000:00/0000:00:02.0/rescan
> > > > /sys/devices/pci0000:00/0000:00:05.0/rescan
> > > > /sys/bus/pci/rescan
> > > >
> > > > Do we maintain this kind of API as non-changeable?
> > >
> > > Yeah, that's a bug and should be fixed, sorry for missing that on
> > > review.
> > >
> > > Kelsey, can you fix this up?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I'd be happy to help get this fixed up.
> >
> > Would it be proper to go back to using DEVICE_ATTR() for 'bus_rescan'
> > and 'dev_rescan' in order to change their names back to 'rescan'?
>
> Yes.
>
> thanks,
>
> greg k-h


Ack. Sent a patch out. Will stay posted in case any updates need to be made.

commit 4cb9e42d3226 ("PCI: sysfs: Change bus_rescan and dev_rescan to rescan")

Thanks!

- Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
