Return-Path: <SRS0=zhe+=HQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEDFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 13:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC1664E52
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 13:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC1664E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9962C6F54F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OovRSMRdLA8s
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 14 Feb 2021 13:03:51 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id B46E96F594; Sun, 14 Feb 2021 13:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A518D6F4CE;
	Sun, 14 Feb 2021 13:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE15C0174;
	Sun, 14 Feb 2021 13:03:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06E3BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 13:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E29FA8670E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 13:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpm8x57sLFan
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 13:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 70BA2864A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 13:03:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i20so3253644edv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 05:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhMC8mOWwiCbJOquwcbZLkCBLqkgoYabEulLf76e768=;
 b=iUmHUM9B5yjhkCMI3IWVIRpwU9h/gqmvdIPg4BDHwnu8u3zqBhJB2H4zCy+5WvEqnE
 6yLrsypiAiHfFxUpSIUwzuat/damCC3xNJLT/Qrl2BlIvIoNPA0POzkOdkdx0h2VXwR5
 94uQoubXvYYyN6hsk4PGEpwURqrX9kStrs7sHaopYuXZFbmLqBXdWVKyP4yTe30BPbPe
 GplLOt6FpVUbG/BQ8wtGwJk1ry9enxJLV+rp6wzCMvI5U+31cFrigoVn4kAYpTbW8nQ8
 Xk6I5LouWfIxmvN+NkaeM7xrFENDZVXFzI+sSLJZAa45PwS0ZHyJqDZNw0brHWkK2g06
 B1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhMC8mOWwiCbJOquwcbZLkCBLqkgoYabEulLf76e768=;
 b=pOFgnmQj+cqeDCYOKu1APyGRdYTIkD7rnabhA8NIFsVVY8Ar0MEerdujI5VEYptl4n
 7CPMhXyvOb2xSjolIqsH9/Wt+LXPT2wZPCjLLq80pCEJMLSn8nzazzpvM3ILZtwSkeye
 uHjAFc/ZCNNaE9i29rjFLoOs207Jw2uN3YkIoMM2dr4ErBg9H/QY0WaChsgFtV/M+JZt
 bWSdFjwzVXy8BxZwywBggisLd2RjpXO0Wx8hrgeb9oYdySP6/+VAGH5i7XIkmzv5tf6F
 B+TaFms3EiNzsfR97+FNQ1LwWCbtJf8mL2Wc3xSjVBKORoxAORqpWGYHbBfmAJkG+iaF
 ubCw==
X-Gm-Message-State: AOAM531IKx7O0V0wBRKSsdv/L660PvYiTFg6GywZENCj91uqfpHp2DDt
 Lz/4fqVevA/n0CqyLj9mNkOxSpzRZJfyJBvKPJw=
X-Google-Smtp-Source: ABdhPJwuHJEvjs2CMpGF7ygqIF1+1Q6w1fNkVDg+r0mOyiunuzfDX8vQUk+hEeu/m/ah7bJRB8l2HblVfmBmecg79hE=
X-Received: by 2002:a05:6402:34c3:: with SMTP id
 w3mr11737801edc.3.1613307824699; 
 Sun, 14 Feb 2021 05:03:44 -0800 (PST)
MIME-Version: 1.0
References: <CANDtkxs5eJ3Rc1pxBfTnvHZbxpAFmZH97dxchbSqtHSb0hey4Q@mail.gmail.com>
 <CAKXUXMySAPVA+gHQvg0nUQyKXHOOMtYwmEr1rGn=8C+DbNo+5Q@mail.gmail.com>
 <CANDtkxv+u75ZL3s5K5Q8kns4aNhW3e50V36_u6C_Anma3Od-Uw@mail.gmail.com>
 <CAKXUXMyu5aNSojudH+7rBPOShtisPjXG9T9rzhm60ORmai35pw@mail.gmail.com>
 <CANDtkxtKncpeN5FVgEdGfavXy87MYdCW+-4wUjKuQ3BPOwwUnA@mail.gmail.com>
 <CANDtkxstAvTg-pma6PFXRZcFC6nQwXffKpr4cwdrZg2hOBrHag@mail.gmail.com>
 <CAKXUXMy+3C_nBd2_3g=wNgRWNEPD5UzOU5KgY4qL1=KvfRn-vg@mail.gmail.com>
In-Reply-To: <CAKXUXMy+3C_nBd2_3g=wNgRWNEPD5UzOU5KgY4qL1=KvfRn-vg@mail.gmail.com>
From: Divya Goswami <divyadeepti2000@gmail.com>
Date: Sun, 14 Feb 2021 18:33:12 +0530
Message-ID: <CANDtkxvn_Xgwr+vKbiHC+bisFv860myKN5g9VZ8YiwJ_wt7zfw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3693279779169379612=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3693279779169379612==
Content-Type: multipart/alternative; boundary="000000000000cdfd0305bb4b7f51"

--000000000000cdfd0305bb4b7f51
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 13, 2021 at 1:02 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Sa., 13. Feb. 2021 at 00:34, Divya Goswami <divyadeepti2000@gmail.com>
> wrote:
>
>> Hello Lukas,
>>                    I have been studying the checkpatch.pl script for a
>> while now. And as the first task was assigned, I have successfully run a
>> lot of patches through it. Most of them gave no errors/warnings. Those who
>> did so far, have been collected (and more to be collected) on my github
>> repo: checkpatch.pl-results
>> <https://github.com/rachejazz/checkpatch.pl-results>
>> Before I proceed further, I wanted to make sure whether I am uploading
>> the files/outputs in the desired way you wanted. If the file naming or the
>> hierarchy or anything that should be worked upon, do let me know.
>> Till then, I continue to work on the given tasks.
>>
>
> All good. It could be that you observe different results when you run
> checkpatch in the kernel git root directory compared to the setup you have
> now by just copying it into a different directory.
>
> But the task for now is to just run it over the last release, so e.g.,
> from v5.10 to v5.11 (which probably comes out tomorrow afternoon Pacific
> Time) and create statistics on these results. If you got that, we can start
> finetuning.
>
> Please continue.
>
> Lukas
>
>  Hello Lukas,
I have analyzed commits and got the lists alright. Also I have analyzed the
errors and warnings generated by them.
Please do check my repo: checkpatch.pl-results

<https://github.com/rachejazz/checkpatch.pl-results>
Regards,
Divya

--000000000000cdfd0305bb4b7f51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 13, 2021 at 1:02 PM Lukas=
 Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On=
 Sa., 13. Feb. 2021 at 00:34, Divya Goswami &lt;<a href=3D"mailto:divyadeep=
ti2000@gmail.com" target=3D"_blank">divyadeepti2000@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Hell=
o Lukas, <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have been study=
ing the <a href=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a=
> script for a while now. And as the first task was assigned, I have succes=
sfully run a lot of patches through it. Most of them gave no errors/warning=
s. Those who did so far, have been collected (and more to be collected) on =
my github repo: <a href=3D"https://github.com/rachejazz/checkpatch.pl-resul=
ts" target=3D"_blank">checkpatch.pl-results</a><br>Before I proceed further=
, I wanted to make sure whether I am uploading the files/outputs in the des=
ired way you wanted. If the file naming or the hierarchy or anything that s=
hould be worked upon, do let me know.<br></div><div>Till then, I continue t=
o work on the given tasks.<br></div><div></div></div></blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">All good. It could be that you observ=
e different results when you run checkpatch in the kernel git root director=
y compared to the setup you have now by just copying it into a different di=
rectory.</div><div dir=3D"auto"><br></div><div dir=3D"auto">But the task fo=
r now is to just run it over the last release, so e.g., from v5.10 to v5.11=
 (which probably comes out tomorrow afternoon Pacific Time) and create stat=
istics on these results. If you got that, we can start finetuning.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Please continue.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></di=
v></div></div></blockquote><div>=C2=A0Hello Lukas, <br></div><div>I have an=
alyzed commits and got the lists alright. Also I have analyzed the errors a=
nd warnings generated by them.<br></div><div>Please do check my repo: <a hr=
ef=3D"https://github.com/rachejazz/checkpatch.pl-results">checkpatch.pl-res=
ults<br><br></a></div><div>Regards,<br></div><div>Divya<br></div></div></di=
v>

--000000000000cdfd0305bb4b7f51--

--===============3693279779169379612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3693279779169379612==--
