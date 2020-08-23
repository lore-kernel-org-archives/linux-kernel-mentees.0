Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29251C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 12:40:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D951B2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 12:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUTd766J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D951B2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A272687828;
	Sun, 23 Aug 2020 12:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OK2rQmwYWcNW; Sun, 23 Aug 2020 12:40:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 909AF877E0;
	Sun, 23 Aug 2020 12:40:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76839C07FF;
	Sun, 23 Aug 2020 12:40:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5491C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 12:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A22920372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 12:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id va9CysIdJi8k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 12:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F4FF20366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 12:40:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c15so6002236wrs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=voO+Dku1E6QJ40b1W79Wfu9pKH4v9OpbSmVipPNe0LQ=;
 b=eUTd766Jb7qU4obOJ/blPHIWcjJpeHF0dWnZk67vegdFt2kJ+4PAelXjXEcbRKoX7y
 WvaJDQaWv8FDgrPA/fz9TIvtSbTHOSQ9rakyeP/0+rylY4jPlkv7272hB0r6zWQ8GWhH
 Ik5gi4EtJNk/JkN0hRLmZDd+AytXhIvem5Qmk4AGjrvbnMOIf2VLTpA+BoTvty8GmCNE
 jHUsp5jnrtb08j/KXZ1keJlXCpTP9hAXe3gET9GFAQXP/D/zspX04BnulIGBurECjMFw
 bfSMEVp6m1zUdsVCvZGBkZoCipn4bnm/NPb6eNGk5hfMQtRj7DdiUVFcuTqgRJKuYHTy
 grsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=voO+Dku1E6QJ40b1W79Wfu9pKH4v9OpbSmVipPNe0LQ=;
 b=txUY9JpiQZNzFWYLfvd1Bsnxn32BVSQhhdTK//63HV98jxoOET0h9DNpz8MMbZ+662
 S9lQZL0tGc424ZrufboOfk43hdgVQ7u94KhxRELClxU+anMQLLizyog03X0yp9BaLKMU
 S2EAA0A+8ceaYxyW/omdPACV+wbQk2Fgihx7+JXZBz+tL8CFGySm+Lq5xE+xvCGzLP9s
 F7YR7Cf4fGLZgjohSGt4//HvOTenjjkietv2ao8SyJdDWKYf2L7Ar9e++gy67yDwS/Xs
 RGsxAD0ETVBcc/pVGTr+y7i0I9++Li2+1X7f9gxhtWNnb6O3BdpRzlvqN80xafMDtClJ
 GxKA==
X-Gm-Message-State: AOAM531WgoSBQf8XAG1ezZgoKlPJs4mgiRUKPtiLEDBOgHALsJnjDq+7
 WgF0VdbO00+c58kCfx5OxHXavM4gYHwV+7u0rvk=
X-Google-Smtp-Source: ABdhPJxbvWNyY0Q51MTMNJYOwjHnaqEUGea9V3blNdt4mBs3+DEDslaDX6xdpTkCpquMlgor9SDmr+gXDZtjbjXZLGs=
X-Received: by 2002:adf:f289:: with SMTP id k9mr1525962wro.203.1598186404702; 
 Sun, 23 Aug 2020 05:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
 <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
 <20200823105808.GB87391@kroah.com>
In-Reply-To: <20200823105808.GB87391@kroah.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Sun, 23 Aug 2020 18:08:48 +0530
Message-ID: <CAOY-YVmeYFznmNQh7Zj7kdewUzsFjLtHpkbFt1A4hzoUsoUmLw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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
Content-Type: multipart/mixed; boundary="===============2599549171737425320=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2599549171737425320==
Content-Type: multipart/alternative; boundary="000000000000efeba705ad8ac44b"

--000000000000efeba705ad8ac44b
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Aug, 2020, 4:27 pm Greg Kroah-Hartman, <
gregkh@linuxfoundation.org> wrote:

> On Sun, Aug 23, 2020 at 12:31:03PM +0200, Dmitry Vyukov wrote:
> > On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> > > > On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> > > > <himadrispandya@gmail.com> wrote:
> > > > >
> > > > > Initialize the buffer before passing it to usb_read_cmd()
> function(s) to
> > > > > fix the uninit-was-stored issue in asix_read_cmd().
> > > > >
> > > > > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > > > > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > > > >
> > > > > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > > > > ---
> > > > >  drivers/net/usb/asix_common.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/net/usb/asix_common.c
> b/drivers/net/usb/asix_common.c
> > > > > index e39f41efda3e..a67ea1971b78 100644
> > > > > --- a/drivers/net/usb/asix_common.c
> > > > > +++ b/drivers/net/usb/asix_common.c
> > > > > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd,
> u16 value, u16 index,
> > > > >
> > > > >         BUG_ON(!dev);
> > > > >
> > > > > +       memset(data, 0, size);
> > > >
> > > > Hi Himadri,
> > > >
> > > > I think the proper fix is to check
> > > > usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> > > > Memsetting data helps to fix the warning at hand, but the device did
> > > > not send these 0's and we use them as if the device did send them.
> > >
> > > But, for broken/abusive devices, that really is the safest thing to do
> > > here.  They are returning something that is obviously not correct, so
> > > either all callers need to check the size received really is the size
> > > they asked for, or we just plod onward with a 0 value like this.  Or we
> > > could pick some other value, but that could cause other problems if it
> > > is treated as an actual value.
> >
> > Do we want callers to do at least some error check (e.g. device did
> > not return anything at all, broke, hang)?
> > If yes, then with a separate helper function that fails on short
> > reads, we can get both benefits at no additional cost. User code will
> > say "I want 4 bytes, anything that is not 4 bytes is an error" and
> > then 1 error check will do. In fact, it seems that that was the
> > intention of whoever wrote this code (they assumed no short reads),
> > it's just they did not actually implement that "anything that is not 4
> > bytes is an error" part.
> >
> >
> > > > Perhaps we need a separate helper function (of a bool flag) that will
> > > > fail on incomplete reads. Maybe even in the common USB layer because
> I
> > > > think we've seen this type of bug lots of times and I guess there are
> > > > dozens more.
> > >
> > > It's not always a failure, some devices have protocols that are "I
> could
> > > return up to a max X bytes but could be shorter" types of messages, so
> > > it's up to the caller to check that they got what they really asked
> for.
> >
> > Yes, that's why I said _separate_ helper function. There seems to be
> > lots of callers that want exactly this -- "I want 4 bytes, anything
> > else is an error". With the current API it's harder to do - you need
> > additional checks, additional code, maybe even additional variables to
> > store the required size. APIs should make correct code easy to write.
>
> I guess I already answered both of these in my previous email...
>
> > > Yes, it's more work to do this checking.  However converting the world
> > > over to a "give me an error value if you don't read X number of bytes"
> > > function would also be the same amount of work, right?
> >
> > Should this go into the common USB layer then?
> > It's weird to have such a special convention on the level of a single
> > driver. Why are rules for this single driver so special?...
>
> They aren't special at all, so yes, we should be checking for a short
> read everywhere.  That would be the "correct" thing to do, I was just
> suggesting a "quick fix" here, sorry.
>
> Himadri, want to fix up all callers to properly check the size of the
> message recieved before they access it?  That will fix this issue
> properly.
>
> thanks,
>
> greg k-h
>

Sure. On it.

Thanks,
Himadri

>

--000000000000efeba705ad8ac44b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, 23 Aug, 2020, 4:27 pm Greg Kroah-Hartman, &lt;=
<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, Aug 23, 2020 a=
t 12:31:03PM +0200, Dmitry Vyukov wrote:<br>
&gt; On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman<br>
&gt; &lt;<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank" re=
l=3D"noreferrer">gregkh@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:<br=
>
&gt; &gt; &gt; On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:himadrispandya@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">himadrispandya@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Initialize the buffer before passing it to usb_read_cmd=
() function(s) to<br>
&gt; &gt; &gt; &gt; fix the uninit-was-stored issue in asix_read_cmd().<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Fixes: KMSAN: kernel-infoleak in raw_ioctl<br>
&gt; &gt; &gt; &gt; Reported by: <a href=3D"mailto:syzbot%2Ba7e220df5a81d1a=
b400e@syzkaller.appspotmail.com" target=3D"_blank" rel=3D"noreferrer">syzbo=
t+a7e220df5a81d1ab400e@syzkaller.appspotmail.com</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Himadri Pandya &lt;<a href=3D"mailto:him=
adrispandya@gmail.com" target=3D"_blank" rel=3D"noreferrer">himadrispandya@=
gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/net/usb/asix_common.c | 2 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/drivers/net/usb/asix_common.c b/drivers/ne=
t/usb/asix_common.c<br>
&gt; &gt; &gt; &gt; index e39f41efda3e..a67ea1971b78 100644<br>
&gt; &gt; &gt; &gt; --- a/drivers/net/usb/asix_common.c<br>
&gt; &gt; &gt; &gt; +++ b/drivers/net/usb/asix_common.c<br>
&gt; &gt; &gt; &gt; @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev,=
 u8 cmd, u16 value, u16 index,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(!dev);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(data, 0, size);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Himadri,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think the proper fix is to check<br>
&gt; &gt; &gt; usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.<b=
r>
&gt; &gt; &gt; Memsetting data helps to fix the warning at hand, but the de=
vice did<br>
&gt; &gt; &gt; not send these 0&#39;s and we use them as if the device did =
send them.<br>
&gt; &gt;<br>
&gt; &gt; But, for broken/abusive devices, that really is the safest thing =
to do<br>
&gt; &gt; here.=C2=A0 They are returning something that is obviously not co=
rrect, so<br>
&gt; &gt; either all callers need to check the size received really is the =
size<br>
&gt; &gt; they asked for, or we just plod onward with a 0 value like this.=
=C2=A0 Or we<br>
&gt; &gt; could pick some other value, but that could cause other problems =
if it<br>
&gt; &gt; is treated as an actual value.<br>
&gt; <br>
&gt; Do we want callers to do at least some error check (e.g. device did<br=
>
&gt; not return anything at all, broke, hang)?<br>
&gt; If yes, then with a separate helper function that fails on short<br>
&gt; reads, we can get both benefits at no additional cost. User code will<=
br>
&gt; say &quot;I want 4 bytes, anything that is not 4 bytes is an error&quo=
t; and<br>
&gt; then 1 error check will do. In fact, it seems that that was the<br>
&gt; intention of whoever wrote this code (they assumed no short reads),<br=
>
&gt; it&#39;s just they did not actually implement that &quot;anything that=
 is not 4<br>
&gt; bytes is an error&quot; part.<br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt; Perhaps we need a separate helper function (of a bool flag) =
that will<br>
&gt; &gt; &gt; fail on incomplete reads. Maybe even in the common USB layer=
 because I<br>
&gt; &gt; &gt; think we&#39;ve seen this type of bug lots of times and I gu=
ess there are<br>
&gt; &gt; &gt; dozens more.<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s not always a failure, some devices have protocols that a=
re &quot;I could<br>
&gt; &gt; return up to a max X bytes but could be shorter&quot; types of me=
ssages, so<br>
&gt; &gt; it&#39;s up to the caller to check that they got what they really=
 asked for.<br>
&gt; <br>
&gt; Yes, that&#39;s why I said _separate_ helper function. There seems to =
be<br>
&gt; lots of callers that want exactly this -- &quot;I want 4 bytes, anythi=
ng<br>
&gt; else is an error&quot;. With the current API it&#39;s harder to do - y=
ou need<br>
&gt; additional checks, additional code, maybe even additional variables to=
<br>
&gt; store the required size. APIs should make correct code easy to write.<=
br>
<br>
I guess I already answered both of these in my previous email...<br>
<br>
&gt; &gt; Yes, it&#39;s more work to do this checking.=C2=A0 However conver=
ting the world<br>
&gt; &gt; over to a &quot;give me an error value if you don&#39;t read X nu=
mber of bytes&quot;<br>
&gt; &gt; function would also be the same amount of work, right?<br>
&gt; <br>
&gt; Should this go into the common USB layer then?<br>
&gt; It&#39;s weird to have such a special convention on the level of a sin=
gle<br>
&gt; driver. Why are rules for this single driver so special?...<br>
<br>
They aren&#39;t special at all, so yes, we should be checking for a short<b=
r>
read everywhere.=C2=A0 That would be the &quot;correct&quot; thing to do, I=
 was just<br>
suggesting a &quot;quick fix&quot; here, sorry.<br>
<br>
Himadri, want to fix up all callers to properly check the size of the<br>
message recieved before they access it?=C2=A0 That will fix this issue<br>
properly.<br>
<br>
thanks,<br>
<br>
greg k-h<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sure. On it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
hanks,</div><div dir=3D"auto">Himadri</div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000efeba705ad8ac44b--

--===============2599549171737425320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2599549171737425320==--
