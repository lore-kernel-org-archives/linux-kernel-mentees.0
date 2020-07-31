Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6D3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 06:29:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66170208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 06:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STq7S2gO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66170208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41DEB204BD;
	Fri, 31 Jul 2020 06:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MeXfFShGFIOS; Fri, 31 Jul 2020 06:29:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 954C72048B;
	Fri, 31 Jul 2020 06:29:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C4FFC0050;
	Fri, 31 Jul 2020 06:29:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12AFEC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EE66088726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyeZfx9qdKKf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:29:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D6B088724
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:29:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id m16so16474047pls.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Vj9Cj58YPvvzRSUXIygN4NcSF4V7AWXRIYQ989mKtpY=;
 b=STq7S2gO+6ysRttifAr+CU748w7JFuYWSFpyLuRD6bSMrTiYyHouCWLscIQxxZZoZy
 2on/LBajM3b5jsARQcvFXsbClMO7rUp8hp73sNfFiM/5yQU1J6iEMYU7GH7RAJMA4Xuk
 jUbfMHlhToK9EnbZ5XIVXeWpArl8KOnh0R8CkvGHymOCLVq4ZRzz/hcQgF67AXt3S/Xb
 EHYbE6riDNO7ioi82Fn1Dh5eZ6QmAUTIHRFR7qqc6BdF+yORtY/aXOVyqYiNmDVv11ov
 4dAyP0zsjlHkq0mswidp0sNFPozpLkvPZjhrQjiI84AjDPbpEixwMkRgiN9IS1BE6jZf
 YhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Vj9Cj58YPvvzRSUXIygN4NcSF4V7AWXRIYQ989mKtpY=;
 b=bKkEzITvriwu9DOrl9ZGsfu/WU6OJ89Ut9XYdh/VmDoGzx5JOoCNYeoJEFhMiuzE6V
 tUibPhdZdkGW01zZGhDrrK95QMDzowdEFE5rXxYzv1buxRMVPCXi3uhqC2GuBakK8ziF
 IQKvYysvMHgv3jDDiPWUij3MQKBsD/AbLEetXTCR9P70J/qqa1mJgm4FO4Z5ktxfEvLE
 munQSCe1IgcdaUPmqZuCFFGMKmdQRFEokQcrpkLgRvv/7Fz+RUs1+vX3yBqbevTbPVBC
 1XXi5rMIOMRvuWFUiTxcrLBLRess2oX3Kn6vrMl90EKLC/WRp3X+gki0+pei+EFGLm1N
 KHHw==
X-Gm-Message-State: AOAM533qspUWiOasCDZDSnUpEqcGesB396HhuMAijUdY6XeWFLWcI3XK
 drmQVPyfWN6ucQawvwEvNF25Mx6qn7wSHfYmkEU=
X-Google-Smtp-Source: ABdhPJyBGxsXkpkmTsVcY5Vn/aUUdAA2y+3CuNJ7BD5x+HMqKiwabQSmxB0QCRuivKyy/E/RQcdg68kFuUAw6XFPe2k=
X-Received: by 2002:a17:902:9a4b:: with SMTP id
 x11mr2399883plv.255.1596176968819; 
 Thu, 30 Jul 2020 23:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:17d1:0:0:0:0 with HTTP; Thu, 30 Jul 2020 23:29:27
 -0700 (PDT)
In-Reply-To: <20200731053333.GB466103@kroah.com>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jul 2020 09:29:27 +0300
Message-ID: <CAHp75Vdr2HC_ogNhBCxxGut9=Z6pQMFiA0w-268OQv+5unYOTg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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
Content-Type: multipart/mixed; boundary="===============8520302370510969840=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8520302370510969840==
Content-Type: multipart/alternative; boundary="00000000000039ac9e05abb6e9e4"

--00000000000039ac9e05abb6e9e4
Content-Type: text/plain; charset="UTF-8"

On Friday, July 31, 2020, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
wrote:

> On Fri, Jul 31, 2020 at 07:33:06AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 31, 2020 at 07:53:01AM +0300, Leon Romanovsky wrote:
> > > On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:
> > > > rds_notify_queue_get() is potentially copying uninitialized kernel
> stack
> > > > memory to userspace since the compiler may leave a 4-byte hole at
> the end
> > > > of `cmsg`.
> > > >
> > > > In 2016 we tried to fix this issue by doing `= { 0 };` on `cmsg`,
> which
> > > > unfortunately does not always initialize that 4-byte hole. Fix it by
> using
> > > > memset() instead.
> > >
> > > Of course, this is the difference between "{ 0 }" and "{}"
> initializations.
> >
> > Really?  Neither will handle structures with holes in it, try it and
> > see.


{} is a GCC extension, but I never thought it works differently.



>
> And if true, where in the C spec does it say that?
>
> thanks,
>
> greg k-h
>


-- 
With Best Regards,
Andy Shevchenko

--00000000000039ac9e05abb6e9e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, July 31, 2020, Greg Kroah-Hartman &lt;<a href=3D"mailto:=
gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Fri, Jul 31, 2020 at 07:33:06AM +0200, Greg=
 Kroah-Hartman wrote:<br>
&gt; On Fri, Jul 31, 2020 at 07:53:01AM +0300, Leon Romanovsky wrote:<br>
&gt; &gt; On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:<br>
&gt; &gt; &gt; rds_notify_queue_get() is potentially copying uninitialized =
kernel stack<br>
&gt; &gt; &gt; memory to userspace since the compiler may leave a 4-byte ho=
le at the end<br>
&gt; &gt; &gt; of `cmsg`.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In 2016 we tried to fix this issue by doing `=3D { 0 };` on =
`cmsg`, which<br>
&gt; &gt; &gt; unfortunately does not always initialize that 4-byte hole. F=
ix it by using<br>
&gt; &gt; &gt; memset() instead.<br>
&gt; &gt; <br>
&gt; &gt; Of course, this is the difference between &quot;{ 0 }&quot; and &=
quot;{}&quot; initializations.<br>
&gt; <br>
&gt; Really?=C2=A0 Neither will handle structures with holes in it, try it =
and<br>
&gt; see.</blockquote><div><br></div><div>{} is a GCC extension, but I neve=
r thought it works differently.=C2=A0</div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
And if true, where in the C spec does it say that?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000039ac9e05abb6e9e4--

--===============8520302370510969840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8520302370510969840==--
