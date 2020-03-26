Return-Path: <SRS0=ZCt4=5L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39925C2D0E8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Mar 2020 06:29:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 010B820714
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Mar 2020 06:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnTEJoGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 010B820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00B6687075;
	Thu, 26 Mar 2020 06:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBktgXWmxDFy; Thu, 26 Mar 2020 06:29:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D912B87046;
	Thu, 26 Mar 2020 06:29:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C85E7C1D74;
	Thu, 26 Mar 2020 06:29:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3936EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Mar 2020 06:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 286F588866
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Mar 2020 06:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzEURbDc64YJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Mar 2020 06:29:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB7A888787
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Mar 2020 06:29:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t9so4384643qto.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i/fR/C9Juri0O/Jhyl78nI5aWq5H07mNdQL1ZjQ2Fec=;
 b=TnTEJoGdQx6OJqsozzttXtil7b93cqEcsDMe/4Usq1B9UsX477kc9HDF7Z7/VOcyYi
 p7lttbaMB2JqdE+oaceLAwS7bE8NaGBzBTUTm6+ci3w86CjvhXkY46AIggU+UFq6xdsY
 jqcrc5j9pDdgchwaYXKlo7DT3i7hcji0pZjkTIT6tcu0+YuPncv7S5qpCOpDFXfdD0Iw
 y5XGUGdXFtpfYoUnQSy1XC0FFkqslvwhdHWNZswjZg9U32/vuTtwF0kFKrqSfO+V1L4Z
 7oMlfz9xJRbuX6vx/rRXJ2Fcm8iz/NR0lnlNxZY1UAbQ+ch93hNHtxzREyYQOOhozJFe
 1Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i/fR/C9Juri0O/Jhyl78nI5aWq5H07mNdQL1ZjQ2Fec=;
 b=cblw/p9Msfuj401cQFyLSVFMzNfBjMBWR3/Fjkq1nVtCW2wSewCHxHSoAOK4jOk3xO
 /jEHE4504VwOex7wlX/OMZD437Ff6SKrVmp2GLtl3Jagp7/tmnUD6SOxvo4C53erg72x
 dfK8Kl7jisDkcOST3oRw7E2ywFZg1GP2N/fqL2vGH8dtK3VfewTa7h6gcm60sDNGWz+X
 P6kU5JYWK7l0Oh4hvvwtCYbqghsKX/vX3IaPAyIikYG4CRVI3NCrfjQyre9SMlCxFWvq
 43rMR2hgOZNOLP6iy1Hrif0apC0HrZcplMVbuf7LFLUEKfnR//eaMpsHn8C7E19DPqiX
 89xw==
X-Gm-Message-State: ANhLgQ3uE+sVlaG/jJWVAQbgdZpbl1k1SUfCJAyxszNgduuWyHqKkZZo
 be0grXo60OEv0ZtzKwEWcYEUBBEIQFVcYCbnq88=
X-Google-Smtp-Source: ADFU+vuW7W+dnPI3JZdBOUL+LkQTG1+kch2523GrC5jr9/D/ICe/XfKnDLFtomAtj/XzaiY1zV90rW4YIMb2hw+YrtU=
X-Received: by 2002:ac8:748d:: with SMTP id v13mr6769092qtq.390.1585204162674; 
 Wed, 25 Mar 2020 23:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200325151708.32612-1-skunberg.kelsey@gmail.com>
 <20200325221033.GA88141@google.com>
In-Reply-To: <20200325221033.GA88141@google.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Thu, 26 Mar 2020 00:29:11 -0600
Message-ID: <CAFVqi1R0Cc4+wqwCr9-8HoTU+6cShzorD44YzDNyex+jv1dztA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 rbilovol@cisco.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Don Dutile <ddutile@redhat.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bodong Wang <bodong@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] PCI: sysfs: Change bus_rescan
 and dev_rescan to rescan
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

Hi Bjorn,

On Wed, Mar 25, 2020 at 4:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Hi Kelsey,
>
> On Wed, Mar 25, 2020 at 09:17:08AM -0600, Kelsey Skunberg wrote:
> > From: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> >
> > rename device attribute name arguments 'bus_rescan' and 'dev_rescan' to 'rescan'
> > to avoid breaking userspace applications.
> >
> > The attribute argument names were changed in the following commits:
> > 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> > 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> >
> > Revert the names used for attributes back to the names used before the above
> > patches were applied. This also requires to change DEVICE_ATTR_WO() to
> > DEVICE_ATTR() and __ATTR().
> >
> > Note when using DEVICE_ATTR() the attribute is automatically named
> > dev_attr_<name>.attr. To avoid duplicated names between attributes, use
> > __ATTR() instead of DEVICE_ATTR() to a assign a custom attribute name for
> > dev_rescan.
> >
> > change bus_rescan_store() to dev_bus_rescan_store() to complete matching the
> > names used before the mentioned patches were applied.
> >
> > Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> > Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> >
> > Cc: stable <stable@vger.kernel.org>
> > Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >
> > v2 updates:
> >       commit log updated to include 'Fixes: *' and Cc: stable to aid commit
> >       being backported properly.
> >
> >  drivers/pci/pci-sysfs.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > index 13f766db0684..667e13d597ff 100644
> > --- a/drivers/pci/pci-sysfs.c
> > +++ b/drivers/pci/pci-sysfs.c
> > @@ -464,7 +464,10 @@ static ssize_t dev_rescan_store(struct device *dev,
> >       }
> >       return count;
> >  }
> > -static DEVICE_ATTR_WO(dev_rescan);
> > +static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > +                                                     0220, NULL,
> > +                                                     dev_rescan_store);
> > +
> >
> >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> >                           const char *buf, size_t count)
> > @@ -481,9 +484,9 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> >  static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
> >                                 remove_store);
> >
> > -static ssize_t bus_rescan_store(struct device *dev,
> > -                             struct device_attribute *attr,
> > -                             const char *buf, size_t count)
> > +static ssize_t dev_bus_rescan_store(struct device *dev,
> > +                                 struct device_attribute *attr,
> > +                                 const char *buf, size_t count)
> >  {
> >       unsigned long val;
> >       struct pci_bus *bus = to_pci_bus(dev);
> > @@ -501,7 +504,7 @@ static ssize_t bus_rescan_store(struct device *dev,
> >       }
> >       return count;
> >  }
> > -static DEVICE_ATTR_WO(bus_rescan);
> > +static DEVICE_ATTR(rescan, 0220, NULL, dev_bus_rescan_store);
> >
> >  #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
> >  static ssize_t d3cold_allowed_store(struct device *dev,
> > @@ -641,7 +644,7 @@ static struct attribute *pcie_dev_attrs[] = {
> >  };
> >
> >  static struct attribute *pcibus_attrs[] = {
> > -     &dev_attr_bus_rescan.attr,
> > +     &dev_attr_rescan.attr,
> >       &dev_attr_cpuaffinity.attr,
> >       &dev_attr_cpulistaffinity.attr,
> >       NULL,
> > @@ -1487,7 +1490,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
> >
> >  static struct attribute *pci_dev_hp_attrs[] = {
> >       &dev_attr_remove.attr,
> > -     &dev_attr_dev_rescan.attr,
> > +     &dev_rescan_attr.attr,
> >       NULL,
> >  };
>
> Thanks for taking care of this!  Two questions:
>
> 1) You supplied permissions of 0220, but DEVICE_ATTR_WO()
> uses__ATTR_WO(), which uses 0200.  Shouldn't we keep 0200?
>

Good catch. Before changing to DEVICE_ATTR_WO(), the permissions used
was (S_IWUSR | S_IWGRP), which would be 0220. This means the
permissions were mistakenly changed from 0220 to 0200 in the same
patch:

commit 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")

To verify DEVICE_ATTR_WO() is using __ATTR_WO() can be seen in
/include/linux/device.h
To verify permissions for __ATTR_WO() is 0200 can be seen in
/inlcude/linux/sysfs.h

These attributes had permissions 0220 when first being introduced and
before the above mentioned patch, so I'm on the side to believe that
0220 should be used.

The commits that introduced the files:
commit 738a6396c223 ("PCI: Introduce /sys/bus/pci/devices/.../rescan"):
commit b9d320fcb625 ("PCI: add rescan to /sys/.../pci_bus/.../"):

May you please sanity check this logic to use 0220? I can create a
second patch to change the permissions from the currently used 0200 to
0220.

> 2) I think the use of __ATTR() for the device side and DEVICE_ATTR()
> for the bus side is confusing.  Couldn't we accomplish the same thing
> with a patch like the following (compiled but not tested)?
>
> Bjorn
>
>
> commit 06094b3fd9f1 ("PCI: sysfs: Revert "rescan" file renames")
> Author: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> Date:   Wed Mar 25 09:17:08 2020 -0600
>
>     PCI: sysfs: Revert "rescan" file renames
>
>     We changed these sysfs filenames:
>
>       .../pci_bus/<domain:bus>/rescan  ->  .../pci_bus/<domain:bus>/bus_rescan
>       .../<domain:bus:dev.fn>/rescan   ->  .../<domain:bus:dev.fn>/dev_rescan
>
>     and Ruslan reported [1] that this broke a userspace application.
>
>     Revert these name changes so both files are named "rescan" again.
>
>     The argument to DEVICE_ATTR_WO() determines both the struct
>     device_attribute name and the .store() function name.  We have to
>     use __ATTR() so we can specify different .store() functions for
>     the two "rescan" files.
>
>     [1] https://lore.kernel.org/r/CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com
>
>     [bhelgaas: commit log]
>     Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
>     Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
>     Link: https://lore.kernel.org/r/20200325151708.32612-1-skunberg.kelsey@gmail.com
>     Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
>     Cc: stable@vger.kernel.org  # v5.4+
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 13f766db0684..bf025a2c296d 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -464,7 +464,8 @@ static ssize_t dev_rescan_store(struct device *dev,
>         }
>         return count;
>  }
> -static DEVICE_ATTR_WO(dev_rescan);
> +static struct device_attribute dev_attr_dev_rescan = __ATTR(rescan, 0200, NULL,
> +                                                           dev_rescan_store);
>
>  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>                             const char *buf, size_t count)
> @@ -501,7 +502,8 @@ static ssize_t bus_rescan_store(struct device *dev,
>         }
>         return count;
>  }
> -static DEVICE_ATTR_WO(bus_rescan);
> +static struct device_attribute dev_attr_bus_rescan = __ATTR(rescan, 0200, NULL,
> +                                                           bus_rescan_store);
>
>  #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
>  static ssize_t d3cold_allowed_store(struct device *dev,


This can be done, yes! I agree this could help clarify and clean up the code.

I can implement your commit log as well.

Let me know your thoughts for the permissions and I'll get an updated
version out right away.

Thank you!

-Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
