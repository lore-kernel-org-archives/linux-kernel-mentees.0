Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6B3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325502068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDkJTNFB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325502068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04CE78933D;
	Mon, 13 Jul 2020 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPtEHfzqaNbH; Mon, 13 Jul 2020 19:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19A2A892AF;
	Mon, 13 Jul 2020 19:32:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9A4AC0888;
	Mon, 13 Jul 2020 19:32:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A3A9C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CD18F23730
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRdKBfZzLSeH
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 38C8B2014A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:32:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f7so18002093wrw.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9fJr/1cec8FKyUaFttMTbozwrrZF55RXbttTD7EpCRQ=;
 b=kDkJTNFBxC4a2FNUKP03AQhCY12UZJlGgVcyDgDvLPw8KZPiPnlAfWN7XnW+evqBXI
 0jiSnbQtqjhMY4zVLFafqqDI4t6p1szHPYxk3IA1QUnDwLvaHcuHIJypWiGJzUUVbYRy
 B7LTETsj8s8AESW3B999pXCd8ht7B/8CNzaGu6nNyC2BfMbgAiZ67xeZLKggxdQtyfkO
 YAWMRgpob37apwUNAHDyZqLsTnpAstOLYn4aWMZK/QGZgrK4EwBQPXlyDfbs+sHRnnwc
 t0i/XX4X2UO0Su/WXPkyqr+YL7pCQJf8g1ma/do2TPmD6BNT0BODB8iq8M023UYC4z6g
 sITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9fJr/1cec8FKyUaFttMTbozwrrZF55RXbttTD7EpCRQ=;
 b=B9Rp13iJsqcRovGwmd/37xrmy2DL62Im9rr4gp+UvoYHT9GItHNT3eznQpweU9jXKK
 bSyQrZnH24ZLZd1xo/m5a70UuzimYVNQXeE0gxeYOSCvEywJ5VUfOT7BtzXjoX5qPTZK
 qLMEPeyJq/WG68delFHioEDB7MPXLytKbRnTnu2tM3g2IiZTNdzotuZ0Fj07wyoYGrFy
 0C2vAh4Q1i4W3k3LMtjfe/Rpes9g7jz/DIwW53xaTxR+LH35sBZYhTb5a/UmU4Aayvdz
 mo5rJ7+mtcc8qufR1TyocBUZwaOp9QUKhW/q98KXGN8QlpcmByMfL+IHaKFe17anbYYJ
 QnZw==
X-Gm-Message-State: AOAM531qf6pb3uSLrHqKJk5RT3OvLdWlbTw8j/JK1hCvL++Z0/IV86XF
 rrqQI4m2CCDYjAPC1mAeY2k=
X-Google-Smtp-Source: ABdhPJwYk6eRXZfmTcXvLwYULHiYq9q8wsOF8XnoAel9o+0AD+tYwJG7c097M+EIqfcOdAwgE3+rqg==
X-Received: by 2002:a5d:6b08:: with SMTP id v8mr1118798wrw.2.1594668730392;
 Mon, 13 Jul 2020 12:32:10 -0700 (PDT)
Received: from felia ([2001:16b8:2dae:2400:a50d:fbbf:27a0:1459])
 by smtp.gmail.com with ESMTPSA id t4sm836736wmf.4.2020.07.13.12.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:32:09 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 13 Jul 2020 21:31:58 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200713043230.d7rhv6znvswt2h4u@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007132130360.11844@felia>
References: <20200713043230.d7rhv6znvswt2h4u@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, joe@perches.com, apw@canonical.com,
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of
	capture group ( ... )
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



On Mon, 13 Jul 2020, Mrinal Pandey wrote:

> The usage of "capture group (...)" in the immediate condition after `&&`
> results in `$1` being uninitialized. This issues a warning "Use of
> uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
> line 2638".
> 
> I noticed this bug while running checkpatch on the set of commits from
> v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in
> their commit message.
> 
> This bug was introduced in the script by commit e518e9a59ec3
> ("checkpatch: emit an error when there's a diff in a changelog"). It has
> been in the script since then.
> 
> The author intended to store the match made by capture group in variable
> `$1`. This should have contained the name of the file as `[\w/]+` matched.
> However, this couldn't be accomplished due to usage of capture group and
> `$1` in the same regular expression.
> 
> Fix this by placing the capture group in the condition before `&&`.
> Thus, `$1` can be initialized to the text that capture group matches
> thereby setting it to the desired and required value.
> 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---

I have discussed the change on the mentees list before. So:

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I ran ./scripts/checkpatch.pl on:

    commit 6b3e0e2e0461 ("perf tools: Support CAP_PERFMON capability")
    commit 19ce2321739d ("perf flamegraph: Use /bin/bash for report and record scripts")

before and after applying this patch.
On those two patches, checkpatch.pl emits the warning before,
and does not emit after this change. So:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Lukas

>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..e73e998d582a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2636,8 +2636,8 @@ sub process {
>  
>  # Check if the commit log has what seems like a diff which can confuse patch
>  		if ($in_commit_log && !$commit_log_has_diff &&
> -		    (($line =~ m@^\s+diff\b.*a/[\w/]+@ &&
> -		      $line =~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||
> +		    (($line =~ m@^\s+diff\b.*a/([\w/]+)@ &&
> +		      $line =~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||
>  		     $line =~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||
>  		     $line =~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {
>  			ERROR("DIFF_IN_COMMIT_MSG",
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
