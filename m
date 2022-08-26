Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F1CECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Aug 2022 13:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F2440545;
	Fri, 26 Aug 2022 13:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F2440545
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cdb6/FHn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-f5HRA1b8Oo; Fri, 26 Aug 2022 13:14:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4C5C640192;
	Fri, 26 Aug 2022 13:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C5C640192
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C5BC0032;
	Fri, 26 Aug 2022 13:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6057C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Aug 2022 13:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE922419F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Aug 2022 13:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE922419F0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cdb6/FHn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJJGyWiNKe6n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Aug 2022 13:14:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1273D419E9
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1273D419E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Aug 2022 13:14:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h5so1772100wru.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Aug 2022 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=Mhyr16Jb7rqP0Et4zr5iYbRDezi2Di7tJE4vgWxRJxA=;
 b=cdb6/FHn8GJm7Bi13BfqnxW7IfL3Du7S4noK9OTjdj7eitukcq5srSYkUKwlO09eft
 jySrRMrdh81X/a6dEsXPOMucAmg/KyjSyxKFvhau/2JnblLFwUKBPtaNJWXx5O0UlRPt
 KreHjXKm9TLTkK2myURgfhtjK2T8iOWSj+7R4uc83+G+q6iukzVqARpuV6ftZ16PVtvE
 /sEbNbB0fydckxEddBr38rVXWc6Lp8cpU7rz9zPXiO7LhmpiPn3ESTj0v20rvKeMIfN3
 xvk95chqW6TDnRwqz8SX4tHeLO03r846AA+MxuZvtnsTUHIei/E24fM1MXh5i/OYXJfZ
 UbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=Mhyr16Jb7rqP0Et4zr5iYbRDezi2Di7tJE4vgWxRJxA=;
 b=LQh5HX57euSQOlcGd4rxyXLXHY1lQF6GmcFmIjYFQGhmDHnwPA4ejNakKSTStxvu3K
 UMz/Oq7hPyc237UnkJG5LtbNLDr2S+rYf3dge8c0CF8tgfKA/RH9VszJm/jOveyksXEa
 rHY/gJjDhpI4M6FFTsyKq88MVwTpuhh58O8c46K3Yldft6FAhQpNcGzpGhZIsNPAvfOR
 WPPzhxLy9vurP9tj02L7Q4u/F3nJaTZPDRU6E/Ka7IWeS+bQWdxT1erWpgmab28rDZJ/
 xbHh4IlMZU9oyKQCWKAMJ2ctyhMIsEkp0x9vFd7150YLWz+WvQjoRbHF2uMguas/3iQr
 lSjQ==
X-Gm-Message-State: ACgBeo3kzAhqZpetUqA3YXx8RLW52Bj3NhUlOiJz4k5Etklt15799G/K
 80wTkap/UhQ/hxhWO1r4eq6+yDS6N7MWCZgMhLb25I3aniY=
X-Google-Smtp-Source: AA6agR4Na5QzSSIR5WGF578l0zXRLp4h+RSDLHzqcMzlbnaxASEXxn8Xt50ZraiQNnTvLE5davp2PO1gFvhxIN01PSI=
X-Received: by 2002:a5d:6f0b:0:b0:226:458c:269 with SMTP id
 ay11-20020a5d6f0b000000b00226458c0269mr1077720wrb.223.1661519681756; Fri, 26
 Aug 2022 06:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.13.1661515204.24896.linux-kernel-mentees@lists.linuxfoundation.org>
In-Reply-To: <mailman.13.1661515204.24896.linux-kernel-mentees@lists.linuxfoundation.org>
From: Muskan Paliwal <muskan10112002@gmail.com>
Date: Fri, 26 Aug 2022 18:44:29 +0530
Message-ID: <CAM1CVPpS8dfFf8mf+Lw6Na4fez9KRyh24VkKF8VrovFVkWk5QQ@mail.gmail.com>
Subject: Not interested
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4281870804205953340=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4281870804205953340==
Content-Type: multipart/alternative; boundary="0000000000006b21cc05e724b257"

--0000000000006b21cc05e724b257
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022, 5:30 PM <
linux-kernel-mentees-request@lists.linuxfoundation.org> wrote:

> Send Linux-kernel-mentees mailing list submissions to
>         linux-kernel-mentees@lists.linuxfoundation.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
> or, via email, send a message with subject or body 'help' to
>         linux-kernel-mentees-request@lists.linuxfoundation.org
>
> You can reach the person managing the list at
>         linux-kernel-mentees-owner@lists.linuxfoundation.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linux-kernel-mentees digest..."
>
>
> Today's Topics:
>
>    1. Re: [PATCH v2] usb: host: Initiate urb ep with udev ep0
>       (Alan Stern)
>    2. Hyperbaric Oxygen Therapists Contacts (Casey Beeson)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu, 25 Aug 2022 10:19:26 -0400
> From: Alan Stern <stern@rowland.harvard.edu>
> To: Khalid Masum <khalid.masum.92@gmail.com>
> Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann
>         <arnd@arndb.de>, linux-usb@vger.kernel.org,
>         linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <
> kishon@ti.com>,
>         Matthias Kaehlcke <mka@chromium.org>, Weitao Wang
>         <WeitaoWang-oc@zhaoxin.com>,
>         linux-kernel-mentees@lists.linuxfoundation.org
> Subject: Re: [PATCH v2] usb: host: Initiate urb ep with udev ep0
> Message-ID: <YweE7jCfGDhLB16G@rowland.harvard.edu>
> Content-Type: text/plain; charset=us-ascii
>
> On Thu, Aug 25, 2022 at 02:31:07AM +0600, Khalid Masum wrote:
> > Currently we look up for endpoint in a table and initate urb endpoint
> > with it. This is unnecessary because the lookup will always result in
> > endpoint 0.
> >
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
> > Changes since v1:
> >  - Remove endpoint lookup and NULL check
> >  - Remove unnecessary variable *ep
> >  - Initiate urb ep with udev ep0
> >  - Update commit message
> >  - v1 Link:
> https://lore.kernel.org/lkml/20220824130702.10912-1-khalid.masum.92@gmail.com/
> >
> >  drivers/usb/core/hcd.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index 94b305bbd621..05f30ae5570b 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2158,21 +2158,14 @@ static struct urb
> *request_single_step_set_feature_urb(
> >  {
> >       struct urb *urb;
> >       struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> > -     struct usb_host_endpoint *ep;
> >
> >       urb = usb_alloc_urb(0, GFP_KERNEL);
> >       if (!urb)
> >               return NULL;
> >
> >       urb->pipe = usb_rcvctrlpipe(udev, 0);
> > -     ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
> > -                             [usb_pipeendpoint(urb->pipe)];
> > -     if (!ep) {
> > -             usb_free_urb(urb);
> > -             return NULL;
> > -     }
> >
> > -     urb->ep = ep;
> > +     urb->ep = &udev->ep0;
> >       urb->dev = udev;
> >       urb->setup_packet = (void *)dr;
> >       urb->transfer_buffer = buf;
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
>
> ------------------------------
>
> Message: 2
> Date: Thu, 25 Aug 2022 13:46:27 -0600
> From: Casey Beeson <casey@techviewdata.com>
> To: linux-kernel-mentees@lists.linuxfoundation.org
> Subject: Hyperbaric Oxygen Therapists Contacts
> Message-ID: <b33f051a13ec29ab4808b95f561a4cd5@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> Hello,
>
>
>
> I was wondering if you would be interested in acquiring verified
> *Hyperbaric
> Oxygen Therapists Contacts*
>
>
>
> Kindly let me know you are *Target geography,* so that we can discuss on
> further details about available counts and cost.
>
>
>
> Awaiting your response.
>
>
>
> Regards,
>
> Casey Beeson
>
> Manager ? Demand Generation
>
>
>
> To opt-out kindly reply with ?not interested? in subject line
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <
> http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20220825/7194c15c/attachment-0001.html
> >
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
>
> ------------------------------
>
> End of Linux-kernel-mentees Digest, Vol 41, Issue 55
> ****************************************************
>

--0000000000006b21cc05e724b257
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Aug 26, 2022, 5:30 PM  &lt;<a href=3D"mailto:linu=
x-kernel-mentees-request@lists.linuxfoundation.org">linux-kernel-mentees-re=
quest@lists.linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Send Linux-kernel-mentees mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-mentee=
s@lists.linuxfoundation.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.linuxfoundation.org/ma=
ilman/listinfo/linux-kernel-mentees" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel=
-mentees</a><br>
<br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-request@=
lists.linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kerne=
l-mentees-request@lists.linuxfoundation.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-owner@li=
sts.linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-=
mentees-owner@lists.linuxfoundation.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Linux-kernel-mentees digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. Re: [PATCH v2] usb: host: Initiate urb ep with udev ep0<br>
=C2=A0 =C2=A0 =C2=A0 (Alan Stern)<br>
=C2=A0 =C2=A02. Hyperbaric Oxygen Therapists Contacts (Casey Beeson)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Thu, 25 Aug 2022 10:19:26 -0400<br>
From: Alan Stern &lt;<a href=3D"mailto:stern@rowland.harvard.edu" target=3D=
"_blank" rel=3D"noreferrer">stern@rowland.harvard.edu</a>&gt;<br>
To: Khalid Masum &lt;<a href=3D"mailto:khalid.masum.92@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">khalid.masum.92@gmail.com</a>&gt;<br>
Cc: Sergey Shtylyov &lt;<a href=3D"mailto:s.shtylyov@omp.ru" target=3D"_bla=
nk" rel=3D"noreferrer">s.shtylyov@omp.ru</a>&gt;, Arnd Bergmann<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"=
_blank" rel=3D"noreferrer">arnd@arndb.de</a>&gt;, <a href=3D"mailto:linux-u=
sb@vger.kernel.org" target=3D"_blank" rel=3D"noreferrer">linux-usb@vger.ker=
nel.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel@vger.kernel.org"=
 target=3D"_blank" rel=3D"noreferrer">linux-kernel@vger.kernel.org</a>, Kis=
hon Vijay Abraham I &lt;<a href=3D"mailto:kishon@ti.com" target=3D"_blank" =
rel=3D"noreferrer">kishon@ti.com</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Matthias Kaehlcke &lt;<a href=3D"mailto:mka@chr=
omium.org" target=3D"_blank" rel=3D"noreferrer">mka@chromium.org</a>&gt;, W=
eitao Wang<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:WeitaoWang-oc@zhaoxin.com=
" target=3D"_blank" rel=3D"noreferrer">WeitaoWang-oc@zhaoxin.com</a>&gt;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-mentee=
s@lists.linuxfoundation.org</a><br>
Subject: Re: [PATCH v2] usb: host: Initiate urb ep with udev ep0<br>
Message-ID: &lt;<a href=3D"mailto:YweE7jCfGDhLB16G@rowland.harvard.edu" tar=
get=3D"_blank" rel=3D"noreferrer">YweE7jCfGDhLB16G@rowland.harvard.edu</a>&=
gt;<br>
Content-Type: text/plain; charset=3Dus-ascii<br>
<br>
On Thu, Aug 25, 2022 at 02:31:07AM +0600, Khalid Masum wrote:<br>
&gt; Currently we look up for endpoint in a table and initate urb endpoint<=
br>
&gt; with it. This is unnecessary because the lookup will always result in<=
br>
&gt; endpoint 0.<br>
&gt; <br>
&gt; Suggested-by: Alan Stern &lt;<a href=3D"mailto:stern@rowland.harvard.e=
du" target=3D"_blank" rel=3D"noreferrer">stern@rowland.harvard.edu</a>&gt;<=
br>
&gt; Signed-off-by: Khalid Masum &lt;<a href=3D"mailto:khalid.masum.92@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">khalid.masum.92@gmail.com</a>&g=
t;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt;=C2=A0 - Remove endpoint lookup and NULL check<br>
&gt;=C2=A0 - Remove unnecessary variable *ep<br>
&gt;=C2=A0 - Initiate urb ep with udev ep0<br>
&gt;=C2=A0 - Update commit message<br>
&gt;=C2=A0 - v1 Link: <a href=3D"https://lore.kernel.org/lkml/2022082413070=
2.10912-1-khalid.masum.92@gmail.com/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lore.kernel.org/lkml/20220824130702.10912-1-khalid.masu=
m.92@gmail.com/</a> <br>
&gt; <br>
&gt;=C2=A0 drivers/usb/core/hcd.c | 9 +--------<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c<br>
&gt; index 94b305bbd621..05f30ae5570b 100644<br>
&gt; --- a/drivers/usb/core/hcd.c<br>
&gt; +++ b/drivers/usb/core/hcd.c<br>
&gt; @@ -2158,21 +2158,14 @@ static struct urb *request_single_step_set_fea=
ture_urb(<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct urb *urb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct usb_hcd *hcd =3D bus_to_hcd(udev-&gt;=
bus);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct usb_host_endpoint *ep;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0urb =3D usb_alloc_urb(0, GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!urb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0urb-&gt;pipe =3D usb_rcvctrlpipe(udev, 0);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0ep =3D (usb_pipein(urb-&gt;pipe) ? udev-&gt;ep_in=
 : udev-&gt;ep_out)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[usb_pipeendpoint(urb-&gt;pipe)];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!ep) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_free_urb(urb);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0urb-&gt;ep =3D ep;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0urb-&gt;ep =3D &amp;udev-&gt;ep0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0urb-&gt;dev =3D udev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0urb-&gt;setup_packet =3D (void *)dr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0urb-&gt;transfer_buffer =3D buf;<br>
<br>
Acked-by: Alan Stern &lt;<a href=3D"mailto:stern@rowland.harvard.edu" targe=
t=3D"_blank" rel=3D"noreferrer">stern@rowland.harvard.edu</a>&gt;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Thu, 25 Aug 2022 13:46:27 -0600<br>
From: Casey Beeson &lt;<a href=3D"mailto:casey@techviewdata.com" target=3D"=
_blank" rel=3D"noreferrer">casey@techviewdata.com</a>&gt;<br>
To: <a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org" targe=
t=3D"_blank" rel=3D"noreferrer">linux-kernel-mentees@lists.linuxfoundation.=
org</a><br>
Subject: Hyperbaric Oxygen Therapists Contacts<br>
Message-ID: &lt;<a href=3D"mailto:b33f051a13ec29ab4808b95f561a4cd5@mail.gma=
il.com" target=3D"_blank" rel=3D"noreferrer">b33f051a13ec29ab4808b95f561a4c=
d5@mail.gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
Hello,<br>
<br>
<br>
<br>
I was wondering if you would be interested in acquiring verified *Hyperbari=
c<br>
Oxygen Therapists Contacts*<br>
<br>
<br>
<br>
Kindly let me know you are *Target geography,* so that we can discuss on<br=
>
further details about available counts and cost.<br>
<br>
<br>
<br>
Awaiting your response.<br>
<br>
<br>
<br>
Regards,<br>
<br>
Casey Beeson<br>
<br>
Manager ? Demand Generation<br>
<br>
<br>
<br>
To opt-out kindly reply with ?not interested? in subject line<br>
-------------- next part --------------<br>
An HTML attachment was scrubbed...<br>
URL: &lt;<a href=3D"http://lists.linuxfoundation.org/pipermail/linux-kernel=
-mentees/attachments/20220825/7194c15c/attachment-0001.html" rel=3D"norefer=
rer noreferrer" target=3D"_blank">http://lists.linuxfoundation.org/pipermai=
l/linux-kernel-mentees/attachments/20220825/7194c15c/attachment-0001.html</=
a>&gt;<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank" rel=3D"noreferrer">Linux-kernel-mentees@lists.linuxfoundation.org<=
/a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.linu=
xfoundation.org/mailman/listinfo/linux-kernel-mentees</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Linux-kernel-mentees Digest, Vol 41, Issue 55<br>
****************************************************<br>
</blockquote></div>

--0000000000006b21cc05e724b257--

--===============4281870804205953340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4281870804205953340==--
