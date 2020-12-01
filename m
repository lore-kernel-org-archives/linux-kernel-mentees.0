Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD63C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:49:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5016A2168B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHfJWg5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5016A2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B46F587471;
	Tue,  1 Dec 2020 17:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bI2B8hACkSC7; Tue,  1 Dec 2020 17:49:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3625087463;
	Tue,  1 Dec 2020 17:49:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19E86C0859;
	Tue,  1 Dec 2020 17:49:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF679C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B658E87471
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6tHeMX-Ih8i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:49:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CC62A87463
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:49:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s21so1572106pfu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RCwhJv12sSFD3ZvxDi2mfLOPAnMLWririJDzCUcdDJE=;
 b=EHfJWg5L5uvTsQA4eNHAPYDwutyJH9Z1smwUW7YsVThrnr7IzYKKI884ZmWGhm7HL2
 wBP8WtIrMu4id0V6sgl9ZPeS3klpfXm9KopWyj8xTMHUFoXXl5K450XY6VmmUovfNfLn
 SEjI/E7ZkBcnc48LF5SvtCWG+OHWMq2U4s6rx9ABnn9dASVc9iDwps+dWjAaR/JHaf6R
 83D0dgdT43oWPn1vQG34ljjnuccVfMfzBn8xeu7FoickZtyoxY7yzKUY+iUa7mwWUV6f
 ivHyDV6z+Ke+uCeq/jETdNZROZH01igtwZtaPQy6KVGqAD22oQlIJ//aA+Jg7jfJV2hA
 k3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RCwhJv12sSFD3ZvxDi2mfLOPAnMLWririJDzCUcdDJE=;
 b=WHDAM8JoMDl1NwFqW1w3HivPuA1VzPuDP+H4w5heWr4otBlwTOk6oId61z7RoCDVrj
 nbiDMX+KHXqHN+7NiHm8lOpPiCAWlYc8JCNz0WdB6mk8NBXTitNPVl9kgHlgaNna9Lhk
 wZC7wKbDRpfios0iHl+dhlVjE+H/9snIWRAM8R1kfUevAfEYLF0potDNTQZpp0b9hM+c
 1Za1YDlRiwlMm1FCfzjE0DY9rnnOiJ7/PnRjNcfBW28VsmxiA89HvHL0s9+7CqUlGHQv
 y2B1n6LJG3+cDca4pCrhSDppGCpIFX7oTHq+sJ+udEMWqGwXjEDaNEwtmyF8zaj3obfl
 7h7g==
X-Gm-Message-State: AOAM530qIve06/0qLgPU9e7u2dHnIcVa2GdVUy0bYAxWCm1JE71XRJSD
 F7NaTegcFKtZj9qfW3oF5A==
X-Google-Smtp-Source: ABdhPJxey+uCYZzx+5Dh3NFQejrcYRyWON6ndAQpXgEXiBTulPcGPR0+hnCUI821WxVcJEJqdi7iZw==
X-Received: by 2002:a63:455e:: with SMTP id u30mr3234933pgk.113.1606844993438; 
 Tue, 01 Dec 2020 09:49:53 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id e3sm419772pfe.154.2020.12.01.09.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 09:49:52 -0800 (PST)
Date: Tue, 1 Dec 2020 12:49:43 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20201201174943.GA32955@PWN>
References: <20201201155212.132233-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201155212.132233-1-dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Tue, Dec 01, 2020 at 09:22:12PM +0530, Dwaipayan Ray wrote:
> Commit log lines starting with a '#' can be ignored by git if the
> corresponding commit message is reworded by a maintainer using
> git commit --ammend. This minute error can be easily avoided if

s/minute/minor/

> checkpatch warns for the same.
> 
> Add a new check which emits a warning on finding lines starting with
> a '#'. Also add a quick fix by adding a tab infront of such lines.

s/infront/in front/

> Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index dabe39ca819e..10665b9a3d77 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2966,6 +2966,15 @@ sub process {
>  			$commit_log_possible_stack_dump = 0;
>  		}
>  
> +# Check for lines starting with an #
> +		if ($in_commit_log && $line =~ /^#/) {
> +			if (WARN("POSSIBLE_IGNORED_LINE",
> +				 "Commit log lines starting with a '#' might be ignored if the commit message is reworded using git commit --ammend.\n" . $herecurr)

Also a nitpick, `commit --amend` isn't the only way to reword it, I did
it using `rebase -i`.

I think something like "Commit log lines starting with a '#' might be
dropped by git.\n" is sufficient, without being overspecific?

Otherwise,

Tested-by: Peilin Ye <yepeilin.cs@gmail.com>

Thank you,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
