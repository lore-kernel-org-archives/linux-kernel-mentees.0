Return-Path: <SRS0=je6O=I6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05A2C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Apr 2021 16:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C9D61377
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Apr 2021 16:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C9D61377
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slateberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0291260BDA;
	Thu,  1 Apr 2021 16:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1REv8t4I1pw2; Thu,  1 Apr 2021 16:17:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id D720E60BD3;
	Thu,  1 Apr 2021 16:17:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8C3EC000C;
	Thu,  1 Apr 2021 16:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15E7DC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Apr 2021 16:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E82EE84AB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Apr 2021 16:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=slateberry.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rVeoL5DGP-R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Apr 2021 16:17:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F3B84AAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Apr 2021 16:17:21 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id d10so2492364ils.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Apr 2021 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=slateberry.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xg+pu7OsO9IbiGiks3rvjoU5OWFPJpHU6s8opp8Fj0=;
 b=Mn7l7ToqF4ViBMUjUjD0YIbf3R0FdoDxzvNSF12+LzFBg8cXoZZdHnGnVszZD2vQsL
 xjZUHGxl/TCC2HNOqXmor9adHF7LUbgM/XKIiaoHmy3mtGzZh59JPWzrgsNI4YZzT2lf
 gXlXWd6s+NxQvkFFZjjotJREPgCAQGwO/RjOYFcPW8D+54umSP8K2ZFJH17SX9q9GWGT
 tcraRnXXPzu88D26AbYgSk1JnLKzaG10a7SSyylVu1xVlsY5sfqhRlaZFpA/FTWrIHtX
 0kHq3sG2TpWoGz+4EGiqe795O9YRGkaFc+Bgp7B3A9KtoCG49cg5nsMUcG8cNL2DfimR
 GdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xg+pu7OsO9IbiGiks3rvjoU5OWFPJpHU6s8opp8Fj0=;
 b=o8VNyZ6AY17A/yAlD/ihKVWZt6pdEx06j6ApfilSekSc0/0jHRSKZAa1g3e6sIVzJf
 lLKSI+WB3T41aq472IZ/xJP/v+SgVV3lQ3ntca3HpEWFg8u2CnN/D74WDk25o6/e+B/7
 5aqwB/fRWOoi/GJgqmVWHBRhyJcDMkoyfmf086cvQ0acHiIJdcduERgmNYxOpzkYE/cu
 ypRS+ckERvBFmbuPwZOi/4YBZpcczWNN/AAZuPKOMPDltZ51f2VMJHJ1SXJFotSxCqnc
 RY2aYm8/BPHXcZ4SygMGgMcHboqfQGBOQ0qQrtQW7SEj2WHPdiA2v7Vqq5eQ6pmCLx5Z
 fB4Q==
X-Gm-Message-State: AOAM531p8DzLFOS7V1W4Jc6tlfti8IYadfE3lz1maBiEC8xaY3I75TFX
 vTsHdOmLV+KC+8pfxfqc1mF70W+AQe6rBif2vmCFEQ==
X-Google-Smtp-Source: ABdhPJyNkRSzlOnzoEWFvY5gSM5HhrIP/8rTZwHYMJlS/2JSOTm4nqmQgcpeJpGE36Iar5eyZoHCqMFE0fs8fCKQRwY=
X-Received: by 2002:a92:b09:: with SMTP id b9mr7210385ilf.257.1617293840817;
 Thu, 01 Apr 2021 09:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
 <CA+B_sTD0yHzKX82HVSuFkHcQXzHBVc31aF0nd_dOTLOO=uVY1g@mail.gmail.com>
 <YFyLbEMlyBfMbbOt@kroah.com>
 <CA+B_sTBiJEXnEDZyj_bCNXJ38HerGMnV+ZuE-KW0McThk_5RyA@mail.gmail.com>
In-Reply-To: <CA+B_sTBiJEXnEDZyj_bCNXJ38HerGMnV+ZuE-KW0McThk_5RyA@mail.gmail.com>
From: Lauren Harris <lharris@slateberry.com>
Date: Fri, 2 Apr 2021 00:17:08 +0800
Message-ID: <CA+B_sTA798SJB+BzuTLf5-H-q7PVUFTzoswvH5a12iQO2WNuZw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0734149961346979008=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0734149961346979008==
Content-Type: multipart/alternative; boundary="000000000000e1368005beeb90a5"

--000000000000e1368005beeb90a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just wanted to check back in and see if you would still consider adding a
link to our article.

Here=E2=80=99s a quick refresher:

I noticed that your old link to the Multibit Bitcoin wallet (Multibit.org)
now gets redirected to a page on Github.com. (KeepKey, the company that
bought Multibit, redirected the site to that page).

You link to Multibit.org here:
lists.linuxfoundation.org/pipermail/bitcoin-dev/2013-June/002837.html

That would be a good link if all your readers were hard-core developers
looking to restart that project.

Here's the article:
https://cryptoassetrecovery.com/2021/02/19/multibit-cryptocurrency-wallet/

Would you consider sharing our article with your readers by linking to it?

Thank you for your time, and please let me know if you have any questions!

Lauren

On Fri, Mar 26, 2021 at 9:05 PM Lauren Harris <lharris@slateberry.com>
wrote:

> Hi Greg,
>
> We are wondering if you would like to link our article to yours.
>
> Please let me know if you have any questions and thank you for your time.
>
> Regards,
> Lauren
>
> On Thu, Mar 25, 2021 at 9:09 PM Greg KH <gregkh@linuxfoundation.org>
> wrote:
>
>> On Thu, Mar 25, 2021 at 05:56:02AM -0700, Lauren Harris wrote:
>> > I wanted to check in and see if you got my note about the broken link =
on
>> > your site?
>>
>> I do not think you understand what it is you are asking to have
>> changed...
>>
>

--000000000000e1368005beeb90a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><span style=3D"color:rgb(0,0,0)">I j=
ust wanted to check back in and see if you would still consider adding a li=
nk to our article.</span><br></div><div><div><font color=3D"#000000"><br>He=
re=E2=80=99s a quick refresher:<br><br></font><div>I noticed that your old =
link to the Multibit Bitcoin wallet (Multibit.org) now gets redirected to a=
 page on Github.com. (KeepKey, the company that bought Multibit, redirected=
 the site to that page).<br></div><div><br></div><div><div><div>You link to=
 Multibit.org here:=C2=A0<a href=3D"http://lists.linuxfoundation.org/piperm=
ail/bitcoin-dev/2013-June/002837.html" target=3D"_blank">lists.linuxfoundat=
ion.org/pipermail/bitcoin-dev/2013-June/002837.html</a></div></div><div><di=
v><br></div></div></div><div>That would be a good link if all your readers =
were hard-core developers looking to restart that project.</div><div><br></=
div><div><font color=3D"#000000">Here&#39;s the article:=C2=A0</font><a hre=
f=3D"https://cryptoassetrecovery.com/2021/02/19/multibit-cryptocurrency-wal=
let/" target=3D"_blank">https://cryptoassetrecovery.com/2021/02/19/multibit=
-cryptocurrency-wallet/</a></div><div style=3D"color:rgb(80,0,80)"><div><br=
></div></div></div><div><font color=3D"#000000">Would you consider sharing =
our article with your readers by linking to it?</font></div><div><font colo=
r=3D"#000000"><br></font><div><font color=3D"#000000">Thank you=C2=A0for=C2=
=A0your time, and please let me know if you have any questions!=C2=A0</font=
></div></div></div><div><font color=3D"#000000"><br></font></div><div><font=
 color=3D"#000000">Lauren</font></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at 9:05 PM=
 Lauren Harris &lt;<a href=3D"mailto:lharris@slateberry.com">lharris@slateb=
erry.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi Greg,<div><br>We are wondering if you would lik=
e to link our article to yours.</div><div><br>Please let me know if you hav=
e any questions and thank you for your time.<br><br></div><div>Regards,<br>=
</div><div>Lauren</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 9:09 PM Greg KH &lt;<a href=
=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">gregkh@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Mar 25, 2021 at 05:56:02AM -0700, Lauren Harris wrote:<br>
&gt; I wanted to check in and see if you got my note about the broken link =
on<br>
&gt; your site?<br>
<br>
I do not think you understand what it is you are asking to have<br>
changed...<br>
</blockquote></div>
</blockquote></div>

--000000000000e1368005beeb90a5--

--===============0734149961346979008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0734149961346979008==--
