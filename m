Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C25FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 13:04:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644F464F0C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 13:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644F464F0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DF66F758;
	Thu, 25 Feb 2021 13:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eG6HHBny4Y3T; Thu, 25 Feb 2021 13:04:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA7360718;
	Thu, 25 Feb 2021 13:04:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF2BCC000B;
	Thu, 25 Feb 2021 13:04:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79E4BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 13:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687554323D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 13:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvVJ9_9fdPt4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 13:04:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 167C943223
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 13:04:13 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id a17so6379478ljq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 05:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=339LcsaBCMYibO1afJABAX3bU6ErC/V4lkpIoYHZg4I=;
 b=hQnuXvOm5hO0B265vDxU2bm7MjjageGXOH+g1wx0NyoVsXmKBHCSVEoH1dEXt+FOVm
 SI830d3p+7N9MQWfZEB36cc8I+VchIwZ3nJWwVhHpa3M5fb2XvgOzBin90Top96f7laM
 GnM+gq+I47jYBzJ++WSnXWmTKf8GmGqgGlDnaaT4mM8NUsM6PM1JQMCRpBI6Y9OxSZpy
 rP4NDi3itCKVSiivAJleCDeB9VX5yHGqA3c4tPw7CDYfGUPPdlB1Ddi9CiDMfMZhtYey
 uJF3UTRzkTghsdvYZJjpLbRW7w/rvPD/QD6j1fgmvPheprhcIDlM+GHNGYd7698AGOzY
 X3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=339LcsaBCMYibO1afJABAX3bU6ErC/V4lkpIoYHZg4I=;
 b=GsJSsmb1edtJzM8uy/9dK2obnxMWgnNKtZ9c9tukpgU21ODk5X1ynEOQSEO7hGUXlO
 jaZRtnsnuqUEZI2vngLBIVO+VkNQxBPHaJTRMnSQWMLbQRpXLu+qNPwtW0inA3x/nqau
 ZvTZGYKcL7S1Q9lvMdO7+cTSK9B+MAOAY+6aNRm5KvDJRc7nvJLzuQnc+GQfVhGHv2VA
 tCouMsdC5YCObLuZqwJ5t/ZQqv23Vla+BXgEdI1K9xwF2xvB8KrfuMx5+WS4gf4i0VVb
 4SILEGsTFVJdPiXctVNQyqNm41H4wwneoqhwcogl+gPZiKfOvcKIMv+rxh6F58Of3JAZ
 U/jQ==
X-Gm-Message-State: AOAM53261xlZOx1lI7sAjfdUj8JY1mNgxUaQSyty3Nj4k4DzsJwEsWbV
 NrSihHa1W8VHpFGpxBIc2KRA85fR2T7yxSVSY0Y=
X-Google-Smtp-Source: ABdhPJyasYnuaC6MtQxe8eS8Km7dY1FH2Ki7ni6cUXhtnLAaszH/ZXsaja/ujnz72QpZeft/2kO8JCnRSfA2CqRo5zM=
X-Received: by 2002:a2e:a48a:: with SMTP id h10mr1603588lji.78.1614258251592; 
 Thu, 25 Feb 2021 05:04:11 -0800 (PST)
MIME-Version: 1.0
References: <CANDtkxs5eJ3Rc1pxBfTnvHZbxpAFmZH97dxchbSqtHSb0hey4Q@mail.gmail.com>
 <CAKXUXMySAPVA+gHQvg0nUQyKXHOOMtYwmEr1rGn=8C+DbNo+5Q@mail.gmail.com>
 <CANDtkxv+u75ZL3s5K5Q8kns4aNhW3e50V36_u6C_Anma3Od-Uw@mail.gmail.com>
 <CAKXUXMyu5aNSojudH+7rBPOShtisPjXG9T9rzhm60ORmai35pw@mail.gmail.com>
 <CANDtkxtKncpeN5FVgEdGfavXy87MYdCW+-4wUjKuQ3BPOwwUnA@mail.gmail.com>
 <CANDtkxstAvTg-pma6PFXRZcFC6nQwXffKpr4cwdrZg2hOBrHag@mail.gmail.com>
 <CAKXUXMy+3C_nBd2_3g=wNgRWNEPD5UzOU5KgY4qL1=KvfRn-vg@mail.gmail.com>
 <CANDtkxvn_Xgwr+vKbiHC+bisFv860myKN5g9VZ8YiwJ_wt7zfw@mail.gmail.com>
 <CAKXUXMyboDdddS7artMNo4YRVbabRVt8z4QcbBwa5af64fkU3w@mail.gmail.com>
 <CANDtkxuytMv9mBEcS-KTzm77hx5XuDOMe-Q5+O9-=rtPnZh++g@mail.gmail.com>
 <CANDtkxte7p9LZzQDwyeopmk=TimhDSepcNCdOVc3Nc37FB=vKQ@mail.gmail.com>
 <CANDtkxuoizifURvpJG6_sUg8A5FqGTsL1PxcqVm1uAc=na_2ow@mail.gmail.com>
In-Reply-To: <CANDtkxuoizifURvpJG6_sUg8A5FqGTsL1PxcqVm1uAc=na_2ow@mail.gmail.com>
From: Divya Goswami <divyadeepti2000@gmail.com>
Date: Thu, 25 Feb 2021 18:33:37 +0530
Message-ID: <CANDtkxs=nJOd4vNdpPPkKWK8=RzDfXkyBaKB1jo5ZEcqN3TNLg@mail.gmail.com>
Subject: Re: Linux Kernel: Evaluate and Improve checkpatch.pl Mentorship
 Program
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============9151887257460684948=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9151887257460684948==
Content-Type: multipart/alternative; boundary="000000000000a975ac05bc28c9c0"

--000000000000a975ac05bc28c9c0
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 19, 2021 at 2:11 PM Divya Goswami <divyadeepti2000@gmail.com>
wrote:

>
>
> On Wed, Feb 17, 2021 at 11:21 PM Divya Goswami <divyadeepti2000@gmail.com>
> wrote:
>
>> Hello Lukas,
>> Wanted to ask you when my application on the Linux Foundation mentee list
>> will be accepted? Is there something more to fulfill for the selection
>> process?
>>
>> Divya
>>
>
> Hello Lukas,
> I have added step3 in my analysis. It has been some days since I have
> completed my 3rd task. I feel my previous emails haven't reached you.
> I have tried it a bit differently to get ALL the non merge commits between
> 5.10 to 5.11. Now I can work on a large dataset :) Do check: checkpatch.pl-results
>
>
> <https://github.com/rachejazz/checkpatch.pl-results/tree/master/step3>
> Also wanted to ask you when my application on the Linux Foundation mentee
> list will be accepted? Is there something more to fulfill for the selection
> process?
>
> Divya.
>

Hello Lukas,
It has been a week since not any response on getting a follow up task. Am I
still a part of this program?

Divya.

--000000000000a975ac05bc28c9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 2:11 PM Divya=
 Goswami &lt;<a href=3D"mailto:divyadeepti2000@gmail.com">divyadeepti2000@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 11:21=
 PM Divya Goswami &lt;<a href=3D"mailto:divyadeepti2000@gmail.com" target=
=3D"_blank">divyadeepti2000@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
>Hello Lukas, <br></div>Wanted to ask you when my application on the Linux =
Foundation mentee list will be accepted? Is there something more to fulfill=
 for the selection process?<br><br></div><div>Divya<br></div></div></blockq=
uote><div><br><div>Hello <span>Lukas</span>, <br>I have added step3 in my a=
nalysis. It has been some days since I have completed my 3rd task. I feel m=
y previous emails haven&#39;t reached you.<br></div><div>I
 have tried it a bit differently to get ALL the non merge commits=20
between 5.10 to 5.11. Now I can work on a large dataset :) Do check: <a hre=
f=3D"https://github.com/rachejazz/checkpatch.pl-results/tree/master/step3" =
target=3D"_blank"> checkpatch.pl-results <br><br></a></div><div>Also wanted=
 to ask you when my application on the Linux Foundation mentee=20
list will be accepted? Is there something more to fulfill for the=20
selection process?<font color=3D"#888888"><br><br></font></div><div><font c=
olor=3D"#888888">Divya.<br></font></div></div></div></div></blockquote><div=
><br></div><div>Hello Lukas,<br></div><div>It has been a week since not any=
 response on getting a follow up task. Am I still a part of this program?<b=
r><br></div><div>Divya.<br></div></div></div>

--000000000000a975ac05bc28c9c0--

--===============9151887257460684948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9151887257460684948==--
