Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A885C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:39:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCB020714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 05:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Mier9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDCB020714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8C7B62036D;
	Mon, 27 Jul 2020 05:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zo3x8CEzVFDm; Mon, 27 Jul 2020 05:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F7D02014B;
	Mon, 27 Jul 2020 05:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40C86C004F;
	Mon, 27 Jul 2020 05:39:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7611CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9BA7B87D46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbVXv5G-3fx1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D42A287917
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 05:39:20 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id g7so7476251ejw.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xDb5PXYN3n5lE8LEb3nwIfYHVxoGLm9+nYjZ3geynTo=;
 b=S/Mier9l3wsLLkKjMvHFaOV0/UZ05ASBnjUHEoYZf7M8aRpdkzu6HWth2bO7YlS7In
 HjUC1LC1j3BURn91WptQcisWctYv5qL5JYIM8seXoIBcP0g/tM69XudGfc4lzikLsWah
 rZ+i+nSbImT4YoiU6o/ZszrEW88eDuDuHrEMKAGADtQ62JB1F6sxaQuJajh1ioJN0zai
 +LiL16i2RvV6zVjsFjcOHvnu3xzVFgqfzore10nBOYItFlkvnLMpMMWNNtI52qK9lt8+
 NalzXaWIMo8BDLxmoTm0FuM9lQ1ZQ9XYAnnCkPQD+VLrqrd7ijNY7e8x/jYcMeakfBKQ
 pybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xDb5PXYN3n5lE8LEb3nwIfYHVxoGLm9+nYjZ3geynTo=;
 b=Zr0fED44Agqj8+jpQTT4fU9IfTPrpGMWpHv7DrLRTtQ/VxqfmbC3miLJgkGHi3kBeF
 ZsY+YBS1tVF+bUoHWxpEbnodeEk+cM8fOLguNI+IVSr+OtC6SYp7FeEsvRYxJVZLwU4i
 Wv8X9lwwGynYnaHE8B1KuVD4AaQlUpZ7D3AdMB60JcCVChESJ1bHsVGiSiM3x9Ol6vC0
 LsqNXWElkDmAps9+CYeeni4iZ5HWVhZZIlfS9ofx04x4DzRUlcSeJ03Uj3jf+Qeyw/9L
 BSY1EpJ0PtOtorn8/ezdlfMqAFxZI7dCTUu/wdqrJqedqhP4RX9APRs2bmSQNeMVxQBQ
 7R/A==
X-Gm-Message-State: AOAM530yu+b84CzuXsyxqgkyudlblK9YNwRXKNhCs2ZQa0t9yq8t5rEq
 JrHGroGdjEabymYLKFsF8x4=
X-Google-Smtp-Source: ABdhPJzD4XUSY8pQwQmW7ObwvOh9xsn4Z65KYZU7eTJ54sWm/qxRThcVjCxSw6Y3xSfDGVRS5n42VA==
X-Received: by 2002:a17:906:558b:: with SMTP id
 y11mr13319987ejp.378.1595828359053; 
 Sun, 26 Jul 2020 22:39:19 -0700 (PDT)
Received: from felia ([2001:16b8:2daf:f700:8400:4421:567:c257])
 by smtp.gmail.com with ESMTPSA id dj22sm6647158edb.54.2020.07.26.22.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 22:39:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 27 Jul 2020 07:39:08 +0200 (CEST)
X-X-Sender: lukas@felia
To: Nachiket Naganure <nachiketun8@gmail.com>
In-Reply-To: <20200727050724.554063-1-nachiketun8@gmail.com>
Message-ID: <alpine.DEB.2.21.2007270735130.19509@felia>
References: <20200727050724.554063-1-nachiketun8@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Checkpatch: Disable commit
 log length check warning for signature tag
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



On Mon, 27 Jul 2020, Nachiket Naganure wrote:

> Disable commit log length check in case of signature tag. If the commit
> log line has valid signature tags such as "Reported-and-tested-by" with
> more than 75 characters, suppress the long length warning.
> 
> For instance in commit ac854131d984 ("USB: core: Fix misleading driver bug
> report"), the corresponding patch contains a "Reported by" tag line which
> exceeds 75 chars. And there is no valid way to shorten the length.
> 
> Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>

It looks more sound now. It applies cleanly on next-20200724, and it 
addresses the false positive in the mentioned commit.

The commit message header is still wrong.

If you run

  git log --oneline ./scripts/checkpatch.pl

you will see that all commits start with lower-case "checkpatch:" and very 
often, it continues with lower-case after the colon.

Fix that and send it out to intended recipients using get_maintainers.pl, 
also CC the kernel-mentees list, Shuah and me.

Lukas

> ---
>  scripts/checkpatch.pl | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 197436b20288..46237e9e0550 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2806,6 +2806,8 @@ sub process {
>  					# filename then :
>  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
>  					# A Fixes: or Link: line
> +		      $line =~ /$signature_tags/ ||
> +					# Check for signature_tags
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
