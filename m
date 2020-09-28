Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B10C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 14:20:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87B02073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 14:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdVPRqz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87B02073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DC4884B1F;
	Mon, 28 Sep 2020 14:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0img5J4PqM-1; Mon, 28 Sep 2020 14:20:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 261D58111A;
	Mon, 28 Sep 2020 14:20:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08253C016F;
	Mon, 28 Sep 2020 14:20:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19D6CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 15D5C85701
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6el0DY3ZwiM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:20:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B6168111A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:20:29 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id x69so1469077oia.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7RT7EbWBeSSdbBqfslF8NFx08rf4RfZyTlwNE4aYUo=;
 b=XdVPRqz+FaBd6y77o95OfxyvPO3LGeHJRNZS3AoM4oRhaFgpfHLF0ASBefgHNSXBAT
 WBEOirrJfOHcgJHVuW3zfUwE1QQWIT3BkpUVoW/Pz3s0HxXg72c5I60g+GRuKx6ULm2U
 QunnDNMx7zq+E4/AFo0mS9s0Qt8fd3Wi4ia2+9dhI70A6DYhGI2QmgZtX1iqz6IiOvKP
 N9pyeAO64Jz8reEhvoKF1Mj+crNslRJCPOgSu7RUHgwbgH1UgQ40bDybf+8UDQBzFUm1
 FFEQwdZn0epxVzGbW7qZa4l8IU/f+nYb7HrXkq+0X7iMzbXADbtFLO8GJwJB34gkO1BF
 faWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7RT7EbWBeSSdbBqfslF8NFx08rf4RfZyTlwNE4aYUo=;
 b=S/4K88hb9SuK07LPTkgYKv4R1UmXqv+eMWsBiw+V2HUJ5D+3Uzr3avIV4OG5ga0yz1
 5ZwMfLP7YfFCHuPl5l+pq1NkKe+c6sVR5gkyWIKH14zT1a7GI3Fdj1QKrHDYBFSvMc30
 WIoOi8qtYtcgcCZgcFPWdnkIMwzoZ783LMCua8cw86OgrlMLUZ00tS9C98xEJwDmU2PB
 C5dccOFU62QuCLuYwBtW4A/fQg7pplhDUo+V7qE35FE72VoVJPJjeVSZMcg8nwRG8uIv
 1+7mon0VCM2GUkNErE8OeBkNMR5GFVoz7lYnzq/SW83bCsxrLAmr6ACTR/J6BrRePGoC
 RqkA==
X-Gm-Message-State: AOAM532bUpUaTXa/JJkhBA3+9WLokyLZJerIphJuFxMohwPQe1SIC78g
 CKkEqUpNe2HEDu0YV+mwFYiWr+QSvGkNzs/ujEs=
X-Google-Smtp-Source: ABdhPJx9CVoBbX8Kd0GQYK1SMVhtnsrZKO+NE3VYjy0xKrb69NVasZHNTiPUdFjg5mKotwHXURbrxsqhYgGLcPKK9R8=
X-Received: by 2002:a05:6808:6:: with SMTP id u6mr1036579oic.74.1601302828501; 
 Mon, 28 Sep 2020 07:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
 <alpine.DEB.2.21.2009250930570.5992@felia>
 <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
 <CABJPP5A46fh=Eth7RwXYHarcS11kyHMCUMrRfvvJ3_8oafAkJA@mail.gmail.com>
 <alpine.DEB.2.21.2009281608130.4154@felia>
In-Reply-To: <alpine.DEB.2.21.2009281608130.4154@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 28 Sep 2020 19:50:08 +0530
Message-ID: <CABJPP5Dws9Q_5A0LeSWSTb-dgSQiguU5rOF-cEvDTTrfonfmEQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

>
> How about just starting a new thread instead?
>
> I will answer on the new thread.
>
> Lukas
>

Sure, I will.

Also did my last mail go through to you?

Quoted:
> So I did run my script to evaluate the type of errors that were generated.
> My results are from commits between v5.7 and v5.8
>
> 1) Same address, different name
> There were 32 such instances. In general, there was no regularity in the
> specific error.
>
> There were some cases with letter case mismatch. Like there was one
> committer who used the names "Arend Van Spriel", and "Arend van Spriel".
> I believe this error should not be generated and matching be made case
> neutral.
>
> Apart from this, the rest of the cases in this category were some with missing
> first or last names, using names in other languages or having commas in
> one name, using initials etc. These should be warned about.
>
> 2) Same name, different address
> There were 204 such instances. Most of them were of the form in which they
> used a completely different email address.
>
> Only one case was found with an email extension.
> <hpeter@gmail.com>
> <hpeter+linux_kernel@gmail.com>
> in commit 423d9118c624
>
> So in general I think most email mismatches should be specified by a WARN
> and for email extension there should be a --strict CHECK.
> What do you think of this?
>
> Thanks,
> Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
