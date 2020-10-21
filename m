Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F4EC5DF9D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:12:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB5F224180
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjfd8Y1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB5F224180
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24AAA872FA;
	Wed, 21 Oct 2020 20:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmXNAZBje2+L; Wed, 21 Oct 2020 20:12:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD2AA872E1;
	Wed, 21 Oct 2020 20:12:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97A0BC08A1;
	Wed, 21 Oct 2020 20:12:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC20C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 790612E96B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hmS-kfwhEVf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:11:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id C7CD8338B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:53:03 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id dt13so2003914ejb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=I6raUile7RJBtlWNhzu79CPj7w8WcEhXtNSwqgTvjNs=;
 b=Gjfd8Y1DHvfV8FPP9rJBIu56dTHy95X6z6KVCDB/Ow3lSIsvSkPsjvHgSDlhueX5vy
 EqanWLO/qHByZmZDNDVHSXFT3gXgOOVGaqxO0Ps2B/4RQFy+sOhL1f1Iz7nUB8tlGrEi
 MKIYkXmJPI9Ii6VUQIW8MuGVYb8untyNjGNssqGFRUCeDbnavCAeJQ5xakg2iUms1NqM
 ACyPsjqiN1sRksMY8SoubfR8OhR4P6O2dzESvdPABvQfWbv/UEM5+GENMqyXSJSOD5va
 hRqnjlO+QtcxFNRXN/7+1r5O9HrwQlhDxE28HvpHnmUEWmFOFOVRq8aDbphq9sR3I8Z9
 YZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=I6raUile7RJBtlWNhzu79CPj7w8WcEhXtNSwqgTvjNs=;
 b=dWcRl/caO9h8yTmSnXToPq08fQ6Tm38HL10LtspV+e6rCQk3iz6twPNafbUnA3KpHS
 g3rrYvWd7OmAQtf06Tfk9nZE47e6IfbxcYjul0cDgqziiyPS7lkeHiT8UkzV20NkLNR0
 C1gjaT1IoMNEIbc/M2qyyj1Wr1iW1gCwOFAZliiw9qMRbaK4NJH0GYXuC2jmL+yaIhV/
 JR0sXc/ey0g52Xb8gegA3MtVKdLVm466IQv7aePyViXIjhvZcJVLrnbkFYdF+iHF5neb
 4hKYg4Diu6DJnQ269LLIT0Zn0JvkRjTQ4RVRBeO7kJC6oJKvumfvo1puIKqtJFO2a4CB
 wJTQ==
X-Gm-Message-State: AOAM532FGJSUM40+8rz1y6AuE9Tkk5WH+VWFNlOqXvmeG2gtt2MWyugE
 wqYQsXBAn8JyrrKY65x4e6M=
X-Google-Smtp-Source: ABdhPJyIIRQa5SxmnQoHtfmDeNEsKBkv8/9fD5lzevY7XZ227M95aoHefwD3n9gUIGha6k9n5tnzWw==
X-Received: by 2002:a17:906:39ce:: with SMTP id
 i14mr2508513eje.170.1603270382073; 
 Wed, 21 Oct 2020 01:53:02 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:96c:5366:5c94:6f3])
 by smtp.gmail.com with ESMTPSA id a12sm1661984edy.87.2020.10.21.01.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:53:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 10:52:59 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010211049020.8328@felia>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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



On Wed, 21 Oct 2020, Dwaipayan Ray wrote:

> Hey Aditya and Lukas,
> 
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > index 9b9ffd876e8a..181c95691715 100755
> > > > --- a/scripts/checkpatch.pl
> > > > +++ b/scripts/checkpatch.pl
> > > > @@ -3052,7 +3052,9 @@ sub process {
> > > >
> > > >  # check for repeated words separated by a single space
> > > >             if ($rawline =~ /^\+/ || $in_commit_log) {
> > > > -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> > > > +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> > > > +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
> 
> Pattern is probably wrong. It doesn't recognize word boundaries or
> tabs between words. Example of the first type:
> 
> 000 00 ff ff ...
>

I am wondering if this pattern really appears.

Hex stuff is usually written two-letter and spaces.

Maybe it is best to limit it to 0-9a-f, though. I think there should not 
be matches with other letters than that.

Aditya, evaluations on those alternatives would help to make decisions.

> The regex matches "00 00 ff ff" ignoring the first 0.
>
> I think it could be perhaps better with something like:
> 
>  # check for repeated words separated by a single space
> -               if ($rawline =~ /^\+/ || $in_commit_log) {
> +               if (($rawline =~ /^\+/ || $in_commit_log) &&
> +                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
>                         pos($rawline) = 1 if (!$in_commit_log);
>                         while ($rawline =~ /\b($word_pattern)
> (?=($word_pattern))/g) {
> 
> Please test it though. I only ran it on a few patterns.
> 
> Apart from it, this does fix the problem. But I am quite sceptical about
> matching 4 or more 2 lettered words in a row. There could be counter
> examples but I guess that is very rare. It's not very general, but for
> the moment it does the job.
> 
> So I think it's probably good with some changes. Not sure what Joe
> would have in mind though.
> 
> Lukas, I think with the changes in place, it is ready to go for discussion.
>

Dwaipayan, thanks for your review.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
