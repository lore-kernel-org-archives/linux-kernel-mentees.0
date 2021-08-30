Return-Path: <SRS0=cFAU=NV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F9CC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 07:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52A760F9E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 07:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A52A760F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C24580E99;
	Mon, 30 Aug 2021 07:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trPB1-KyVFnm; Mon, 30 Aug 2021 07:23:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5E07680E96;
	Mon, 30 Aug 2021 07:23:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 346C0C0010;
	Mon, 30 Aug 2021 07:23:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C4DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 07:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD26B80E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 07:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWsto8Xt_tRI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 07:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71D9180E96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 07:22:58 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id z18so26263932ybg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ki7r3MwiM5Qcw1Fjf9cUVt0Pru6mMMyytLWiGESFeNw=;
 b=LgWbkP3ABtYaGrpX4uyiKFdvNN7Mgb0FT4up/btrfyRn2wcbBREzUb42FtOyvnSYPu
 r0A/O7UDmosC3NG8rKG22lxbCy/ni/pKTgrJCO0fu5ZFZoxxmpkS8irmdLIDDA1KUM1+
 7BX/eg6+vqJ+FP/mU6Qz4pwNNhXqya7UXkp92uoi5MKIaav1bKqMDD2FvYepCeyAv30J
 yBzQfy/1ACkzJRVe2zhBesGYc0gb9SmBG4Z9PeqwnNvBIl1Hi/Xu/H3syhADby5hlwdx
 Pno/kWL4OCNvh3/sj9iTYrEajRcTjFhLKE6QwGYGWtaeb5XEpVUy6EbwgcjHOBC6Db0j
 AR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ki7r3MwiM5Qcw1Fjf9cUVt0Pru6mMMyytLWiGESFeNw=;
 b=JbGvDQVUZBlosSk9OZYsYVUbB+U3shM2I88phINVh5igYilV9WkwuPUhN0Pb+eKJ2D
 HBFtKFlaO3EE/lnA8xCdLRj7AHCJ7w2nPZKR3tKjlGAmccOdonfteZX+CgVkzReUoKYt
 rBtGZ7Zc/l1wL7M/sc6P0Y7c22y+hVlL9XsUbE1TnnllbI04dNHX9ubx4B3UUccdziah
 UtI+eZ47XQslCH8dWgROvVoBPpXVAPalcq2eMueyZQGuDMYvfg56tcAupMywkcORxwxc
 I+YwaYYbG5p96C1QCkeTlmk2bcN4bN27BA49O6Jk5+d+0kboRUButY12emC0FQDsmWLj
 MKzw==
X-Gm-Message-State: AOAM53110yB4RQIBSCz5XvPaMqxZSa+zKD4nwE5Z21Yd2efTnSiPRwAt
 LrB1d6A+FXB2k8m0/JElnjpUzQYAqYjpVsR/zD5Ex+GA
X-Google-Smtp-Source: ABdhPJxDnikMIw+xuVOBT0sjSCVMGDrtHdvxPOSm0V9fdcUtZd7+RX0lFwOlxr5G9xBYONy2B+f5Hma9+qPOggnrWms=
X-Received: by 2002:a25:f511:: with SMTP id a17mr21063518ybe.470.1630308177283; 
 Mon, 30 Aug 2021 00:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGAi+zOEv93cp85LPGRL1NkCB6ox+cEg-cbarLKt0Pgh+zKVgw@mail.gmail.com>
 <CAGAi+zO4XRPNzfL86EFaL=ZaDGi31wEdqdR4xroctGD0qdZrGQ@mail.gmail.com>
In-Reply-To: <CAGAi+zO4XRPNzfL86EFaL=ZaDGi31wEdqdR4xroctGD0qdZrGQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 30 Aug 2021 08:22:46 +0100
Message-ID: <CAKXUXMzxZ3aQdtt0uZQs+iUZGPTAJ+sw_YfBDE5n6rc3r=Udug@mail.gmail.com>
Subject: Re: LFX MENTORSHIP -LINUX kernel checkpath documentation
To: 1JS16CS094 _Shraddha prasad <shraddhavp.1js16cs094@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7756364878778345122=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7756364878778345122==
Content-Type: multipart/alternative; boundary="000000000000c80e3105cac1b33f"

--000000000000c80e3105cac1b33f
Content-Type: text/plain; charset="UTF-8"

You missed the deadline. Sorry. Please consider to work for the next
application period.

Lukas

1JS16CS094 _Shraddha prasad <shraddhavp.1js16cs094@gmail.com> schrieb am
So., 29. Aug. 2021, 13:31:

> Sir any updates on my application?
>
> On Fri, 20 Aug, 2021, 11:23 am 1JS16CS094 _Shraddha prasad, <
> shraddhavp.1js16cs094@gmail.com> wrote:
>
>> Hello,
>> I am Shraddha Vasant Prasad, applying for the mentorship program.
>> I am interested in the Checkpatch Documentation mentorship program and I
>> would like to work on the tasks for the mentee selection. Thanks and
>> regards
>> Shraddha
>>
>

--000000000000c80e3105cac1b33f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>You missed the deadline. Sorry. Please consider to w=
ork for the next application period.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Lukas<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">1JS16CS094 _Shraddha prasad &lt;<a href=3D"ma=
ilto:shraddhavp.1js16cs094@gmail.com">shraddhavp.1js16cs094@gmail.com</a>&g=
t; schrieb am So., 29. Aug. 2021, 13:31:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"auto">Sir any updates on my=C2=A0application?</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 20 A=
ug, 2021, 11:23 am 1JS16CS094 _Shraddha prasad, &lt;<a href=3D"mailto:shrad=
dhavp.1js16cs094@gmail.com" target=3D"_blank" rel=3D"noreferrer">shraddhavp=
.1js16cs094@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">Hello,<br>I am Shraddha Vasant Prasad, applying for the =
mentorship program.<br><span style=3D"color:rgb(33,37,41);font-family:Poppi=
ns,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;whit=
e-space:pre-line">I am interested in the Checkpatch Documentation mentorshi=
p program and I would like to work on the tasks for the mentee selection.
</span>Thanks=C2=A0and regards=C2=A0<br>Shraddha</div>
</blockquote></div>
</blockquote></div></div></div>

--000000000000c80e3105cac1b33f--

--===============7756364878778345122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7756364878778345122==--
