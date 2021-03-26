Return-Path: <SRS0=UC8y=IY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF31C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 13:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2529619FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 13:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2529619FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slateberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C7360C29;
	Fri, 26 Mar 2021 13:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOu6cyvsMJml; Fri, 26 Mar 2021 13:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D64260C22;
	Fri, 26 Mar 2021 13:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58839C000D;
	Fri, 26 Mar 2021 13:05:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED75DC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBC0760C25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvs--LsBnMZf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE87160C22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:05:23 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id k8so5264825iop.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=slateberry.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2mQF/Dsh2l1GbpMX1jxJPtWXMg/kJQYehKfZgG96nBA=;
 b=lOtLFqlzDyJL2ivGQQ+kRUvPzcQlUJQuwoki8tGGxI0Q5belVOs61mPi0NG8lXCmQc
 9FTuLySYD+yJ8OZivWaL8s0D7VrsIsXyKaG4p4MPwx58zVzT4uSXEd5imPZ255snzbQR
 8BgvtboNrf6MR3Y92/nbyNvIWyIH1wYVA9zr0f5T7GJfxI8s5Zc6poVryUy0iDHqZTuk
 2bAc0g0SCOz6LD3HOqaBJeWew6iKJIdn7+ldfk2wpXBjggmmTLdnq5ZrqQLQ8c4ahQ75
 KjsDs52MyqYy8/7qYPqRy1YPsV8RxIDv8ovUn/5Gr133uykYPFJlIsVK6XlkWsxzza5z
 BcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mQF/Dsh2l1GbpMX1jxJPtWXMg/kJQYehKfZgG96nBA=;
 b=SrWkunJfD8yFaXfkfvqggRa5x3m6U/jQVMLJtX3J6OMQiSe+rimfEBOQ00TU/G0t8c
 mksPQLoECNBXSV2Ch/Ev4XGBfFFldS9KqV28VtgpHgdni0AX64KaIk5UxIWiWjyLUCyB
 YxbpFY5oi7AROG+kKLzlrIe80K/iSH/atdFN3Zazn+T87S4Vs7GjRgLNdLIdsdLYZ/gR
 VIEeY31m2kQyHdfDlfvpNxm7l8am/gXLkUyhszN2E1LfCCpKOb1eYYeYRkVrz+LRBa0i
 7Lq2WbKIl9a5IwmnoEue2948gb1qyN6dm69iXYA+4dXcXWotS+GYGZizDXr3O7jwVeOg
 6jXQ==
X-Gm-Message-State: AOAM533BFLgsM5AdE3ticK7Z+CbgMzkk9XsuS2JzLdtgSnWUrQc6nE/f
 lHeCMo4m4PYZsJfg8Wqh8r2jda5qQ8/hQgKD4RShOoONlwd5Gg==
X-Google-Smtp-Source: ABdhPJwRIXax2JzgjrY0wqCtn95dYAKdGjIJ2eYnL3sqf+N5SjyL3dgmbBXAvSFDaB7GGs2ODmhW86rwU8QFygx/RcM=
X-Received: by 2002:a05:6602:2287:: with SMTP id
 d7mr10230170iod.42.1616763923147; 
 Fri, 26 Mar 2021 06:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
 <CA+B_sTD0yHzKX82HVSuFkHcQXzHBVc31aF0nd_dOTLOO=uVY1g@mail.gmail.com>
 <YFyLbEMlyBfMbbOt@kroah.com>
In-Reply-To: <YFyLbEMlyBfMbbOt@kroah.com>
From: Lauren Harris <lharris@slateberry.com>
Date: Fri, 26 Mar 2021 21:05:11 +0800
Message-ID: <CA+B_sTBiJEXnEDZyj_bCNXJ38HerGMnV+ZuE-KW0McThk_5RyA@mail.gmail.com>
Subject: Re: Redirected link on lists.linuxfoundation.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============2113107866243239601=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2113107866243239601==
Content-Type: multipart/alternative; boundary="0000000000005345fc05be702f4a"

--0000000000005345fc05be702f4a
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

We are wondering if you would like to link our article to yours.

Please let me know if you have any questions and thank you for your time.

Regards,
Lauren

On Thu, Mar 25, 2021 at 9:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Mar 25, 2021 at 05:56:02AM -0700, Lauren Harris wrote:
> > I wanted to check in and see if you got my note about the broken link on
> > your site?
>
> I do not think you understand what it is you are asking to have
> changed...
>

--0000000000005345fc05be702f4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Greg,<div><br>We are wondering if you would like to lin=
k our article to yours.</div><div><br>Please let me know if you have any qu=
estions and thank you for your time.<br><br></div><div>Regards,<br></div><d=
iv>Lauren</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 25, 2021 at 9:09 PM Greg KH &lt;<a href=3D"mail=
to:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Mar 25, 20=
21 at 05:56:02AM -0700, Lauren Harris wrote:<br>
&gt; I wanted to check in and see if you got my note about the broken link =
on<br>
&gt; your site?<br>
<br>
I do not think you understand what it is you are asking to have<br>
changed...<br>
</blockquote></div>

--0000000000005345fc05be702f4a--

--===============2113107866243239601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2113107866243239601==--
