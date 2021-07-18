Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD46C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67D561166
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67D561166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F36040525;
	Sun, 18 Jul 2021 04:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPaUQoT3AyjW; Sun, 18 Jul 2021 04:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7FE0C40501;
	Sun, 18 Jul 2021 04:26:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46AEEC0010;
	Sun, 18 Jul 2021 04:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30C96C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C97C606C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hV_1wnBBJxN5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F0A46066D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:26:22 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id g19so21838857ybe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 21:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNuyUQGzmF3184ZhSkn+dcbGAKCkoonR6wFIpNTlYlw=;
 b=q9fHb0joMKBtCxAXqB96GHfYqPFox+XzpkRyozQAYQiPrpS7TCC41t2Ur+zzR0fcZu
 ut1I9J7ryXuf6Z6SuLGC8mOKufNEi1XgDNo0xZ+XE05DXjOzB84auFl9qsvEYOdGvETb
 an1FTnbn/uy1fXZ9IpI4c0KB91T0ucymg4LluiNWSvubZ/3JLV91kjUSsN2YuiAHpC4D
 M+Li483KS5sqo90N8JsgqrY04n6FqTyMfdtlIhomZk8OGQznAbvhXPa2xHAkWl4NQppk
 E2UHObFKzd8MNMXP5Vg7MNaxZTF2kLKbFx8aO+25RpUJ1okObBHm1g2X33iu3z5Z4EM4
 OwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNuyUQGzmF3184ZhSkn+dcbGAKCkoonR6wFIpNTlYlw=;
 b=BIgrcXrnWOlZKKK4ZXFK/wOW/76przsTRneGYYioyDx2Fw0cgNHh11ncPav8le56s3
 16mAPrPmaoklwovgGhZhJ3KIyC3mVq+IG6kUHxaf770Y3Sx+OJJ/D+0R3gMMB3cAHt1H
 zCUch6g23Jc1C10MjC1O46+83XQSP3dzE58sKDBmJtUIjbBRBuoDkcFg0GiYwyI+yVRb
 ITjsaqDpUQJ6Qs6F1B0y/kMrQ2p6ijg+Clvqi3VbsYRo7mCWaoeA3Yg1M879UWgKOZGm
 X/IDFJCQSyJsTBe7bU4sE7Xz/Y5pE3ZuuLr514Y2eWNqQzIQMvwLGmq5dreJ3QPFQPC+
 gmOQ==
X-Gm-Message-State: AOAM530uHhnv0Vn27yVazHgUgiXBoCPWhIfornCee5kfqg7isjQnL4qZ
 GfuQB7suJzxYVipD25uOAaqy+lMccuWXg+JMz3c=
X-Google-Smtp-Source: ABdhPJzz5vWrE5VMIRBnrewPLS5CVb+ohPfIqmGbxKcKLm5KV63z62n+Hjr8zjo+VER/Do9NnBKbgjZbTg1GPmXrWhc=
X-Received: by 2002:a25:4095:: with SMTP id n143mr21723553yba.22.1626582381437; 
 Sat, 17 Jul 2021 21:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAGTWmRHbO7FcrkOzFKqiRes=L+GfVdAiLgbwjBNOQETsC3yO5A@mail.gmail.com>
In-Reply-To: <CAGTWmRHbO7FcrkOzFKqiRes=L+GfVdAiLgbwjBNOQETsC3yO5A@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 18 Jul 2021 06:26:10 +0200
Message-ID: <CAKXUXMwcK0TUHBk0kr_gVXTVeNz6TydMMJ1-UTT=33gSS0cqYg@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship
To: Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3273062860538028531=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3273062860538028531==
Content-Type: multipart/alternative; boundary="0000000000000b26bd05c75e39b9"

--0000000000000b26bd05c75e39b9
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 17, 2021 at 8:01 PM Aliya Rahmani <aliyarahmani786@gmail.com>
wrote:
>
> Greetings,
>
>   I'm Aliya, an aspiring mentee and a passionate developer. I am
interested in the Checkpatch Documentation mentorship program and I would
like to work on the tasks for the mentee selection.
>  Kindly provide me the details of the task for the mentee selection
process.
>

Thanks for your interest.

The zeroth task is to learn suitable netiquette for the communication with

the kernel community. Below are some basic rules and pointers for this
mentorship. More information on kernel netiquette is also at
https://people.kernel.org/tglx/notes-about-netiquette.

First, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm replying?


Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

Third, set up your email client according to the kernel community rules.

Here is some information to that:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/email-clients.html

Generally more information on submitting patches and responding on replies
is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Once the zeroth task is understood, you can now move on to the first task:
Running checkpatch on a specific file

Get a clone of the Linux kernel repository. The script checkpatch.pl is
under the scripts directory.


Then, the first task is to run checkpatch.pl on a few files below and share
the results:

kernel/watch_queue.c
drivers/edac/amd64_edac.c

Which information on these rules that checkpatch warns about is available
in the Checkpatch Documentation?
If documentation of these rules is available, explain your understanding of
the rules in your own words.
If no information is available in the documentation, explain your
understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check the
rule and possible violations.

Explain how to possibly fix this code with regards to that violation.

Once you succeed on this first task, we inform you about the further second
and third task.

If you fail on any of those tasks, you are out of the selection process.

The selection of the mentee will happen according to schedule, at earliest
on August 12th and at latest at the end of August. More information is
available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines
.

Good luck.

Lukas

--0000000000000b26bd05c75e39b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Jul 17, 2021 at 8:01 PM Aliya Rahmani &lt;=
<a href=3D"mailto:aliyarahmani786@gmail.com">aliyarahmani786@gmail.com</a>&=
gt; wrote:<br>&gt;<br>&gt; Greetings,<br>&gt;<br>&gt; =C2=A0 I&#39;m Aliya,=
 an aspiring mentee and a passionate developer. I am interested in the Chec=
kpatch Documentation mentorship program and I would like to work on the tas=
ks for the mentee selection.<br>&gt; =C2=A0Kindly provide me the details of=
 the task for the mentee selection process.<br>&gt;<br><br>Thanks for your =
interest.<br><br>The zeroth task is to learn suitable netiquette for the co=
mmunication with<br><br>the kernel community. Below are some basic rules an=
d pointers for this mentorship. More information on kernel netiquette is al=
so at <a href=3D"https://people.kernel.org/tglx/notes-about-netiquette">htt=
ps://people.kernel.org/tglx/notes-about-netiquette</a>.<br><br>First, pleas=
e do not top-post.<br><br>=C2=A0 =C2=A0 A: Because we read from top to bott=
om, left to right.<br>=C2=A0 =C2=A0 Q: Why should I start my reply below th=
e quoted text?<br><br>=C2=A0 =C2=A0 A: Because it messes up the order in wh=
ich people normally read text.<br>=C2=A0 =C2=A0 Q: Why is top-posting such =
a bad thing?<br><br>=C2=A0 =C2=A0 A: The lost context.<br>=C2=A0 =C2=A0 Q: =
What makes top-posted replies harder to read than bottom-posted?<br><br>=C2=
=A0 =C2=A0 A: Yes.<br>=C2=A0 =C2=A0 Q: Should I trim down the quoted part o=
f an email to which I&#39;m replying?<br><br><br>Second, please always CC: =
<a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org">linux-ker=
nel-mentees@lists.linuxfoundation.org</a>.<br><br>Third, set up your email =
client according to the kernel community rules.<br><br>Here is some informa=
tion to that:<br><br><a href=3D"https://www.kernel.org/doc/html/latest/proc=
ess/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-=
just-plain-text">https://www.kernel.org/doc/html/latest/process/submitting-=
patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text=
</a><br><a href=3D"https://www.kernel.org/doc/html/latest/process/email-cli=
ents.html">https://www.kernel.org/doc/html/latest/process/email-clients.htm=
l</a><br><br>Generally more information on submitting patches and respondin=
g on replies is at <a href=3D"https://www.kernel.org/doc/html/latest/proces=
s/submitting-patches.html">https://www.kernel.org/doc/html/latest/process/s=
ubmitting-patches.html</a><br><br>Once the zeroth task is understood, you c=
an now move on to the first task: Running checkpatch on a specific file<br>=
<br>Get a clone of the Linux kernel repository. The script <a href=3D"http:=
//checkpatch.pl">checkpatch.pl</a> is under the scripts directory.<br><br><=
br>Then, the first task is to run <a href=3D"http://checkpatch.pl">checkpat=
ch.pl</a> on a few files below and share the results:<br><br>kernel/watch_q=
ueue.c<br>drivers/edac/amd64_edac.c<br><br>Which information on these rules=
 that checkpatch warns about is available in the Checkpatch Documentation?<=
br>If documentation of these rules is available, explain your understanding=
 of the rules in your own words.<br>If no information is available in the d=
ocumentation, explain your understanding of the rule.<br><br>In any case, e=
xplain the violation that is checked and raised in the checkpatch script, i=
.e., what is implemented in checkpatch to check the rule and possible viola=
tions.<br><br>Explain how to possibly fix this code with regards to that vi=
olation.<br><br>Once you succeed on this first task, we inform you about th=
e further second and third task.<br><br>If you fail on any of those tasks, =
you are out of the selection process.<br><br><div>The selection of the ment=
ee will happen according to schedule, at earliest on August 12th and at lat=
est at the end of August. More information is available at <a href=3D"https=
://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines">ht=
tps://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines<=
/a>.<br><br>Good luck.</div><div><br>Lukas</div></div>

--0000000000000b26bd05c75e39b9--

--===============3273062860538028531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3273062860538028531==--
