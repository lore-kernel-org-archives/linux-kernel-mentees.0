Return-Path: <SRS0=1He7=5J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5164C10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 06:10:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7822073E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 06:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcAgnWaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7822073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D32288905;
	Tue, 24 Mar 2020 06:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKxrghcyo3MI; Tue, 24 Mar 2020 06:10:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D72CD888F0;
	Tue, 24 Mar 2020 06:10:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE623C089F;
	Tue, 24 Mar 2020 06:10:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FE02C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 06:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86DE4888F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 06:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7DMS9BX1+Ix
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 06:10:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A9CEC888EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 06:10:45 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k13so6448378qki.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHyvhEFOA+6ht5C5Md9yO/2NBro540fuAK71xdfGAyw=;
 b=gcAgnWaUi4IvLI3keqVWWIEPRpN5wENXb/k3U4hQ1wxVUGZjy35Q1DnW7yBDa28gqW
 4yVwTfMkRDLB4tyiRLTmHmgO9j/tc+0wsEaxDIb8sWervzIdgGakXaUNkZtFKj6bs5N4
 TOukkcEOGU6PGKai9pZ1/b9kC+veZJvFvfn0YT+qc45rWUQUCb5MvocCJcaYrOkfD5Nz
 /6PlKtjCTcbNCRWsEWgksBXiXUBNxGRzeb65+wB3O0Q1/4UD8f5MbtpKusDJ0NB/N1Dr
 Ki6+cXKTgQNxzEnrvURP/dQjRHoo22Ll6y3hMArE/YNtZ/20sp7GASaPwqGsqB2cj7aK
 L8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHyvhEFOA+6ht5C5Md9yO/2NBro540fuAK71xdfGAyw=;
 b=E3SdQHy8Kaeig2zGNOkXbu6b1g5FoFJJmxRFyhK3Oc591KbmM3wSnn1rFjAJpzG/gB
 J708HPNCM3dme+EIi39yTJJ79ci+LG8z9wT+PI06hDDAaak/i2vf+qfPgn2w6rxdUrIp
 c/5Wrlbm4Y6TxLLlTimhTZCEhNaEmbT6N/1qTssAQ8plbcBXQ684upKU1Lspq9XKcZSS
 KOg+De6/dIJRzSFDHs5rD6NC/HoMQ4T0z8h4Q4B69dbD61p2PaRZyULMb5XHEi1ZZSlD
 NAJ4/NwLvqxKzvR+TJuhIRdYpq+BuPDCgOsspv2EUtCu378BgSy+jNkvxI7k3eD7BdBB
 w4IA==
X-Gm-Message-State: ANhLgQ3djZMaJ+eLfyTrxJbvy8Fk93czJM3WuPR6HTY6t7Q0qHYzpddJ
 oi+B20jdjcQy5WtAcYlb1xT05d9BOV16ZRCZXwk=
X-Google-Smtp-Source: ADFU+vsSdNX04/CnwDNqaQSoUMpaW5OmZpb0wl8ctm6k3wTZloWyqMcRPtERngxtZnn6mOwFSIjHuHYtVx9xxQdqjDg=
X-Received: by 2002:a37:66c9:: with SMTP id a192mr19240643qkc.10.1585030244645; 
 Mon, 23 Mar 2020 23:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
 <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
 <20200314112022.GA53794@kroah.com>
In-Reply-To: <20200314112022.GA53794@kroah.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Tue, 24 Mar 2020 00:10:33 -0600
Message-ID: <CAFVqi1T1Fipajca8exrzs6uQAorSZeke80LYy43aCBpT45nFdA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, rbilovol@cisco.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Don Dutile <ddutile@redhat.com>, Bodong Wang <bodong@mellanox.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>
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

On Sat, Mar 14, 2020 at 5:20 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 14, 2020 at 12:51:47PM +0200, Ruslan Bilovol wrote:
> > On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
> > <skunberg.kelsey@gmail.com> wrote:
> > >
> > > Defining device attributes should be done through the helper
> > > DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> > > __ATTR* to now use its equivalent DEVICE_ATTR*.
> > >
> > > Example of old:
> > >
> > > static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
> > >
> > > Example of new:
> > >
> > > static DEVICE_ATTR_RO(_name);
> > >
> > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> > > ---
> > >  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
> > >  1 file changed, 27 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > index 965c72104150..8af7944fdccb 100644
> > > --- a/drivers/pci/pci-sysfs.c
> > > +++ b/drivers/pci/pci-sysfs.c
> > > @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
> > >         }
> > >         return count;
> > >  }
> > > -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > > -                                                       (S_IWUSR|S_IWGRP),
> > > -                                                       NULL, dev_rescan_store);
> > > +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
> > >
> > >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > >                             const char *buf, size_t count)
> > > @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > >                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
> > >         return count;
> > >  }
> > > -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> > > -                                                       (S_IWUSR|S_IWGRP),
> > > -                                                       NULL, remove_store);
> > > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> > > +                                 remove_store);
> > >
> > >  static ssize_t dev_bus_rescan_store(struct device *dev,
> > >                                     struct device_attribute *attr,
> > > @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
> > >         }
> > >         return count;
> > >  }
> > > -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> > > +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
> >
> > This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
> > There is also mismatch now between real functionality and documentation
> > Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
> > descriptions.
> >
> > Another patch from this patch series also renamed 'rescan' to 'dev_rescan'
> >
> > Here is a comparison between two stable kernels (with and without this
> > patch series):
> >
> > v5.4
> > # find /sys -name '*rescan'
> > /sys/devices/pci0000:00/0000:00:01.2/dev_rescan
> > /sys/devices/pci0000:00/0000:00:01.0/dev_rescan
> > /sys/devices/pci0000:00/0000:00:04.0/dev_rescan
> > /sys/devices/pci0000:00/0000:00:00.0/dev_rescan
> > /sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
> > /sys/devices/pci0000:00/0000:00:01.3/dev_rescan
> > /sys/devices/pci0000:00/0000:00:03.0/dev_rescan
> > /sys/devices/pci0000:00/0000:00:01.1/dev_rescan
> > /sys/devices/pci0000:00/0000:00:02.0/dev_rescan
> > /sys/devices/pci0000:00/0000:00:05.0/dev_rescan
> > /sys/bus/pci/rescan
> >
> > v4.19
> > # find /sys -name '*rescan'
> > /sys/devices/pci0000:00/0000:00:01.2/rescan
> > /sys/devices/pci0000:00/0000:00:01.0/rescan
> > /sys/devices/pci0000:00/0000:00:04.0/rescan
> > /sys/devices/pci0000:00/0000:00:00.0/rescan
> > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
> > /sys/devices/pci0000:00/0000:00:01.3/rescan
> > /sys/devices/pci0000:00/0000:00:03.0/rescan
> > /sys/devices/pci0000:00/0000:00:01.1/rescan
> > /sys/devices/pci0000:00/0000:00:02.0/rescan
> > /sys/devices/pci0000:00/0000:00:05.0/rescan
> > /sys/bus/pci/rescan
> >
> > Do we maintain this kind of API as non-changeable?
>
> Yeah, that's a bug and should be fixed, sorry for missing that on
> review.
>
> Kelsey, can you fix this up?
>
> thanks,
>
> greg k-h

I'd be happy to help get this fixed up.

Would it be proper to go back to using DEVICE_ATTR() for 'bus_rescan'
and 'dev_rescan' in order to change their names back to 'rescan'?

The name changes were done so the correct *_store() would still be
called. When using DEVICE_ATTR() the *_store() name is passed as the
last argument, as seen here:

    static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);

When using the helper, only the name is passed and it assumes default
<name>_show(), as seen here:

    static DEVICE_ATTR_WO(dev_rescan);   # (This would assume
dev_rescan_store())

This can be verified in Documentation/filesystems/sysfs.txt.

There is already a rescan attribute using rescan_store(), so changing
at least one of these to DEVICE_ATTR_WO(rescan) would be conflicting.

I understand it's ideal to stay away from using DEVICE_ATTR() unless
an unusual mode is needed. Would having a different name vs
name_store() be another reason to justify using DEVICE_ATTR()?

Thank you Ruslan for pointing this out!

- Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
