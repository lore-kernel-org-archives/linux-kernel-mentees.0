Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E32C54FD3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:15:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57AFD20772
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUUuszWO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57AFD20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3237A86E28;
	Wed, 25 Mar 2020 15:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqXzltcFos6M; Wed, 25 Mar 2020 15:15:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B22B86DF1;
	Wed, 25 Mar 2020 15:15:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87DCCC1D7C;
	Wed, 25 Mar 2020 15:15:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D42D0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D015F8733F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhN+dJ3Ygrt3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF694872A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:15:29 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o10so2862959qki.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZXSt/VrIZOV3oVnNKDvW8RIpCUfTNMiDOfSBRU0VB8=;
 b=TUUuszWOWR6k65Zd0oivopeWcUF500AHJzVV/Sg/CpVv17RUNlIFHVn4+EWYExw7ty
 yMWJ+T2Eb13M8tbgnO1WKSWhSIbFWyVKJoSJFRcLTlRhf4gqMAnEqqmHSw0ugi6tGra2
 t51Z+y/0Lik3mf/08yI055P9RJxkWa2/lthUuipGLrsoEHpLsH1DmMJfuHLmu8QrbkDg
 AEzWKxSKD+0RY4j3b7B/w6jBk1hRbiDInW2f/lIWUQ7xm0qS2lRKVB6MYgJ+WsbQvYLE
 AX4yEiAtHPdhAaVHeYCCyoPPq61xeqbQkk/H92vINT6vG88BUODo1cOFIMKAhA3HdVWM
 7Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZXSt/VrIZOV3oVnNKDvW8RIpCUfTNMiDOfSBRU0VB8=;
 b=LLDwZPAhTvbf5dy8jMugw5lwVBpE0er87hLM6omyn0jlGvFwVwrCF9Y3X73mDoGoOe
 whY1kQjcvO6RIkY/oh32sBxlIFaAtG3mErALDuEzneVpj+o3FQzmqh7AU4cHvKZRd2/i
 NbeplrcN3ZJZEXmPR287ZJwpITg0X8a8T93MmjTeSuWD1ahWsM64KUSxeQL95xD0Yan3
 EM6/Q/t7g/htXmoX2fIf2iNaahq99nxWBn5/jFfYth8nog/Y3MtDRea0VR4wTBqdezrq
 Pjrovkjy14kqmzh77YnSuCB9Mr+qtQ5b8zVx/6d7ZmUdcOHb5Yyz7Ph63aYW9s1Goe8l
 rEKA==
X-Gm-Message-State: ANhLgQ2DnhtfkAIMXL04v+DF3hxA72BpU3nsOWJ+tRQ3S7ajtxUsiCYn
 eFYUXmIkRblrInJTWpSNSHmamp+8Pdg1ymD20Mc=
X-Google-Smtp-Source: ADFU+vuJ7cSsW/s0dJZEJ+X32pL4tMEYdYJsFWLyBOG7k1gGNBggZT56570m3UBaDVEQQV25CNBhzuPkaa5pD09x55A=
X-Received: by 2002:a37:66c9:: with SMTP id a192mr3397481qkc.10.1585149328778; 
 Wed, 25 Mar 2020 08:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
 <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
 <20200314112022.GA53794@kroah.com>
 <CAFVqi1T1Fipajca8exrzs6uQAorSZeke80LYy43aCBpT45nFdA@mail.gmail.com>
 <20200324062422.GA1977781@kroah.com>
 <CAFVqi1Sqnn6L9xLQ0=BZp6D=aYz74tRMP0WYEXXVsz2cYXaoHA@mail.gmail.com>
 <20200325071702.GB2978943@kroah.com>
In-Reply-To: <20200325071702.GB2978943@kroah.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Wed, 25 Mar 2020 09:15:17 -0600
Message-ID: <CAFVqi1SpeYzixp3vLGGzkOaibF3kmV-u3oF02QoKHjfZ2vEPtg@mail.gmail.com>
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

On Wed, Mar 25, 2020 at 1:17 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 24, 2020 at 05:53:59PM -0600, Kelsey wrote:
> > On Tue, Mar 24, 2020 at 12:24 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Mar 24, 2020 at 12:10:33AM -0600, Kelsey wrote:
> > > > On Sat, Mar 14, 2020 at 5:20 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sat, Mar 14, 2020 at 12:51:47PM +0200, Ruslan Bilovol wrote:
> > > > > > On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
> > > > > > <skunberg.kelsey@gmail.com> wrote:
> > > > > > >
> > > > > > > Defining device attributes should be done through the helper
> > > > > > > DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> > > > > > > __ATTR* to now use its equivalent DEVICE_ATTR*.
> > > > > > >
> > > > > > > Example of old:
> > > > > > >
> > > > > > > static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
> > > > > > >
> > > > > > > Example of new:
> > > > > > >
> > > > > > > static DEVICE_ATTR_RO(_name);
> > > > > > >
> > > > > > > Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
> > > > > > >  1 file changed, 27 insertions(+), 32 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > > > > > > index 965c72104150..8af7944fdccb 100644
> > > > > > > --- a/drivers/pci/pci-sysfs.c
> > > > > > > +++ b/drivers/pci/pci-sysfs.c
> > > > > > > @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
> > > > > > >         }
> > > > > > >         return count;
> > > > > > >  }
> > > > > > > -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> > > > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > > > -                                                       NULL, dev_rescan_store);
> > > > > > > +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
> > > > > > >
> > > > > > >  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > > > >                             const char *buf, size_t count)
> > > > > > > @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> > > > > > >                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
> > > > > > >         return count;
> > > > > > >  }
> > > > > > > -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> > > > > > > -                                                       (S_IWUSR|S_IWGRP),
> > > > > > > -                                                       NULL, remove_store);
> > > > > > > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> > > > > > > +                                 remove_store);
> > > > > > >
> > > > > > >  static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > > > >                                     struct device_attribute *attr,
> > > > > > > @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
> > > > > > >         }
> > > > > > >         return count;
> > > > > > >  }
> > > > > > > -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> > > > > > > +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);
> > > > > >
> > > > > > This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
> > > > > > There is also mismatch now between real functionality and documentation
> > > > > > Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
> > > > > > descriptions.
> > > > > >
> > > > > > Another patch from this patch series also renamed 'rescan' to 'dev_rescan'
> > > > > >
> > > > > > Here is a comparison between two stable kernels (with and without this
> > > > > > patch series):
> > > > > >
> > > > > > v5.4
> > > > > > # find /sys -name '*rescan'
> > > > > > /sys/devices/pci0000:00/0000:00:01.2/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.0/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:04.0/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:00.0/dev_rescan
> > > > > > /sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.3/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:03.0/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.1/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:02.0/dev_rescan
> > > > > > /sys/devices/pci0000:00/0000:00:05.0/dev_rescan
> > > > > > /sys/bus/pci/rescan
> > > > > >
> > > > > > v4.19
> > > > > > # find /sys -name '*rescan'
> > > > > > /sys/devices/pci0000:00/0000:00:01.2/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.0/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:04.0/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:00.0/rescan
> > > > > > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.3/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:03.0/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:01.1/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:02.0/rescan
> > > > > > /sys/devices/pci0000:00/0000:00:05.0/rescan
> > > > > > /sys/bus/pci/rescan
> > > > > >
> > > > > > Do we maintain this kind of API as non-changeable?
> > > > >
> > > > > Yeah, that's a bug and should be fixed, sorry for missing that on
> > > > > review.
> > > > >
> > > > > Kelsey, can you fix this up?
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > I'd be happy to help get this fixed up.
> > > >
> > > > Would it be proper to go back to using DEVICE_ATTR() for 'bus_rescan'
> > > > and 'dev_rescan' in order to change their names back to 'rescan'?
> > >
> > > Yes.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> >
> > Ack. Sent a patch out. Will stay posted in case any updates need to be made.
> >
> > commit 4cb9e42d3226 ("PCI: sysfs: Change bus_rescan and dev_rescan to rescan")
>
> That's your local commit, not the commit in Linus's tree :)
>
> greg k-h

hah, whoops! Wanted to reference the patch name and didn't think that
through. Maybe would have been better to reference a link to the patch
anyways. :)

https://lore.kernel.org/r/20200324234848.8299-1-skunberg.kelsey@gmail.com

- Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
