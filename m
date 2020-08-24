Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B598C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 17:53:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1CA2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 17:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbsg+Fb5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A1CA2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 337FC86FC1;
	Mon, 24 Aug 2020 17:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZzOapnrIo9c; Mon, 24 Aug 2020 17:53:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DACC86F9E;
	Mon, 24 Aug 2020 17:53:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83B8CC07FF;
	Mon, 24 Aug 2020 17:53:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B64E8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A35E786FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxskFE6+KGUg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 17:53:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AC7086F9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 17:53:25 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id r197so2169723vkf.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=1H0Rbc9DmAT9uCJkKC6VRZxpMCWt+r4wsxbeyZFiUmU=;
 b=kbsg+Fb5YYVSEDo1uFrZxxphqCu1QPmhU48kmWf3ZF5mkTd5/hbWV65+hk5CCx1+hl
 Fei8AXpyhlnIjvHYXyvqnkoT1trzE22XkuV4UM5wkZTSoVdDeEMH8ymH+6xJ19E1e9hs
 87LW24OLsinLiDP98bZScO9+H3v5u7XmZZAq7ijA7qARPwdALCdxtmozSKVo31zWsMSt
 06l/+V6GWPWWzvMEBMRss9GlKE6wick/x9qr02GJWl6JCaSXrGQMgEsZHNOW6HeDSPFE
 0IeOFFAkv3n6LyiTGTek39RhmSHnUB4dIREi4nUn6ASjiz4JBQL1p5zI6XsGacDiqb/F
 MgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=1H0Rbc9DmAT9uCJkKC6VRZxpMCWt+r4wsxbeyZFiUmU=;
 b=dS8xG8oVJ7XScx738tYLG7R6tVousFvMFsmP/3VDB0KKYdZ4GrQhHe3bM2y3d2Tft/
 yQmg06YjVrXcdfPLYEJzqV7jCc8IexTIO9ZgNDdalmhBigRckL/WQiSbEflmO9WuW2R2
 1w8UN4LvVaLhvi42LVGp111piiJmrI58dhvaAlXhSPINfz2nF26S3WYn+kh7NomouTuU
 qNL1L+0vEMd7/gtgYJomPgEv/L3vad2TdFnHSF243zrB0gjkTvm33QwtkCcfNlISdiNU
 da9sRjgYjGrd6RBukFkleQYQs9Ks9t+kzzypZfiVoUKA4G8O1S+b9/+welPx5ALSPheh
 799A==
X-Gm-Message-State: AOAM531Vcw0eopiShCzFMEeK4BGjxp+X2+Ux/fH68knqCfX+2VTzfXEI
 ykagM296PnFYRCRYq4OaARTf7kIrN/gHPK9u+Wo=
X-Google-Smtp-Source: ABdhPJwFUy4SgDwrfIkLfOgP1fd0G4W9AXzkXxPmdFjqnEWrHc/IWhVTGfGM0XEK4b4YOx077cx5e6Wpuss3JM5gv18=
X-Received: by 2002:a1f:9b8f:: with SMTP id d137mr3405565vke.97.1598291604196; 
 Mon, 24 Aug 2020 10:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3jhPhyU1kVkQdzgQ+e4Lq8aqZeT3+dZ6ZsW2b7L9RrBeA@mail.gmail.com>
 <CAKXUXMxqv_bz+FL1Nckq2FD8gMs9Ymmw3j2MukJKsmgX5ambNA@mail.gmail.com>
 <CACFir3iwBLcZoS8UqOy4qvtf8gRaQgbvhHWyCREk4XD-ap+BsQ@mail.gmail.com>
 <CAKXUXMy6waZDaEPWY8g5yyASkoVgCgz6caBqxkZpMMELWOHOcw@mail.gmail.com>
 <CACFir3jUvTFfoF5CxLw3NSAy+bfLx+9qmaJHMoSpFcC0SPsChw@mail.gmail.com>
 <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
 <CACFir3i0jt6e=PWn64Hvwg91Lb2i2eNhhqdoPJjAZvmEVvk6Og@mail.gmail.com>
 <alpine.DEB.2.21.2008221926190.6653@felia>
In-Reply-To: <alpine.DEB.2.21.2008221926190.6653@felia>
From: Jay Rajput <jay24rajput@gmail.com>
Date: Mon, 24 Aug 2020 23:23:12 +0530
Message-ID: <CACFir3hREjmsjDoz0t3f3+jenEhqknwNvpdihPsidYY0kMVXPQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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
Content-Type: multipart/mixed; boundary="===============2497786275349497683=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2497786275349497683==
Content-Type: multipart/alternative; boundary="00000000000050e05005ada34314"

--00000000000050e05005ada34314
Content-Type: text/plain; charset="UTF-8"

>
> Okay, all good. The task in this mentorship is to make CodeChecker import
> the results from coccinelle into the UI.
>
> Look at:
> https://github.com/Ericsson/codechecker/tree/master/tools/report-converter
>
> If you can write a first simple report-converter for coccinelle and your
> prototype shows that you understand what needs to be done, we can devise a
> plan to make a full-fledged proper implementation with documentation,
> tests etc. If the plan is solid, I am happy to mentor you through these
> tasks.
> If your implementation works, the rough workflow should be:
>
> make coccicheck > coccicheck_output
> report-converter -o coccicheck_report -t coccinelle coccicheck_output
> CodeChecker server &
> CodeChecker store ./coccicheck_report -n linux
>
> Then, we should see the coccinelle findings nicely presented in the UI.
>
> Of course, it might be possible to modify coccinelle, provide parameters
> to the build target to simplify the parser to be implemented in
> CodeChecker.
>
> If that is not clear, we go back one step in the introduction process of
> the task.
>

Hello Lukas,

I have looked into the code for report checker and I have devised the
workflow and plan for extracting the errors in the document below:
https://docs.google.com/document/d/1Hbo4REffUS6IN2KzAKB-zAIlvUGO43Rx4adzVnG6HwM/edit?usp=sharing

For the prototype, I would make a basic parser that could extract the error
files from the coccinelle output and display it, is that correct? If there
is something more please let me know

Thanks and Regards
Jay Rajput

--00000000000050e05005ada34314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Okay, all good. The task in this mentorship is to make C=
odeChecker import <br>
the results from coccinelle into the UI.<br>
<br>
Look at: <br>
<a href=3D"https://github.com/Ericsson/codechecker/tree/master/tools/report=
-converter" rel=3D"noreferrer" target=3D"_blank">https://github.com/Ericsso=
n/codechecker/tree/master/tools/report-converter</a><br>
<br>
If you can write a first simple report-converter for coccinelle and your <b=
r>
prototype shows that you understand what needs to be done, we can devise a =
<br>
plan to make a full-fledged proper implementation with documentation, <br>
tests etc. If the plan is solid, I am happy to mentor you through these <br=
>
tasks.<br>
If your implementation works, the rough workflow should be:<br>
<br>
make coccicheck &gt; coccicheck_output<br>
report-converter -o coccicheck_report -t coccinelle coccicheck_output<br>
CodeChecker server &amp;<br>
CodeChecker store ./coccicheck_report -n linux<br>
<br>
Then, we should see the coccinelle findings nicely presented in the UI.<br>
<br>
Of course, it might be possible to modify coccinelle, provide parameters <b=
r>
to the build target to simplify the parser to be implemented in <br>
CodeChecker.<br>
<br>
If that is not clear, we go back one step in the introduction process of <b=
r>
the task.<br></blockquote><div><br></div><div>Hello Lukas,</div><div><br></=
div><div>I have looked into the code for report checker and I have devised =
the workflow and plan for extracting the errors in the document below:</div=
><div><a href=3D"https://docs.google.com/document/d/1Hbo4REffUS6IN2KzAKB-zA=
IlvUGO43Rx4adzVnG6HwM/edit?usp=3Dsharing">https://docs.google.com/document/=
d/1Hbo4REffUS6IN2KzAKB-zAIlvUGO43Rx4adzVnG6HwM/edit?usp=3Dsharing</a><br></=
div><div><br></div><div>For the prototype, I would make a basic parser that=
 could extract the error files from the coccinelle output and display it, i=
s that correct? If there is something more please let me know</div><div><br=
></div><div>Thanks and Regards</div><div>Jay Rajput</div></div></div>

--00000000000050e05005ada34314--

--===============2497786275349497683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2497786275349497683==--
