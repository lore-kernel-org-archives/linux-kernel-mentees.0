Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996CCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:39:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 062002168B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM4BK10M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 062002168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91BC6855B1;
	Sun, 13 Sep 2020 18:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbBLSrxlnAyT; Sun, 13 Sep 2020 18:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 163278558A;
	Sun, 13 Sep 2020 18:39:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE2C1C0864;
	Sun, 13 Sep 2020 18:39:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1768C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC4A6855B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhxKOgfGON5j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1EB448558A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:39:24 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id w25so11695887otk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/SoK/6TUXIGFsMym/t/2t4rmuyb++u3P0HHC8m0RNeE=;
 b=dM4BK10MzZnfaMXGv9LjQCdFlbe7MEBxdUxXVwA+saF4xxN7tuWrvduubJZtGUuSEK
 8CqfZ2HQ9/MpuwcpcO24/0Pjx1uOxjq7HhA5c0zopWwVusFrxZwHNtdwHm5Ie74JqNh8
 SfS8XtMc2isbYNqvrba9eZaByMZV9peuCN/9xa1KRrndEwLu0eNoIVfh8o/hri5xfhVP
 WsgyYhMCxgwTgA9RGv1xypIXFrY5UHWI/TzK+mQG6xKNmUqfINuFNARZlBrGPEft/RgO
 yHGLS3cUu1U3you+tTwGRGPsIMAH6DgeBDgOyacneHgTEzxKNNwZYHPjQCibfRlrGHAX
 ckOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/SoK/6TUXIGFsMym/t/2t4rmuyb++u3P0HHC8m0RNeE=;
 b=GoamnJQIBv7diHqvu9jjAuWb1JdB52EhoJjbgkz9yXh2rGxSVhfA5MYyWAm7M9c4NW
 /dm5IcVcZINYYOUuvRNuXEI5ovUFlHxP09JPpSdUtuy/sZ+HJttwk6AIGVDvCzNBhiwi
 wiGurDBnu/FXp/vaSNCYiubwMDRemkx6VVbWzXR3RbDDVrg64mxNkc5rMIID5f/AXS2j
 zwmWXD7g/KPw5vtKihOjNGSCLtMKLvxHOTef6ILyExcKSuewpBW3IS5RVk/KU5zc84J0
 ffijuyKVt/xRaOb2f7K5Jtq3DoYeZcpx8YV3ZBFbZ3E0AWTitMSnfivTh6xUtcWZF6WP
 jpxA==
X-Gm-Message-State: AOAM5335NTfkTgDMrH/1Lx7uSYkCWX9XlitJxByBNfaMgHLOMiSB4W4Z
 V8ZzS8DoniRnmY89CjxhR3RPMivN0locaugKbqE=
X-Google-Smtp-Source: ABdhPJwaCazbB6uxauP3nELOYDtSPUsSVns2Irg/BpkTsdAJ/fAeXcAMHuRLzyjp9yNogTj9kOsY2idldpfL1QD+9dg=
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr4273059otf.215.1600022363130; 
 Sun, 13 Sep 2020 11:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
In-Reply-To: <alpine.DEB.2.21.2009132010300.6806@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Sep 2020 00:09:11 +0530
Message-ID: <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============7246813903157015882=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7246813903157015882==
Content-Type: multipart/alternative; boundary="000000000000964f5b05af363c62"

--000000000000964f5b05af363c62
Content-Type: text/plain; charset="UTF-8"

> You should also try to find a case where checkpatch.pl can be improved:
>
> - It is best if you look at the checkpatch.pl error/warning reports and
> check if you can find a class of typical false positives in the reported
> data. Then, think about how to make the pattern in checkpatch and propose
> a patch to checkpatch.pl on this mailing list; with the evaluation data
> backing that your patch really improves the situation. We will then test
> and check your patch as well.
>
> - If you really cannot find a typical false positive, maybe you can take
> the task from Ayush to fix checkpatch with git ranges?
>
Hi,
I will try to find and evaluate the possiblity of such a case, and report
my finding
as soon as I find something substantial.

I may also require some advice from you on the patch submission process.

Thanking you,
Dwaipayan

--000000000000964f5b05af363c62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><font color=3D"#741b47">&gt; You should also try t=
o find a case where <a href=3D"http://checkpatch.pl">checkpatch.pl</a> can =
be improved:<br>&gt;<br>&gt; - It is best if you look at the <a href=3D"htt=
p://checkpatch.pl">checkpatch.pl</a> error/warning reports and<br>&gt; chec=
k if you can find a class of typical false positives in the reported<br>&gt=
; data. Then, think about how to make the pattern in checkpatch and propose=
<br>&gt; a patch to <a href=3D"http://checkpatch.pl">checkpatch.pl</a> on t=
his mailing list; with the evaluation data<br>&gt; backing that your patch =
really improves the situation. We will then test<br>&gt; and check your pat=
ch as well.<br>&gt;<br>&gt; - If you really cannot find a typical false pos=
itive, maybe you can take<br>&gt; the task from Ayush to fix checkpatch wit=
h git ranges?<br>&gt;<br></font>Hi,<div><div>I will try to find and evaluat=
e the possiblity of such a case, and report my finding=C2=A0</div><div>as s=
oon as I find something substantial.</div><div><br></div><div>I may also re=
quire some advice from you on the patch submission process.</div><div><br><=
/div><div>Thanking you,</div><div>Dwaipayan</div></div></div>

--000000000000964f5b05af363c62--

--===============7246813903157015882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7246813903157015882==--
