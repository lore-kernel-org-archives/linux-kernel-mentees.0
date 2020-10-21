Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFE2C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:19:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E005C2242E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGeX+pqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E005C2242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 402B485F4D;
	Wed, 21 Oct 2020 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF1AbJvX7mB9; Wed, 21 Oct 2020 18:19:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B185585E43;
	Wed, 21 Oct 2020 18:19:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94F41C08A1;
	Wed, 21 Oct 2020 18:19:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF06C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1DD822E245
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ah-AJB6FhV6b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:19:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id D6B402EBC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:58:48 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id z5so3072344ejw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UQ8bCBf0ltlhf6dByWrCvWOYu3N5vvpeUu/Bw80tY6c=;
 b=BGeX+pqJqPuqZF7OmUfx6UHjr3n5yz3XSEf1M9VCsZ1pl9uYcerVYDRurUgoiNJulI
 4Iksp2IBvfKkO/YhO/e0DhuGCZRdpS19w+Z778LiKC7h9MTwODa5yoOM1ImsBWPFJ7tq
 d9LQ1keXzUloQmSDDmJ4uAicdCdnoyXhoGzp147S/alkjhC3erE09kuC9hb77d8jqvjl
 Ll9HAQ1qjItqckcWy1ZxkfPugrPeQQ67NvHXnIImeFsX3DBsqzsNkeeujOo3bpnd9LFX
 qzM9Ry0i8KddURRoB7V1vC57MiPxWFcIxJKdjDjrHfh+92n+TbZvvaxkNMjOxiScTJa6
 Junw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UQ8bCBf0ltlhf6dByWrCvWOYu3N5vvpeUu/Bw80tY6c=;
 b=lPUCngVFR76x+FyYv3pn0px7yxTFULdxYTMYXoi8bjEdo1T+vosPOhSszeRrcYnzeL
 8EgEApvGuwI2TCjS+p0yVi1ocqBuyCcB6SgF/jAcJNm0oya6pX+hLGMoSWGCKcKdLM3w
 iZHTjuO7yBwl3kvA9QrRRqlOYywPgtmVzcwnO2iD/xTWAolaREllSgK40GNvjTsn+V8X
 4l0ouwrGa4cz8orTmsorp6qp2lUHL+fUa9txUBAs+2PRq/xUXfv2Qt/mFm1Qy40oEK0D
 IiXNBpgko6i1DiEhRwvlY+PDKmRgM5N7bjq4N3P/9Kan1ElXgR6w7SjikMBXidBjJ7WB
 P49g==
X-Gm-Message-State: AOAM532aZolzyzXFjOUo09IzEVz8fVhMFlmlpR5iZSuwV1DExgnVeP5Q
 MeTANcr4uz38FLQzPOBu8ow=
X-Google-Smtp-Source: ABdhPJxYFmSxw+T+qWC20ZYvphM4d6FKOeBNg9ycUbJVj6NaKzej26IwCOFWb+44hr6qm2BGT11/oA==
X-Received: by 2002:a17:906:c094:: with SMTP id
 f20mr3493294ejz.550.1603285127246; 
 Wed, 21 Oct 2020 05:58:47 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:c428:3741:a9e9:6e3d])
 by smtp.gmail.com with ESMTPSA id j11sm2250881ejk.63.2020.10.21.05.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 05:58:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 14:58:41 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
Message-ID: <alpine.DEB.2.21.2010211426220.5382@felia>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
 <alpine.DEB.2.21.2010211049020.8328@felia>
 <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
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



On Wed, 21 Oct 2020, Aditya wrote:

> On 21/10/20 2:22 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Wed, 21 Oct 2020, Dwaipayan Ray wrote:
> > 
> >> Hey Aditya and Lukas,
> >>
> >>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>>>> index 9b9ffd876e8a..181c95691715 100755
> >>>>> --- a/scripts/checkpatch.pl
> >>>>> +++ b/scripts/checkpatch.pl
> >>>>> @@ -3052,7 +3052,9 @@ sub process {
> >>>>>
> >>>>>  # check for repeated words separated by a single space
> >>>>>             if ($rawline =~ /^\+/ || $in_commit_log) {
> >>>>> -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> >>>>> +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> >>>>> +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
> >>
> >> Pattern is probably wrong. It doesn't recognize word boundaries or
> >> tabs between words. Example of the first type:
> >>
> >> 000 00 ff ff ...
> >>
> > 
> > I am wondering if this pattern really appears.
> > 
> > Hex stuff is usually written two-letter and spaces.
> > 
> > Maybe it is best to limit it to 0-9a-f, though. I think there should not 
> > be matches with other letters than that.
> > 
> > Aditya, evaluations on those alternatives would help to make decisions.
> > 
> >> The regex matches "00 00 ff ff" ignoring the first 0.
> >>
> >> I think it could be perhaps better with something like:
> >>
> >>  # check for repeated words separated by a single space
> >> -               if ($rawline =~ /^\+/ || $in_commit_log) {
> >> +               if (($rawline =~ /^\+/ || $in_commit_log) &&
> >> +                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
> >>                         pos($rawline) = 1 if (!$in_commit_log);
> >>                         while ($rawline =~ /\b($word_pattern)
> >> (?=($word_pattern))/g) {
> >>
> >> Please test it though. I only ran it on a few patterns.
> >>
> >> Apart from it, this does fix the problem. But I am quite sceptical about
> >> matching 4 or more 2 lettered words in a row. There could be counter
> >> examples but I guess that is very rare. It's not very general, but for
> >> the moment it does the job.
> >>
> >> So I think it's probably good with some changes. Not sure what Joe
> >> would have in mind though.
> >>
> >> Lukas, I think with the changes in place, it is ready to go for discussion.
> >>
> > 
> > Dwaipayan, thanks for your review.
> > 
> > Lukas
> > 
> 
> Hi Sir
> I made these changes:
>  # check for repeated words separated by a single space
>  		if ($rawline =~ /^\+/ || $in_commit_log) {
> -			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> +			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +			while ($rawline !~ /(\b[0-9a-f]{2}( )+){4,}/ &&
> +				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> 
>  				my $first = $1;
>  				my $second = $2;
> 
> 
> 
> Reports:
> List of errors and warnings after applying the patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/summary.txt
> 
> Change in errors and warnings compared to previous patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt
> 
> Dropped warnings compared to previous patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/dropped_warnings/summary.txt
>

Looks good.

I suggest you quickly scan through the dropped warnings and confirm, so 
that you can add something like this to your commit message:

---
A quick evaluation on <git commit range, fill in here> showed that
this change reduces REPEATED_WORD warnings from xxx to yyy.

A quick manual check found all cases are related to hex output in commit 
messages.

---

Then send out the patch again here quickly and if we do not see big 
mistake, send it our to lkml and Joe Perches.

If you need any help, just let us know.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
