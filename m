Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581B8C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:01:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF25B2076D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVi5G2gK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF25B2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7870887D4C;
	Sat, 17 Oct 2020 16:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAEINNKAjFbF; Sat, 17 Oct 2020 16:01:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D70BA87D4B;
	Sat, 17 Oct 2020 16:01:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2461C07FF;
	Sat, 17 Oct 2020 16:01:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4352C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B139D20378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4p0lBP70sdCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:01:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 67B932014B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:01:47 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id n3so1698519oie.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R8NJjCBei+UeB+MzclJEuZNeo91P2U/6rtV8C+ufyxg=;
 b=NVi5G2gKtCf6TCnZ/ONOCXsNWjiFdBP0ydbzYseoJ3VLIQH13OBdVGeWKcFFsWWtld
 w525JKCWohJY7QI6fuRIOWWCPrGXQFXoUGx7AkvQvBY3czBqXZKj8ThL8UdWUHGys7iq
 leQWHq1y1ZrcQMFkYH8r7LauNMDE7lqvjALSYf0PTqoXYDMAjSTyXD3JIbbmNx/FM0mp
 GbmxrjUq7W9Y2K4ENpaqGdHBEKT0bKx09lCg6vu4cK15X2iz8qXIFNQy9MOH0jwMVmTY
 /jbUSa5nSg7nSSk+JDzjozosufT0KtlGDBCl6nXuwUVQIUY1zFygAFWtWNwIUjxEj04l
 sTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R8NJjCBei+UeB+MzclJEuZNeo91P2U/6rtV8C+ufyxg=;
 b=kFwNMt7HqPj1eKEYoswu1O74e4Xgoh6Ix53Fb+f6bXDBXKzdUMZIkzPSrUZq25pQlp
 RuHIDxoXMf6YKmwUSPot87Ujn16S/t6MqABiqef5TApXhCtczA2SaMde4U7y0OAfPGQt
 2isgdfTluRu8V081qAOVX9EkVIZCUAnz1vCmyTOCjlc00vOY9vOQwIVXuvON01HHS7Kl
 6v1OPMOGGLdFLsXic4c9fIKMy8gRcer7a1wk7QKHtzXtTSBUHpzMu98Yt9EYj1MeLbHi
 JyxnTGbtcldtI5ZqWl6dPbd1fBF8MQjRnhbJhR6HyX49m9MWCzdndPBMclQiPTYVAWH8
 m51g==
X-Gm-Message-State: AOAM530hx7nCKo8TZu5/7rvHRNRS+GVj9sD963qW7kfJ3cN+y4dLvp++
 kFBt2aE8IpxQnkmkbFGf9YkZY7tkbxo55c6NP4A=
X-Google-Smtp-Source: ABdhPJzTQqZq9xS5kTWm5FNhbsDhaK+z8sbQx7cgtbVS/GqXobJFxXC0QmXtkopAadkJ5xtfbWehRsZeyCX4e7l2tbY=
X-Received: by 2002:aca:420a:: with SMTP id p10mr5785693oia.117.1602950506500; 
 Sat, 17 Oct 2020 09:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201017075131.47566-1-dwaipayanray1@gmail.com>
 <d2254db39f798b408bdd16237c86dea1617bcfac.camel@perches.com>
In-Reply-To: <d2254db39f798b408bdd16237c86dea1617bcfac.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 21:31:20 +0530
Message-ID: <CABJPP5DkJbPZCkXdOewFjvZhS5gYmEfjSK8m3ZpZsR7sAvQ+8A@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add new exception
	to repeated word check
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

On Sat, Oct 17, 2020 at 9:24 PM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-10-17 at 13:21 +0530, Dwaipayan Ray wrote:
> > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > moved the repeated word test to check for more file types. But after
> > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > new warnings of the type:
> >
> > WARNING: Possible repeated word: 'git'
> >
> > For example:
> > WARNING: Possible repeated word: 'git'
> > +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git
> >
> > So, the pattern "git git://..." is a false positive in this case.
> >
> > There are several other combinations which may produce a wrong
> > warning message, such as "@size size", ":Begin begin", etc.
> >
> > Extend repeated word check to compare the characters before and
> > after the word matches. If the preceding or succeeding character
> > belongs to the exception list, the warning is avoided.
>
> Not true.
>
> This excludes any non-space character before the first word
> and excludes space or punctuation after the second word.
>
> This also adds case insensitive word matching.
>

Right, I didn't change the commit message. I will update it
properly.

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3052,19 +3052,30 @@ sub process {
> >
> >  # check for repeated words separated by a single space
> >               if ($rawline =~ /^\+/ || $in_commit_log) {
> > +                     pos($rawline) = 1 if (!$in_commit_log);
> >                       while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> >
> >                               my $first = $1;
> >                               my $second = $2;
> > -
> > +                             my $start_pos = $-[1];
> > +                             my $end_pos = $+[2];
> >                               if ($first =~ /(?:struct|union|enum)/) {
> >                                       pos($rawline) += length($first) + length($second) + 1;
> >                                       next;
> >                               }
> >
> > -                             next if ($first ne $second);
> > +                             next if (lc($first) ne lc($second));
>
> case-insensitive matching
>
> >                               next if ($first eq 'long');
> >
> > +                             # check for character before and after the word matches
> > +                             my $start_char = '';
> > +                             my $end_char = '';
> > +                             $start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > ($in_commit_log? 0 : 1));
> > +                             $end_char = substr($rawline, $end_pos, 1) if ($end_pos < length($rawline));
> > +
> > +                             next if ($start_char =~ /^\S$/);
>
> non-space
>
> > +                             next if ($end_char !~ /^[\.\,\;\?\!\s]?$/);
>
> space or punctuation.
>
> trivia:
>
> I believe using index would be ~50% faster than !~ here
> Perhaps more readable too.
>
>                                 next if (index(" \t.,;?!", $end_char) >= 0);
>
Yes, it looks better. Thanks for the suggestion.

I will send in a new iteration after all of this is incorporated.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
