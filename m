Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD06C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 14:46:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB3B20738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 14:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjZb9tp5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB3B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D953F88F5D;
	Mon, 13 Jul 2020 14:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWWltHwB4nsy; Mon, 13 Jul 2020 14:46:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E74888F20;
	Mon, 13 Jul 2020 14:46:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AE1CC088E;
	Mon, 13 Jul 2020 14:46:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C73C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D378A8786B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wp_GoDohWTQG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3539D87864
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:46:10 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p25so6716086vsg.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sXDtIdevzqA5VeeTOBVnVzNGYCtSMvK3MewX8YaoXNc=;
 b=HjZb9tp5wXSKcnyDlw/uwY68gDgjuxA+rrMq4/1Noaxn1kTmAvvbCFHBXdEOu9KC2R
 gUXpHFJM4NyNKTPKPokmK2uQNGndt1YkNq8gx6yHHhvHJ48SNgA2riMI7FFLhNvSe8QO
 naafBRyePgmayXtamtNU1q9UKqtyrFMkyOE7w4viio+rwz7hIOEI4Ird+9Kuvv3X5Gc8
 7PjJe7yXP6cCUmvAVrDNC4X8jJo/x/cGFT1WxlATu/U8F10lIzGNdBYQuTPDcyhfTtNY
 iY8wR4cJKnT3t0kcmL6gRINgsZJbKdGLDeUf/KNojyAaX0RwDVbbX9JDELtQ+un00HNr
 r6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sXDtIdevzqA5VeeTOBVnVzNGYCtSMvK3MewX8YaoXNc=;
 b=M4OHDm1v63PwEdBaKID009XVigF6jEiZyOwRY4jqOfK3zX13ZXWmd0pHk0qu7aWVoR
 XsWOcC7pD9vIChyEGYY6/aRUrT9vC7CNFN+QEocwn4n1fEBbMIIBzfe1PJuInjM9NyCW
 n78/di37JfDW1k/6WxhJlpBMICJW6bgM3IcuxDxQdEyjyRKf02lsxRXZnGD+tAy5jEBi
 KQtvi973PXRq1zTPhrW8n0sOXj+WCfEzX8jz8RDhS0a2NhatHDSfszkPOci8heWta6+l
 hzAlYHwlkhK58lgtzLI3bunI9o7PVlxsv7PWxlzKlpQG0X3CSir9dy2JloG5Kp+RANOI
 SJQA==
X-Gm-Message-State: AOAM530Uv1JnzN3RY/LzdERrZnegeQkRZx45VFjwE/RQm2aUhwPlLnwh
 AKcq/Hb3UtEJNUJfkLoCrNlW9ew6coxeWLghA+0=
X-Google-Smtp-Source: ABdhPJyCbxjn4VuZjvpaLWSsrymSq/V1ZPQfDCU4UoZuK6HdOQHUQTXePZek6pZHpVS769/IW+j4n+7O3kdJUI4XbkE=
X-Received: by 2002:a67:6441:: with SMTP id y62mr50541045vsb.82.1594651569090; 
 Mon, 13 Jul 2020 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200629072525.156154-1-vaibhavgupta40@gmail.com>
 <87a703xys7.fsf@codeaurora.org>
In-Reply-To: <87a703xys7.fsf@codeaurora.org>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Mon, 13 Jul 2020 20:15:56 +0530
Message-ID: <CAP+cEONk=XKqw4FWkBgTTaudGewJb832OjHutUpAKYpnY-uJ3A@mail.gmail.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, netdev@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] ipw2x00: use generic
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
Content-Type: multipart/mixed; boundary="===============2587654170111726085=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2587654170111726085==
Content-Type: multipart/alternative; boundary="00000000000050f3c105aa53c02b"

--00000000000050f3c105aa53c02b
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 13, 2020, 8:12 PM Kalle Valo <kvalo@codeaurora.org> wrote:

> Vaibhav Gupta <vaibhavgupta40@gmail.com> writes:
>
> > Linux Kernel Mentee: Remove Legacy Power Management.
> >
> > The purpose of this patch series is to remove legacy power management
> callbacks
> > from amd ethernet drivers.
> >
> > The callbacks performing suspend() and resume() operations are still
> calling
> > pci_save_state(), pci_set_power_state(), etc. and handling the power
> management
> > themselves, which is not recommended.
> >
> > The conversion requires the removal of the those function calls and
> change the
> > callback definition accordingly and make use of dev_pm_ops structure.
> >
> > All patches are compile-tested only.
> >
> > Vaibhav Gupta (2):
> >   ipw2100: use generic power management
> >   ipw2200: use generic power management
> >
> >  drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------------
> >  drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++--------------
>
> amd ethernet drivers? That must be a copy paste error. But no need to
> resend because of this.
>
Yes. I am genuinely sorry for this. My two patch-series had same changes,
so I copy-pasted the cover letter. Forgot to replace the name.

Thanks
-- Vaibhav Gupta

>
> --
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>

--00000000000050f3c105aa53c02b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 13, 2020, 8:12 PM Kalle Valo &lt;<a href=
=3D"mailto:kvalo@codeaurora.org">kvalo@codeaurora.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Vaibhav Gupta &lt;<a href=3D"mailto:vaibh=
avgupta40@gmail.com" target=3D"_blank" rel=3D"noreferrer">vaibhavgupta40@gm=
ail.com</a>&gt; writes:<br>
<br>
&gt; Linux Kernel Mentee: Remove Legacy Power Management.<br>
&gt;<br>
&gt; The purpose of this patch series is to remove legacy power management =
callbacks<br>
&gt; from amd ethernet drivers.<br>
&gt;<br>
&gt; The callbacks performing suspend() and resume() operations are still c=
alling<br>
&gt; pci_save_state(), pci_set_power_state(), etc. and handling the power m=
anagement<br>
&gt; themselves, which is not recommended.<br>
&gt;<br>
&gt; The conversion requires the removal of the those function calls and ch=
ange the<br>
&gt; callback definition accordingly and make use of dev_pm_ops structure.<=
br>
&gt;<br>
&gt; All patches are compile-tested only.<br>
&gt;<br>
&gt; Vaibhav Gupta (2):<br>
&gt;=C2=A0 =C2=A0ipw2100: use generic power management<br>
&gt;=C2=A0 =C2=A0ipw2200: use generic power management<br>
&gt;<br>
&gt;=C2=A0 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------=
------<br>
&gt;=C2=A0 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++---------=
-----<br>
<br>
amd ethernet drivers? That must be a copy paste error. But no need to<br>
resend because of this.<br></blockquote></div></div><div dir=3D"auto">Yes. =
I am genuinely sorry for this. My two patch-series had same changes, so I c=
opy-pasted the cover letter. Forgot to replace the name.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">-- Vaibhav G=
upta</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
-- <br>
<a href=3D"https://wireless.wiki.kernel.org/en/developers/documentation/sub=
mittingpatches" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wir=
eless.wiki.kernel.org/en/developers/documentation/submittingpatches</a><br>
</blockquote></div></div></div>

--00000000000050f3c105aa53c02b--

--===============2587654170111726085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2587654170111726085==--
