Return-Path: <SRS0=uW6w=HT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12547C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 15:30:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9944264E0F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 15:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9944264E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61DA56F52C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUDaCXI5D4Cy
	for <linux-kernel-mentees@archiver.kernel.org>;
	Wed, 17 Feb 2021 15:30:46 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 940E26005E; Wed, 17 Feb 2021 15:30:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EF46005E;
	Wed, 17 Feb 2021 15:30:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A8E2C0174;
	Wed, 17 Feb 2021 15:30:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44CCEC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 263B486B5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Te9Zc8fBur1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:30:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 00FD886B03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:30:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id a17so16717230ljq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1qzvVzrQwwYGpel92eCPwKLh4W8iFTtggWP3I+JyGY=;
 b=quctUjb2y55wHkJfLhQXLGkAqgHW+RU/NSeHOCjAA5BZ2yonBuxlkL5ql5fbuPFOlX
 A/3m+xC/1Aa8+FZh8/ViZ1n+FJS20VgT0w1CN+2DbSqbdyALH9KFYC4zxvP9cNvB5fPC
 NqEEZoSYNK0BQxhm1DJuRC/3/MkxZhsTiv97gDS5xbRU2ZkrvAHx9A1AoLdY9ARJtW0I
 ftly/k5ghcaZMdvnXvQRDOjDl4qiaDE7YIzFsOR9W1x5ij8GMe/hsc75mrxCQsFOrk4q
 CacyIyJqYtZ7AaXzsu6nUj1Q6q2r+YrO+kduNqwldj6sXLP9ugvtVRtH/3gvqzc/1QlE
 8IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1qzvVzrQwwYGpel92eCPwKLh4W8iFTtggWP3I+JyGY=;
 b=mlMSKq3dZsh4RTnfHGwasXKq9+/Si2jcAKQmMc8Eu6Z4QTZQ1WmtUFR+Ws2dFJpgp1
 4AttqJkcXpWGdg2LTBwHG4+7iVP7naQGWnPgh0vppoMDVq/Ny5JUNauLtT3yoq/tTH9+
 FzTS7gaR3VLDmNAsQAWMjV+LcjoqyATPwNRvv0RUz7HqU7XINjdmYrIfdyF9MNNLPifu
 etX2UjIk+7wpHjUPxO/H/blrTwgLGl2MLa3I4Q0c7d2D0obdwFuC+/uHILqpJGktVdUQ
 K1yhToKNR0xcbWu3VXlV+SkVkkdm5BwHf7gzkcRWa9kd2nN/tUAuI19wIouJIIRHJZcT
 S8XA==
X-Gm-Message-State: AOAM5310BnTA0z8YznQuZwwg3OvkPffD32yloieGKspoowOJyaU7M1aW
 bRe9Tm70V1icFvB4mjf1AUl0jEzdkcGZ+ts0+EY=
X-Google-Smtp-Source: ABdhPJxLG/Q+xla9KQKIOq9Yj22XnyXrOVvgyAUwruU0gjCfGH/0K9rv/Bkmyy9mg5uJ1yFM3zEVBG/sudZjOqHvPUY=
X-Received: by 2002:a05:651c:1051:: with SMTP id
 x17mr16311642ljm.310.1613575840207; 
 Wed, 17 Feb 2021 07:30:40 -0800 (PST)
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
In-Reply-To: <CAKXUXMyboDdddS7artMNo4YRVbabRVt8z4QcbBwa5af64fkU3w@mail.gmail.com>
From: Divya Goswami <divyadeepti2000@gmail.com>
Date: Wed, 17 Feb 2021 21:00:06 +0530
Message-ID: <CANDtkxuytMv9mBEcS-KTzm77hx5XuDOMe-Q5+O9-=rtPnZh++g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8276850581838851607=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8276850581838851607==
Content-Type: multipart/alternative; boundary="000000000000c6161305bb89e652"

--000000000000c6161305bb89e652
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 14, 2021 at 10:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Sun, Feb 14, 2021 at 2:03 PM Divya Goswami <divyadeepti2000@gmail.com>
> wrote:
> >
> >
> >
> > On Sat, Feb 13, 2021 at 1:02 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >>
> >>
> >>
> >> On Sa., 13. Feb. 2021 at 00:34, Divya Goswami <
> divyadeepti2000@gmail.com> wrote:
> >>>
> >>> Hello Lukas,
> >>>                    I have been studying the checkpatch.pl script for
> a while now. And as the first task was assigned, I have successfully run a
> lot of patches through it. Most of them gave no errors/warnings. Those who
> did so far, have been collected (and more to be collected) on my github
> repo: checkpatch.pl-results
> >>> Before I proceed further, I wanted to make sure whether I am uploading
> the files/outputs in the desired way you wanted. If the file naming or the
> hierarchy or anything that should be worked upon, do let me know.
> >>> Till then, I continue to work on the given tasks.
> >>
> >>
> >> All good. It could be that you observe different results when you run
> checkpatch in the kernel git root directory compared to the setup you have
> now by just copying it into a different directory.
> >>
> >> But the task for now is to just run it over the last release, so e.g.,
> from v5.10 to v5.11 (which probably comes out tomorrow afternoon Pacific
> Time) and create statistics on these results. If you got that, we can start
> finetuning.
> >>
> >> Please continue.
> >>
> >> Lukas
> >>
> >  Hello Lukas,
> > I have analyzed commits and got the lists alright. Also I have analyzed
> the errors and warnings generated by them.
> > Please do check my repo: checkpatch.pl-results
> >
>
> Looks good. Too bad that you cannot run on a large dataset.
>
> The next task is to look at three types of warnings you encounter and
> describe the purpose of the check.
>
> Lukas
>
Hello Lukas,
I have added step3 in my analysis.
I have tried it a bit differently to get ALL the non merge commits between
5.10 to 5.11. Now I can work on a large dataset :) Do check:
checkpatch.pl-results
<https://github.com/rachejazz/checkpatch.pl-results/tree/master/step3>

Regards,
Divya

--000000000000c6161305bb89e652
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 14, 2021 at 10:20 PM Lukas Bu=
lwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Sun, Feb 14, 2021 at 2:03 PM Divya Goswami &lt;<a href=3D"mailto:divyad=
eepti2000@gmail.com" target=3D"_blank">divyadeepti2000@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Feb 13, 2021 at 1:02 PM Lukas Bulwahn &lt;<a href=3D"mailto:lu=
kas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Sa., 13. Feb. 2021 at 00:34, Divya Goswami &lt;<a href=3D"mailt=
o:divyadeepti2000@gmail.com" target=3D"_blank">divyadeepti2000@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello Lukas,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 I have been studying the <a href=3D"http://checkpatch.pl" rel=3D"nor=
eferrer" target=3D"_blank">checkpatch.pl</a> script for a while now. And as=
 the first task was assigned, I have successfully run a lot of patches thro=
ugh it. Most of them gave no errors/warnings. Those who did so far, have be=
en collected (and more to be collected) on my github repo: checkpatch.pl-re=
sults<br>
&gt;&gt;&gt; Before I proceed further, I wanted to make sure whether I am u=
ploading the files/outputs in the desired way you wanted. If the file namin=
g or the hierarchy or anything that should be worked upon, do let me know.<=
br>
&gt;&gt;&gt; Till then, I continue to work on the given tasks.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; All good. It could be that you observe different results when you =
run checkpatch in the kernel git root directory compared to the setup you h=
ave now by just copying it into a different directory.<br>
&gt;&gt;<br>
&gt;&gt; But the task for now is to just run it over the last release, so e=
.g., from v5.10 to v5.11 (which probably comes out tomorrow afternoon Pacif=
ic Time) and create statistics on these results. If you got that, we can st=
art finetuning.<br>
&gt;&gt;<br>
&gt;&gt; Please continue.<br>
&gt;&gt;<br>
&gt;&gt; Lukas<br>
&gt;&gt;<br>
&gt;=C2=A0 Hello Lukas,<br>
&gt; I have analyzed commits and got the lists alright. Also I have analyze=
d the errors and warnings generated by them.<br>
&gt; Please do check my repo: checkpatch.pl-results<br>
&gt;<br>
<br>
Looks good. Too bad that you cannot run on a large dataset.<br>
<br>
The next task is to look at three types of warnings you encounter and<br>
describe the purpose of the check.<br>
<br>
Lukas<br></blockquote><div><div>Hello Lukas, <br>I have added step3 in my a=
nalysis. <br></div><div>I have tried it a bit differently to get ALL the no=
n merge commits between 5.10 to 5.11. Now I can work on a large dataset :) =
Do check: <a href=3D"https://github.com/rachejazz/checkpatch.pl-results/tre=
e/master/step3"> checkpatch.pl-results </a><br><br></div><div>Regards,<br><=
/div><div>Divya<br></div>=C2=A0</div></div></div>

--000000000000c6161305bb89e652--

--===============8276850581838851607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8276850581838851607==--
