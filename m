Return-Path: <SRS0=gXAh=HV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A0AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 08:41:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED7664E90
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 08:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED7664E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94DCD8737F;
	Fri, 19 Feb 2021 08:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZ37o3RbIYl3; Fri, 19 Feb 2021 08:41:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0403887319;
	Fri, 19 Feb 2021 08:41:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF45BC000E;
	Fri, 19 Feb 2021 08:41:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28518C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 08:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0AA0586F97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 08:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Encox0tqHzvO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 08:41:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 258E386E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 08:41:40 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o3so8346791edv.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nCve5BGrHRu6x9i3beJru9I7Wfcf/sgFxvkMOanTQJI=;
 b=guEfTtOq0CCo5n9Mp0/hsCJyp9UauQbXg/YtSPFz75/uH61gz8Je4MBAUZLu7QToEC
 J9oqdE4otX0CiVCE0vFnGnJtZ+3kD5q/8Tad01sB13z1l5wZ31u1uRyQRD3x3nsItysD
 45cCOvfK+cImc9ANy1/98d1jxg1XTSOXC2YINuuujE+kvn5Uq4PCMoQsldXjSkxpmT88
 ii+glYahEqD6IWIxCTTV/wlZFAj18eIAqATHUkznnVM5zI47XzD6pTlnKuZuFEnkeQHI
 xdws+xSa6zgZeVaYft0EEUoh+3o4N3lbBlv9YsDnEfRHLfiduwNjAYfJ4LzxpKQ096dl
 Yj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nCve5BGrHRu6x9i3beJru9I7Wfcf/sgFxvkMOanTQJI=;
 b=peKFZuqliPTgqW7f+M+U+aEtus9HWmsSSu2gL+E2voYdI0lePMn5Ab2UR/ZuKhp5bu
 vuYFoIKL0bIUOVANb/AytTNLIuKk7HeK2UvoWNPyjDf68rh+C4SrtEGSGBBoO7I0wnng
 V1d6W5h+iqHQg/OCICfhpVhCMhz3q8+62yxdL0dLPxIU1aQ8dX96F7T9Jwkgyn6EWofM
 AJfkTr/5lxhvASk2T3rbBsS03KUAPx2M9l0xpUA3O7WgDhQzu2wqSAIljBUvPd4rVw9F
 4EvBUpU+lUu5pRbNYFJiTRQtsI5o5BmrBe33+9BXCOyRlynhrO1rKgZjLEDRAyW9MVaY
 z/uA==
X-Gm-Message-State: AOAM530/Y+lYdgIZFqPAo7wnJua8Py8OyglY8HaThl6OHGZsmojukR9t
 WZnP6GYNFjTbesB2eLAli4atvh5yjTlKDL27Z9Q=
X-Google-Smtp-Source: ABdhPJyu7JbDzSS+PC15kfvbSXU+i1NPN3ET5rBpOGh28qdyGd4oc6/IF5cT/+A8BUSMqsUP3Us5bNXvPMvjNN4X058=
X-Received: by 2002:a05:6402:31af:: with SMTP id
 dj15mr7933906edb.59.1613724098381; 
 Fri, 19 Feb 2021 00:41:38 -0800 (PST)
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
In-Reply-To: <CANDtkxte7p9LZzQDwyeopmk=TimhDSepcNCdOVc3Nc37FB=vKQ@mail.gmail.com>
From: Divya Goswami <divyadeepti2000@gmail.com>
Date: Fri, 19 Feb 2021 14:11:05 +0530
Message-ID: <CANDtkxuoizifURvpJG6_sUg8A5FqGTsL1PxcqVm1uAc=na_2ow@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux Kernel: Evaluate and Improve
	checkpatch.pl Mentorship Program
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
Content-Type: multipart/mixed; boundary="===============5448714206921269010=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5448714206921269010==
Content-Type: multipart/alternative; boundary="000000000000a648fd05bbac6bc5"

--000000000000a648fd05bbac6bc5
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 17, 2021 at 11:21 PM Divya Goswami <divyadeepti2000@gmail.com>
wrote:

> Hello Lukas,
> Wanted to ask you when my application on the Linux Foundation mentee list
> will be accepted? Is there something more to fulfill for the selection
> process?
>
> Divya
>

Hello Lukas,
I have added step3 in my analysis. It has been some days since I have
completed my 3rd task. I feel my previous emails haven't reached you.
I have tried it a bit differently to get ALL the non merge commits between
5.10 to 5.11. Now I can work on a large dataset :) Do check:
checkpatch.pl-results


<https://github.com/rachejazz/checkpatch.pl-results/tree/master/step3>
Also wanted to ask you when my application on the Linux Foundation mentee
list will be accepted? Is there something more to fulfill for the selection
process?

Divya.

--000000000000a648fd05bbac6bc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 11:21 PM Divy=
a Goswami &lt;<a href=3D"mailto:divyadeepti2000@gmail.com" target=3D"_blank=
">divyadeepti2000@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Luk=
as, <br></div>Wanted to ask you when my application on the Linux Foundation=
 mentee list will be accepted? Is there something more to fulfill for the s=
election process?<br><br></div><div>Divya<br></div></div></blockquote><div>=
<br><div>Hello <span>Lukas</span>, <br>I have added step3 in my analysis. I=
t has been some days since I have completed my 3rd task. I feel my previous=
 emails haven&#39;t reached you.<br></div><div>I
 have tried it a bit differently to get ALL the non merge commits=20
between 5.10 to 5.11. Now I can work on a large dataset :) Do check: <a hre=
f=3D"https://github.com/rachejazz/checkpatch.pl-results/tree/master/step3" =
target=3D"_blank"> checkpatch.pl-results <br><br></a></div><div>Also wanted=
 to ask you when my application on the Linux Foundation mentee=20
list will be accepted? Is there something more to fulfill for the=20
selection process?<font color=3D"#888888"><br><br></font></div><div><font c=
olor=3D"#888888">Divya.<br></font></div></div></div></div>

--000000000000a648fd05bbac6bc5--

--===============5448714206921269010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5448714206921269010==--
