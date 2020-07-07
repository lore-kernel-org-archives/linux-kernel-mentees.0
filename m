Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E310C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 20:53:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43977206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 20:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGBMRZ70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43977206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2613689158;
	Tue,  7 Jul 2020 20:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhlRElhT+bQA; Tue,  7 Jul 2020 20:53:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5755889110;
	Tue,  7 Jul 2020 20:53:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46CFEC0893;
	Tue,  7 Jul 2020 20:53:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFFE2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF16586CD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0b3btad-WNe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E6E7A86CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:53:35 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id x9so37267459ila.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=189AxpwvXIeA0DFsLD/ese/DSA2pesygn+tykXn1Agw=;
 b=TGBMRZ70H3Z0NPtYMANO+kVYZpBhbcHz6uACq8tNqU7ZbzzwEjp2aE31hG7AI369zO
 //Bpk+gvvOtkZKE2/ktvaXiWhecc/Mneu9dFQgXwlUjkCFp62dx2Wu0NnpcmlukrT70H
 nECWAk+oqSzKtFbWHoCmXw0LAyy0ucOrn96e506D6ve8aVdZodktZcXYXGKyZJhKJSAr
 8rJX3QWunCdw5/bMDnQKc7+p8OvPLLkaXfhPiNNoD2LUj/QF9IBBECvVevZcOwV9ub69
 2MpX3YJQWFHhFMP9ubr38d42IiLhXmgZrz64ATbrI18CSUuHFvQ68KERuc/SGBshQxhs
 Zvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=189AxpwvXIeA0DFsLD/ese/DSA2pesygn+tykXn1Agw=;
 b=bivLJAmpp96qv9M5Sjjudh1GfW8yCW4fEXzgdBuaK+e8XfFnrvua1I8EZmrGalG+A7
 qUG3ohCfHS/cBLqIEaafHwgXBbxOnemfd+AH2amyYCz6pTdxfPtRoBJUlgZHJzI2Aeho
 pbPYjJAqmPPbF21QPuzhiWnp5SZly3xPAyrbOrHXXclsD1tEp9XTL29BTae59kwd0i0N
 5bS1dxx3QmxFzU1jzP0FJrD1ebI3LRE1AqaWA0glQopgyRNKWKQ6JUdyjyST2ZIxvfWF
 J9g4sZd6NXoDeblLgjzluDtU3TKMC+TZ4hLc4oxG8iqFdf8NcMdIFd/pjXkS4RL42vhE
 KOsw==
X-Gm-Message-State: AOAM5309RO8OvLsJhhyC6gyEqXdwycbgZp69WCdx2sr5uYLWMYkIDRIr
 enHuAcwydE0tparUORVTLMGaVqe9qNSHwtfZsjI=
X-Google-Smtp-Source: ABdhPJxtNKmwc5UzEe7R7iG7OjilB82dz3mFAYyaycGCV0DZN6QgLkQk+gC7o/l04ZX8y/7xUN3mHgxl64yPQ+GXF7s=
X-Received: by 2002:a05:6e02:487:: with SMTP id
 b7mr39182398ils.100.1594155215226; 
 Tue, 07 Jul 2020 13:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200703081428.1011527-3-vaibhavgupta40@gmail.com>
 <20200707204201.GA382915@bjorn-Precision-5520>
In-Reply-To: <20200707204201.GA382915@bjorn-Precision-5520>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 8 Jul 2020 02:23:22 +0530
Message-ID: <CAPBsFfCdJkXO-V16yO2eTeAwnQnKJZ49yaJepbsF2dNZjLZFhw@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-ide@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/4] ide: triflex: use generic
	power management
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
Content-Type: multipart/mixed; boundary="===============6317138463250410308=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6317138463250410308==
Content-Type: multipart/alternative; boundary="000000000000520bd105a9e02f59"

--000000000000520bd105a9e02f59
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 8, 2020, 2:12 AM Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Fri, Jul 03, 2020 at 01:44:26PM +0530, Vaibhav Gupta wrote:
> > While upgrading ide_pci_suspend() and ide_pci_resume(), all other source
> > files, using same callbacks, were also updated except
> > drivers/ide/triflex.c. This is because the driver does not want to power
> > off the device during suspend. A quirk was required for the same.
> >
> > This patch provides the fix. Another driver,
> > drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c, makes use of
> > a quirk for similar goal. Hence a similar quirk has been applied for
> > triflex.
> >
> > Compile-tested only.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/ide/triflex.c | 45 +++++++++++--------------------------------
> >  1 file changed, 11 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/ide/triflex.c b/drivers/ide/triflex.c
> > index 1886bbfb9e5d..f707f11c296d 100644
> > --- a/drivers/ide/triflex.c
> > +++ b/drivers/ide/triflex.c
> > @@ -100,48 +100,25 @@ static const struct pci_device_id
> triflex_pci_tbl[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, triflex_pci_tbl);
> >
> > -#ifdef CONFIG_PM
> > -static int triflex_ide_pci_suspend(struct pci_dev *dev, pm_message_t
> state)
> > -{
> > -     /*
> > -      * We must not disable or powerdown the device.
> > -      * APM bios refuses to suspend if IDE is not accessible.
> > -      */
> > -     pci_save_state(dev);
> > -     return 0;
> > -}
> > -
> > -static int triflex_ide_pci_resume(struct pci_dev *dev)
> > +/*
> > + * We must not disable or powerdown the device.
> > + * APM bios refuses to suspend if IDE is not accessible.
> > + */
> > +static void triflex_pci_pm_cap_fixup(struct pci_dev *pdev)
> >  {
> > -     struct ide_host *host = pci_get_drvdata(dev);
> > -     int rc;
> > -
> > -     pci_set_power_state(dev, PCI_D0);
> > -
> > -     rc = pci_enable_device(dev);
> > -     if (rc)
> > -             return rc;
> > -
> > -     pci_restore_state(dev);
> > -     pci_set_master(dev);
> > -
> > -     if (host->init_chipset)
> > -             host->init_chipset(dev);
> > -
> > -     return 0;
> > +     dev_info(&pdev->dev, "Disable triflex to be turned off by PCI
> CORE\n");
>
> I would change this message to "Disabling PCI power management" to be
> more like existing messages:
>
>   "PM disabled\n"
>   "Disabling PCI power management to avoid bug\n"
>   "Disabling PCI power management on camera ISP\n"
>
> > +     pdev->pm_cap = 0;
> >  }
> > -#else
> > -#define triflex_ide_pci_suspend NULL
> > -#define triflex_ide_pci_resume NULL
> > -#endif
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_COMPAQ,
> > +                     PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE,
> > +                     triflex_pci_pm_cap_fixup);
>
> I don't think this needs to be a fixup.  This could be done in the
> probe routine (triflex_init_one()).
>
> Doing it as a fixup means the PCI core will check every PCI device
> to see if it matches PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE, which is a
> little extra useless overhead and quirks are a little bit magic
> because it's not as obvious how they're called.
>
> But since triflex_init_one() is called only for the devices we care
> about, you can just do:
>
>   static int triflex_init_one(struct pci_dev *dev, const struct
> pci_device_id *id)
>   {
>         dev->pm_cap = 0;
>         dev_info(...);
>         return ide_pci_init_one(dev, &triflex_device, NULL);
>   }
>
Seems a better approach. And in that case I won't need this extra patch
just for triflex. I can put dev->pm_cap=0 change
in [Patch 1/1] along with other ide drivers.

--Vaibhav Gupta

>
> >  static struct pci_driver triflex_pci_driver = {
> >       .name           = "TRIFLEX_IDE",
> >       .id_table       = triflex_pci_tbl,
> >       .probe          = triflex_init_one,
> >       .remove         = ide_pci_remove,
> > -     .suspend        = triflex_ide_pci_suspend,
> > -     .resume         = triflex_ide_pci_resume,
> > +     .driver.pm      = &ide_pci_pm_ops,
> >  };
> >
> >  static int __init triflex_ide_init(void)
> > --
> > 2.27.0
> >
>

--000000000000520bd105a9e02f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jul 8, 2020, 2:12 AM Bjorn Helgaas &lt;<a href=
=3D"mailto:helgaas@kernel.org">helgaas@kernel.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Fri, Jul 03, 2020 at 01:44:26PM +0530, Vai=
bhav Gupta wrote:<br>
&gt; While upgrading ide_pci_suspend() and ide_pci_resume(), all other sour=
ce<br>
&gt; files, using same callbacks, were also updated except<br>
&gt; drivers/ide/triflex.c. This is because the driver does not want to pow=
er<br>
&gt; off the device during suspend. A quirk was required for the same.<br>
&gt; <br>
&gt; This patch provides the fix. Another driver,<br>
&gt; drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c, makes use o=
f<br>
&gt; a quirk for similar goal. Hence a similar quirk has been applied for<b=
r>
&gt; triflex.<br>
&gt; <br>
&gt; Compile-tested only.<br>
&gt; <br>
&gt; Signed-off-by: Vaibhav Gupta &lt;<a href=3D"mailto:vaibhavgupta40@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">vaibhavgupta40@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/ide/triflex.c | 45 +++++++++++--------------------------=
------<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 34 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/ide/triflex.c b/drivers/ide/triflex.c<br>
&gt; index 1886bbfb9e5d..f707f11c296d 100644<br>
&gt; --- a/drivers/ide/triflex.c<br>
&gt; +++ b/drivers/ide/triflex.c<br>
&gt; @@ -100,48 +100,25 @@ static const struct pci_device_id triflex_pci_tb=
l[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 MODULE_DEVICE_TABLE(pci, triflex_pci_tbl);<br>
&gt;=C2=A0 <br>
&gt; -#ifdef CONFIG_PM<br>
&gt; -static int triflex_ide_pci_suspend(struct pci_dev *dev, pm_message_t =
state)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * We must not disable or powerdown the device.<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 * APM bios refuses to suspend if IDE is not acce=
ssible.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pci_save_state(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int triflex_ide_pci_resume(struct pci_dev *dev)<br>
&gt; +/*<br>
&gt; + * We must not disable or powerdown the device.<br>
&gt; + * APM bios refuses to suspend if IDE is not accessible.<br>
&gt; + */<br>
&gt; +static void triflex_pci_pm_cap_fixup(struct pci_dev *pdev)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct ide_host *host =3D pci_get_drvdata(dev);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pci_set_power_state(dev, PCI_D0);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rc =3D pci_enable_device(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (rc)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pci_restore_state(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pci_set_master(dev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (host-&gt;init_chipset)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;init_chipset=
(dev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&gt;dev, &quot;Disable triflex=
 to be turned off by PCI CORE\n&quot;);<br>
<br>
I would change this message to &quot;Disabling PCI power management&quot; t=
o be<br>
more like existing messages:<br>
<br>
=C2=A0 &quot;PM disabled\n&quot;<br>
=C2=A0 &quot;Disabling PCI power management to avoid bug\n&quot;<br>
=C2=A0 &quot;Disabling PCI power management on camera ISP\n&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pdev-&gt;pm_cap =3D 0;<br>
&gt;=C2=A0 }<br>
&gt; -#else<br>
&gt; -#define triflex_ide_pci_suspend NULL<br>
&gt; -#define triflex_ide_pci_resume NULL<br>
&gt; -#endif<br>
&gt; +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_COMPAQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0triflex_pci_pm_cap_fixup);<br>
<br>
I don&#39;t think this needs to be a fixup.=C2=A0 This could be done in the=
<br>
probe routine (triflex_init_one()).<br>
<br>
Doing it as a fixup means the PCI core will check every PCI device<br>
to see if it matches PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE, which is a<br>
little extra useless overhead and quirks are a little bit magic<br>
because it&#39;s not as obvious how they&#39;re called.<br>
<br>
But since triflex_init_one() is called only for the devices we care<br>
about, you can just do:<br>
<br>
=C2=A0 static int triflex_init_one(struct pci_dev *dev, const struct pci_de=
vice_id *id)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;pm_cap =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(...);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ide_pci_init_one(dev, &amp;triflex_devic=
e, NULL);<br>
=C2=A0 }<br></blockquote></div></div><div dir=3D"auto">Seems a better appro=
ach. And in that case I won&#39;t need this extra patch just for triflex. I=
 can put dev-&gt;pm_cap=3D0 change</div><div dir=3D"auto">in [Patch 1/1] al=
ong with other ide drivers.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">--Vaibhav Gupta</div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
&gt;=C2=A0 static struct pci_driver triflex_pci_driver =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;TRIFLEX_IDE&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D trif=
lex_pci_tbl,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 triflex_init_one,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 ide_pci_remove,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.suspend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D triflex_i=
de_pci_suspend,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.resume=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D trif=
lex_ide_pci_resume,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.pm" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">driver.pm</a>=C2=A0 =C2=A0 =C2=A0 =3D &amp;ide=
_pci_pm_ops,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int __init triflex_ide_init(void)<br>
&gt; -- <br>
&gt; 2.27.0<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000520bd105a9e02f59--

--===============6317138463250410308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6317138463250410308==--
