Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270C9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:36:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7082083B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:36:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuFkgXn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7082083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5992887297;
	Sun, 11 Oct 2020 17:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiXOTqANp1ps; Sun, 11 Oct 2020 17:36:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C26E6871C3;
	Sun, 11 Oct 2020 17:36:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD6CCC07FF;
	Sun, 11 Oct 2020 17:36:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 730DCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5C6368728E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XzRSAi5riNw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E41F871C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:36:51 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t20so8231234edr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=AiRDUoz4keQvyXu0H1nM4Mc+ZEXea4sNI2mCrDKfebY=;
 b=PuFkgXn37YFGmzB+ASgxaBvK1HLalbjVFZziod9CePsMWNhnPf8Wbnb9KrothwOE/e
 QKrKxJnrVl8bESbwMSIYl3EnSFnQQ2XvhloQBnwbQTWNbXxQYklj+trOLS2TjPsNeLXV
 LX/WT0luatkI/53Z46Q/df1KcTlwSWXxJKYeKxQbvX5J5FrfaQA0/Mn3oWmMYpvf6rly
 uggxvhldkrDn8Zr3Uil4G3u6mlo9uLz+AfvpLX57NP1NSvwqoZ4P0jC8R+5iC5YcGHKZ
 FBuQY/N+9gei4lq0kgCfJpkmftds2SAzfUg4e6Ij7gbSZT9cW+oCo9jB4fRbh8T+QmMe
 3BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=AiRDUoz4keQvyXu0H1nM4Mc+ZEXea4sNI2mCrDKfebY=;
 b=LOCKcDpym36gyQavyaIkzQLcpy9TqufZvA2Vmx5l+h8BZbYdTy7nqOPIQe6xXCimwF
 f4hayHn8i/ua5F0W1NQvf7jeYwztMh4JblmsDbLsPQTCErcRzOVMaOch6XsGIv7PfMI7
 EYOnZ8yYum89/vOi+VrMLmhxbmi4qF1MPU1WOYT6nPel52rIzXxFFOXp4pAyWvil4XQu
 6XfsXRGmTE0A21shu3u9tMFXf/5APt19AOipKJj22jB295dhRdQxiMT8GbprvXBy1qm/
 qo+NeXDRlLK5JUg1vmNn5PJNM4DIkG94ghd9sVXE898ej+kvq3jNRBB9oOu9Ma+Y3sUP
 JKgg==
X-Gm-Message-State: AOAM533Z/8LG3gS/3TyRbpT0QWZPVfghkWzdBbL3s6zZAWQBMNm3d0Me
 EU0AolV1pH6jTvFdnJ+U7s8=
X-Google-Smtp-Source: ABdhPJwHIc2ota9tCJmqSVnWJLrt3Li1RU6Kx7rOOy3N0Vl9R+/tKZ3Gm7lmcKiUB8YNOWFzC+IlCw==
X-Received: by 2002:aa7:d1d5:: with SMTP id g21mr10333075edp.348.1602437809618; 
 Sun, 11 Oct 2020 10:36:49 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:2e00:8422:c9cb:c3f7:9b2b])
 by smtp.gmail.com with ESMTPSA id ok21sm3068207ejb.96.2020.10.11.10.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 10:36:48 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 11 Oct 2020 19:36:42 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20201011064348.14015-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010111932510.5535@felia>
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
 exceptions to repeated word check
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



On Sun, 11 Oct 2020, Dwaipayan Ray wrote:

> The repeated word check generated false positives for
> the following pattern:
> 
> "git git://..."
> 
> This resulted in lots of warnings in the MAINTAINERS file
> which shouldn't have been generated.
> 
> Fixed this issue by adding "git" to the exception list
> for repeated word check.
> 
> In addition, modified $word_pattern to capture words which
> may contain a single letter like "a".
> This ensures that repeated word warning in cases like
> "This is a a repetition" are also generated.
> 
> Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

I do not have any explicit comments.

Just two comments:

1. A patch should do/change ONE thing.

You are changing two here; just split the patch in two changes; the kernel 
community can handle many many patches.

2. For the reducing it to single-letter repetitions, I suggest to do a 
proper evaluation first. I can imagine that there are many more false 
positives than true positives in that case. Please evaluate.


Lukas

> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 124ff9432b51..0ef75d2fb5cf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
>  	["__ATTR", 2],
>  );
>  
> -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
>  
>  #Create a search pattern for all these functions to speed up a loop below
>  our $mode_perms_search = "";
> @@ -3364,7 +3364,7 @@ sub process {
>  				}
>  
>  				next if ($first ne $second);
> -				next if ($first eq 'long');
> +				next if ($first =~ /(?:long|git)$/);
>  
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
