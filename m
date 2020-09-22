Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47AFC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 19:09:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6F42311C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 19:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIXEkmTA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6F42311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B75D4862F4;
	Tue, 22 Sep 2020 19:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWJuWqh4bR78; Tue, 22 Sep 2020 19:09:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3439185465;
	Tue, 22 Sep 2020 19:09:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ED0BC0889;
	Tue, 22 Sep 2020 19:09:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEB55C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 19:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 902A220033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 19:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31-bUXvSY9eb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 19:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 761E220018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 19:08:59 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id z1so4437302ooj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ms63c/A7biR1+ZQmshGpp+XIVczahkg2IGunnCTKhZI=;
 b=tIXEkmTAzCU1UZSSXjFu4t6VuzRpTEi+zzSOQ29tEkL+yDlaUUSUme/YOjTBnykWDq
 0Q0eNkDNNlCydcREL91x22yN5S4RhIAE/CWX+048RTQBt70ndqNcW7zgx7TNCg0YSvMP
 N5gHUXz9cuSk3sG5sfXg+nWrque2J6AvQUIjsh8gDSpK7k52gR/RYAeqUMzrFPcXwZUU
 cgcRoK1OsOpSTNA79DorIPGRavGlU81deJJQXpQgd/DFBDajXjxByiRN1tHxPOQOeATQ
 fKB6mvOVTYOnW7ZY9P4Y3ERmZmQJuZnOPhZeVK4EbQv3kOMTZGmw00/w+Z39EvmvbHLC
 ABdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ms63c/A7biR1+ZQmshGpp+XIVczahkg2IGunnCTKhZI=;
 b=WiDtRp5vJPdjjLFwedXz2AvEQWikI9HYYnke4szI8qEc70hJLEJPEcb+PpdFUVDIrR
 jwLQ4JOQcGZVtZT4linvrpqxRVCAlceXqJkdNL41uiuoxuzfj1Ekavw0ODqJQKMeCTPn
 Jnk52Ro+weAtuC0i5ODP1TCPamJYyTGl0c0o5qin/CeZaDhCeXe93uS4Qw5zObfrEhLm
 1UMrLvn7E8lhmDXCXyMzYkfkH17tbICjs4nZIxx5p3bY6zwQFtvCseBjkF2zaKGxqPsQ
 k7X+jWGjOgjLaWx3yXk2NrUaMGTBvCRRgAJG2Ffb+5aOwfMcRBa4w2SPmaWPLBi6Viit
 pzOg==
X-Gm-Message-State: AOAM532k4P+1g5n9Ure9a/qr8l4uLAPaiOKOytS5oeHBR+515MGvE5mO
 GwvXUns6XR4SJkYeZ7cOPE8ClXB1/Wp5S4ZFKEU=
X-Google-Smtp-Source: ABdhPJxef399ZkDFLq91oiuGji91pBQwbuTBQNFfW/r366e5HoHICrsb8Z9gSf7olmkfEoVuQqIJ3WplAco27Tq+jDE=
X-Received: by 2002:a4a:a385:: with SMTP id s5mr4062457ool.8.1600801738448;
 Tue, 22 Sep 2020 12:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
In-Reply-To: <alpine.DEB.2.21.2009222028250.20644@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 23 Sep 2020 00:38:38 +0530
Message-ID: <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
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
> Generally, I think it is a good first proof of concept.
> I believe you that functionality 'basically' works; again, we might
> already want to run a full-scale evaluation on that. Just to see
> if there are some impacts we might not be aware of yet.
>
> As you already wrote, we, Joe, you and me, need to figure out
> now all the further details:
>
> - how can we avoid the duplicate code in checkpatch.pl and
> get_maintainers.pl?
>
> - what is performance impact, especially as AUTHOR_SIGN_OFF check is not
> triggered often, and there are many other rules in checkpatch.pl?
>
> - further details, such as why do we need the lk_path is the first place?
> and many more questions of that kind.
>
> Feel free to sketch a first commit message and create a PATCH RFC for the
> discussion with Joe.
>
>
> Lukas
>

Hi,
As for the lk_path, it can be removed easily. To me too, it didn't make much
sense since it was just a duplicate, as $root should contain the same.

But again due to some reason,
$root in checkpatch had the value ".",
while $lk_path in get_maintainer had the value "./"

I have no idea yet if this was a design decision or just different handling.

So, I can change the part where I referenced the mailmap file by adding
a trailing / with $root rather than $lk_path. That should do it.

And for the duplicate code part, Joe did mention that either I could copy
or place the read_mailmap code in a separate file and reference both
checkpatch and get_maintainers from there.

To me, copying seems much feasible because the referenced part of the
mailmap handling code here is very small as there are some minor
changes.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
