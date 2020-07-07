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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B910C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 20:49:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E62A20771
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 20:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+5WvZ9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E62A20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0663B894C0;
	Tue,  7 Jul 2020 20:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kq+07Rh3m1e5; Tue,  7 Jul 2020 20:49:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 127D8894A7;
	Tue,  7 Jul 2020 20:49:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05F01C0893;
	Tue,  7 Jul 2020 20:49:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B94E5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A8B1287D23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOSBZ5b-xtSb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD5C187CB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 20:49:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l1so2735763ioh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ggC36aXQ5rJyOPfi4j54leeMlv15yykZmQrx5jdmp+4=;
 b=g+5WvZ9zc5SqIlBhZnxtNLyDnpFSylqGCpHGYuJfpCB29yGVHGn3+ENlPD6PZ5y/Sb
 jl3IZg3KmYAQdP3U3Zf9xGSaQnYC94KrdsKy45Jp9I9uZ2/qPFpa5sWpCQFoPWvyoUk0
 awq6os/21KapxkxjQCrb+IuxT48gzkeUahR2SJxWQ4Imo6ZRQcOG3RB4GR9WlNYbi0XA
 Ev86i74+i6GS/qeUxx59SIPAD2BlLShit+GMWvfJcDXx0RG8ZxAkzDk5VzAVBDrd8vb3
 +YSY/HtZi9REQi0oYj6/o0tnSIJvJjWSIDASv+89naSKbFCozRaAFJJ5BvtkLfOm5hb8
 JHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ggC36aXQ5rJyOPfi4j54leeMlv15yykZmQrx5jdmp+4=;
 b=YJQu8e7sOoPxE+NlQp20r7ImrVF1vw+zIzMpKfQcGwxmpO5Dc3yx/hUB3RoFaC0MQA
 eQEu5gNwBLw5ImckVg9+kSR2UsZcSHic5NIGsnBA1zUj1zaxEo+Oaye6DVT3JqIQvNWA
 csDylF/VspV0ni4iSh9ssR/h7KlK/S1X5svy9kv0DjCsHM4XnkAPBSTB6eXHMgkOMXNH
 pntBRaxfzSPwq2D3CaR6ka2Lp5mk1W+GKfF1Zch+oiJV8pEtjYMCT9kWiIeKcJxEX9IZ
 MqdxKgbItx9OEQA47/qAgdhDaLmQhsK0xYEX1aiLI/6W3oM3V4qlcx2mC8omtf5ESrwL
 0C2g==
X-Gm-Message-State: AOAM531N/6NFAPnWDcaiMTfwq0wv5aOfEXUBCTySP4F0TaHni9KMi/JK
 dHeTpugCj4xkw1wSO+6Q7ezkL2zoRMUvSyQJLjY=
X-Google-Smtp-Source: ABdhPJxxDAQG0pe66HA7MJhE+A2fpiQfrgx/dPAh9kVHAV5hYLcep+pu0HRi7mHVaeYEiiF0mPp2HqE3qD1gETaojdY=
X-Received: by 2002:a6b:6b18:: with SMTP id g24mr31487348ioc.8.1594154960035; 
 Tue, 07 Jul 2020 13:49:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:92d6:0:0:0:0:0 with HTTP;
 Tue, 7 Jul 2020 13:49:19 -0700 (PDT)
Received: by 2002:a6b:92d6:0:0:0:0:0 with HTTP;
 Tue, 7 Jul 2020 13:49:19 -0700 (PDT)
In-Reply-To: <20200707204201.GA382915@bjorn-Precision-5520>
References: <20200703081428.1011527-3-vaibhavgupta40@gmail.com>
 <20200707204201.GA382915@bjorn-Precision-5520>
From: Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date: Wed, 8 Jul 2020 02:19:19 +0530
Message-ID: <CAPRy4h2FB3rQ5pni+XaceMtBDyHDxADfj00ZZCWXcdpv1ozPTg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
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
Content-Type: multipart/mixed; boundary="===============7169500521948606427=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7169500521948606427==
Content-Type: multipart/alternative; boundary="0000000000001c216f05a9e0209e"

--0000000000001c216f05a9e0209e
Content-Type: text/plain; charset="UTF-8"

Hello all,

I have applied to Linux Mentorship on community bridge.

May I know further updates on whether passed Skill evaluation and when can
i start with application contribution.


Hoping for a positive response
Dhiraj Sharma

On Jul 8, 2020 02:12, "Bjorn Helgaas" <helgaas@kernel.org> wrote:

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
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>

--0000000000001c216f05a9e0209e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif;font-size:13.44px">=
Hello all,</span><div dir=3D"auto" style=3D"font-family:sans-serif;font-siz=
e:13.44px"><br></div><div dir=3D"auto" style=3D"font-family:sans-serif;font=
-size:13.44px">I have applied to Linux Mentorship on community bridge.</div=
><div dir=3D"auto" style=3D"font-family:sans-serif;font-size:13.44px"><br><=
/div><div dir=3D"auto" style=3D"font-family:sans-serif;font-size:13.44px">M=
ay I know further updates on whether passed Skill evaluation and when can i=
 start with application contribution.</div><div dir=3D"auto" style=3D"font-=
family:sans-serif;font-size:13.44px"><br></div><div dir=3D"auto" style=3D"f=
ont-family:sans-serif;font-size:13.44px"><br></div><div dir=3D"auto" style=
=3D"font-family:sans-serif;font-size:13.44px">Hoping for a positive respons=
e</div><font color=3D"#888888" style=3D"font-family:sans-serif;font-size:13=
.44px"></font><div dir=3D"auto">Dhiraj Sharma</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Jul 8, 2020 02:12, &quot;Bjorn H=
elgaas&quot; &lt;<a href=3D"mailto:helgaas@kernel.org">helgaas@kernel.org</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri=
, Jul 03, 2020 at 01:44:26PM +0530, Vaibhav Gupta wrote:<br>
&gt; While upgrading ide_pci_suspend() and ide_pci_resume(), all other sour=
ce<br>
&gt; files, using same callbacks, were also updated except<br>
&gt; drivers/ide/triflex.c. This is because the driver does not want to pow=
er<br>
&gt; off the device during suspend. A quirk was required for the same.<br>
&gt; <br>
&gt; This patch provides the fix. Another driver,<br>
&gt; drivers/staging/media/atomisp/<wbr>pci/atomisp_gmin_platform.c, makes =
use of<br>
&gt; a quirk for similar goal. Hence a similar quirk has been applied for<b=
r>
&gt; triflex.<br>
&gt; <br>
&gt; Compile-tested only.<br>
&gt; <br>
&gt; Signed-off-by: Vaibhav Gupta &lt;<a href=3D"mailto:vaibhavgupta40@gmai=
l.com">vaibhavgupta40@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/ide/triflex.c | 45 +++++++++++-------------------<wbr>--=
-----------<br>
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
&gt; +static void triflex_pci_pm_cap_fixup(<wbr>struct pci_dev *pdev)<br>
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
&gt; +DECLARE_PCI_FIXUP_FINAL(PCI_<wbr>VENDOR_ID_COMPAQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PCI_DEVICE_ID_COMPAQ_TRIFLEX_<wbr>IDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0triflex_pci_pm_cap_fixup);<br>
<br>
I don&#39;t think this needs to be a fixup.=C2=A0 This could be done in the=
<br>
probe routine (triflex_init_one()).<br>
<br>
Doing it as a fixup means the PCI core will check every PCI device<br>
to see if it matches PCI_DEVICE_ID_COMPAQ_TRIFLEX_<wbr>IDE, which is a<br>
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
=C2=A0 }<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.pm" rel=3D"noreferrer" =
target=3D"_blank">driver.pm</a>=C2=A0 =C2=A0 =C2=A0 =3D &amp;ide_pci_pm_ops=
,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int __init triflex_ide_init(void)<br>
&gt; -- <br>
&gt; 2.27.0<br>
&gt; <br>
______________________________<wbr>_________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org">Linux-ker=
nel-mentees@lists.<wbr>linuxfoundation.org</a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxfoundation=
.<wbr>org/mailman/listinfo/linux-<wbr>kernel-mentees</a><br>
</blockquote></div></div>

--0000000000001c216f05a9e0209e--

--===============7169500521948606427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7169500521948606427==--
