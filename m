Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CA8C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 21:49:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F051A223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 21:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oty/pSz1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F051A223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 55FF42E49E;
	Wed, 21 Oct 2020 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgWUhCceqwAo; Wed, 21 Oct 2020 21:49:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B3FB2ED95;
	Wed, 21 Oct 2020 16:50:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9758DC0052;
	Wed, 21 Oct 2020 16:50:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98734C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8448D2E857
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yltipurGPYja
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:50:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A44131EB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 06:12:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x7so1561752wrl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 23:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7o03cvUMnbLUS7sOdeAFZNRpue4+l4tI5nZ/OpbOx3Q=;
 b=oty/pSz1Ar7k3xpm9xiFyHKAl6E8fx6PFjoxosmY7MpyDgVWQHHayVQlrf5A1Da6SD
 imrxLoIKv1WBFAVJhcqYGaAyaCfKY+VP7v331Anu47uTuOgYcIzDcHWYP3BdmLBpE7t0
 mxebCkDEEZQ0qVZ4c7NvKaDHDAz2Hvq/XVrsIV8EN3MSrgvsB00rUDzEfMJ1CGtJu13H
 UQyyxjOmgsROOzMf/2jqESJkc9k9Bz+ydgu1fqAD4c0ucm1Wd94cH2GL23X0eAqthGND
 Q3N+uHhcqvuQJQ1OKxqwVyDF1DO45K6n6FLeS5KhsN9+9EoQKjxN+15rDRHatbzJBGLh
 pjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7o03cvUMnbLUS7sOdeAFZNRpue4+l4tI5nZ/OpbOx3Q=;
 b=foJuISzrY7czcIGjgJO0cC72H4paEE+qD2sPRvVechn2y4msCqTjrEH1YFZfR4R6VE
 S6Im6ebNX0JyeJiW12+35mVso9oasmzxIOUDOMkNNtnoDCBtv9ukk61ApdtLFT6uRw+G
 qyfQqcOtixL71/XT9CIm3snFh1tTZSMAcwhuto4rR+3Ej9Ew19I2hJmfAlFiebXp7JjP
 VWzIkyoAZyg3B3yYv0ALaEvAr0thA4hm3fvifRLnWN1GJLpTPOK8v8x+wbAXjuWrJyaC
 SzFWBFVPYsVcg5oiRnlkkfy0XQEQ43h4FpY8uxpmLL0G9a6yyo+onCpH7dzOzyRpUXCv
 8VPw==
X-Gm-Message-State: AOAM533Gnc9H+PlaUnj3jK3uMuj8+NY5/Bz+S9vmRgpIWMQO5xsy0YQ6
 QZjfZ/I1SKRXKh2Pr5m4HT8=
X-Google-Smtp-Source: ABdhPJzjqKWEePbhsiXgsDOQANVMA9tqlguF3ugrSM00noMwGzpEf+F8dqozBiQ1ehmJcOwmg/PXKQ==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr2494157wrm.305.1603260751589; 
 Tue, 20 Oct 2020 23:12:31 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:96c:5366:5c94:6f3])
 by smtp.gmail.com with ESMTPSA id f137sm1579472wmf.10.2020.10.20.23.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 23:12:30 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 08:12:29 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
Message-ID: <alpine.DEB.2.21.2010210801120.8328@felia>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

> On 21/10/20 10:30 am, Aditya Srivastava wrote:
> > Presence of hexadecimal address or symbol results in false warning
> > message by checkpatch.pl.
> > 
> > For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> > memory leak in mptcp_subflow_create_socket()") results in warning:
> > 
> > WARNING:REPEATED_WORD: Possible repeated word: 'ff'
> >     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> > 
> > Here, it reports 'ff' to be repeated, but it is infact part of some

Aditya:

s/infact/in fact/

> > address or code, where it has to be repeated. Thus the warning seems
> > unnecessary in this case.
> >

"unnecessary in this case" is a bit weak.
You can say it stronger:

In this case, the intent of the warning to find stylistic issues in commit 
messages is not met and the warning is just completely wrong in this case.

> > To avoid all such reports, add an additional regex check for a repeating
> > pattern of 4 or more 2-lettered words separated by space in a line.
> > 
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 9b9ffd876e8a..181c95691715 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3052,7 +3052,9 @@ sub process {
> >  
> >  # check for repeated words separated by a single space
> >  		if ($rawline =~ /^\+/ || $in_commit_log) {
> > -			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> > +			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> > +			while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
> > +				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> >  
> >  				my $first = $1;
> >  				my $second = $2;
> > 
> 
> 
> Report of the impact of patch/changes(taken over v5.6..v5.8):
> 
> List of errors and warnings after applying the patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/summary.txt
> 
> Change in errors and warnings compared to previous patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt
> 
> Impact/Conclusion:
> It can be seen that a large amount of warning messages under
> REPEATED_WORD were because of such hex occurrences.
> The changes made reduces the warning count of REPEATED_WORD by more
> than 60%, ie. from 2797 to 1015 (over v5.6..v5.8)
>

Aditya, so can you share a quick export of all the warnings that were 
dropped?
Just to check that all of them are hex stuff and we did not silence 
another class of valid REPEATED_WORD warnings?

Dwaipayan, can you review this patch and comment if you would have 
implemented that the same way or if you see other options that you have 
considered during your review?

Aditya, once you address my stylistic comments on the commit message and 
once you got feedback from Dwaipayan, you can send the patch to the 
checkpatch maintainers and lkml and please CC me, Dwaipayan and the 
linux-kernel-mentees list.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
