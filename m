Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C51C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:23:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6562224E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYalr9hI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6562224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D93087229;
	Wed, 21 Oct 2020 17:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViZeio2pNrba; Wed, 21 Oct 2020 17:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 338EC87224;
	Wed, 21 Oct 2020 17:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22C3EC088B;
	Wed, 21 Oct 2020 17:23:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AA81C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6499E2E53A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94xu74tGEfVQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:23:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 79FF52E71B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:21:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f10so1109074otb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zpIXbMG9wJXeoQckP1yaOiaoddyqmHkDlA58h9FVYg=;
 b=iYalr9hIlFy1taH6qrWzoxsn8IqAGJyBnK5CyrJnvy3SWRZPu++DjfCM/wzpBoyjWp
 V/t0LwOWjDNN8d1EZfXlJoEZFfNohfxaCW9oBAMV67HcxDyWH6PiLE6tZvSEixkzHjWe
 FTmo2uvhWModmTvg7IwOA0PC8Fw1n87RGQ5VAW9c9xxhf6xLxfT5CvKhDDFvMYSzkY04
 e8ybQaIEqUoRokLu2NJE1ZnM+BfWnKLYey7q6R3+5v3SB2nPU92dU/CpQlNXo8fdQS3I
 JoazHTkvrqP2YsNpCAwWL5zGTL3KWmo9Y4/BYfURALxODI6UWZElM/4gspa1H3nBp/6Z
 uYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zpIXbMG9wJXeoQckP1yaOiaoddyqmHkDlA58h9FVYg=;
 b=E9e+PztJhP07jHD3sAybok4jiJMqFSKfCKvwyhJucyqplVmSziUAYvyX3TKOb0d/YS
 vMmTTA4JNbRcAKAr+PYPPsUefnpxy0pYsx1CcGxrtrShDnKCnC3g2BtODTgIHc8PT5dK
 pydxeX5/F5GOJYfgXjDE0a7vBdS6/cj5Kf2n7DCxtCyqWXC84M6pLMhfrMV1vkV7whZ5
 jcNtZn7InQXd7aQH46UaeKIJ48rswOG8Hc34UeObuSvc0rGYaI2wM33/H6VokYfLXnaP
 iltsy4CMRvp2S3kknISZoCvMqQ7R9cjylU+/f0NO09kTRiLGf2rNaq5vAhlhPqDTHsNk
 Zrcg==
X-Gm-Message-State: AOAM530snQ4Mnmaio4b5pXnuZLee2qo/r2W7JM/7sojNu6o7QkbItsAq
 vltK/kBEECnH3vLwlVNM+zD63Km57lhmh9caYPE=
X-Google-Smtp-Source: ABdhPJyPgcqA3oDf1i8hKov/zjnJoy4cci6VVGKYx8Qrwynd78NLPIEj4KGW/KNy9CUwQLddu6xgZVb8FMt5AiwZOMc=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr1699534otq.265.1603268474479; 
 Wed, 21 Oct 2020 01:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
In-Reply-To: <alpine.DEB.2.21.2010210801120.8328@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 21 Oct 2020 13:50:46 +0530
Message-ID: <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

Hey Aditya and Lukas,

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 9b9ffd876e8a..181c95691715 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -3052,7 +3052,9 @@ sub process {
> > >
> > >  # check for repeated words separated by a single space
> > >             if ($rawline =~ /^\+/ || $in_commit_log) {
> > > -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> > > +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> > > +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&

Pattern is probably wrong. It doesn't recognize word boundaries or
tabs between words. Example of the first type:

000 00 ff ff ...

The regex matches "00 00 ff ff" ignoring the first 0.

I think it could be perhaps better with something like:

 # check for repeated words separated by a single space
-               if ($rawline =~ /^\+/ || $in_commit_log) {
+               if (($rawline =~ /^\+/ || $in_commit_log) &&
+                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
                        pos($rawline) = 1 if (!$in_commit_log);
                        while ($rawline =~ /\b($word_pattern)
(?=($word_pattern))/g) {

Please test it though. I only ran it on a few patterns.

Apart from it, this does fix the problem. But I am quite sceptical about
matching 4 or more 2 lettered words in a row. There could be counter
examples but I guess that is very rare. It's not very general, but for
the moment it does the job.

So I think it's probably good with some changes. Not sure what Joe
would have in mind though.

Lukas, I think with the changes in place, it is ready to go for discussion.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
