Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72DAC43464
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:58:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EEF207D3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4T8rF5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EEF207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EE11D2E1F8;
	Fri, 18 Sep 2020 12:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6YVoJWrNt4p; Fri, 18 Sep 2020 12:58:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 143142E1F0;
	Fri, 18 Sep 2020 12:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF8BC0888;
	Fri, 18 Sep 2020 12:58:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2473AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1D9938692B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yb2O3pTAmKgL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B6C0B863DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:58:43 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id i26so7925528ejb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=l2vJl61AXqW0UWBnxFj3DvGEPoZaQlHt7EAdg/iDU2Q=;
 b=g4T8rF5FlFJ3OWOHaPZAanSmO8yhPWZT50iBdrZ0q5THO6VmhBvCfTKyQTEiBxncW3
 jVkB4+Nz6CLGYVcG5qJCu9xwH6yvwozIwdlj9T4BwuC+k/212bOLGVMG+jG4vyH8aqPx
 V0cBh34sa3zU5eGF89plekqxme0caSjjS78BjCb1QoXXNHMt24Ngwzn7hC4m2s3C+zie
 B+XlSzZ8oKil5u5lQ8XiqRZijDtSQSfetF8po3dJE1x6j0utGP7p9BKvi7kCHq0t+ioW
 g7qB5CdpmPvuObyDM203NSR0zNgHodfnrIoT7Lpf5LXQrAGwsGjRXHOHWMzmnd15Qo70
 yhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=l2vJl61AXqW0UWBnxFj3DvGEPoZaQlHt7EAdg/iDU2Q=;
 b=dRw0xnQnRrsY7EQQzSEVjx/ZKtGDpeUIZhQh8RDqJeXWeT2M0XWn0X5uJKcBvxtAfi
 HSTTL9eEpZp9dyVI5VmmbHup+KrIj14elasFTkF7VKsOdymRbvcO5bS+N/8SLLwTDHd3
 RWM+jA6yx/NZ3MHh6ATqBH+mPVaG1JwXUzN6wN4MwZslGpIW7P8J5fK/Ef8xG5XiHUW3
 cCrfsy7gJDhJMbCitt9CENQ771LSVlPlvMZktrHUs3+6VvPcuL7X6R9U6gGPCwJVTrS0
 QaV3wDk2eT+N5m8158lObgJajp8T1eGe73KiJYSaxLzW/GbbS0EaBwXez2vmF/VesQRJ
 nPNA==
X-Gm-Message-State: AOAM531q3XpqUmFk3MArbxIC+emwtyDPciMCIHFQTp6nsU9wS3je5Yb0
 nPmRdfIq1AwpwXBEHNcQ/6A=
X-Google-Smtp-Source: ABdhPJxEj0yTUuhzWP0JB2y1DPX5yUI5lKOhXsnGVIXaudBmkkoWId+9e+THtOD7WE47oyIMb5vxGA==
X-Received: by 2002:a17:906:2c04:: with SMTP id
 e4mr35171200ejh.147.1600433922117; 
 Fri, 18 Sep 2020 05:58:42 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:a500:ec98:e0c0:d9aa:534d])
 by smtp.gmail.com with ESMTPSA id w1sm2134247eds.18.2020.09.18.05.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:58:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 18 Sep 2020 14:58:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20200918122950.94098-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2009181439160.14717@felia>
References: <20200918122950.94098-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix author
 Signed-off-by warning for split From: header
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


For the patch subject line, I actually think this patch is a new feature 
or extension, not a fix. It was not broken, just not supported before.

So maybe: extend author Signed-off-by check for split From: header


On Fri, 18 Sep 2020, Dwaipayan Ray wrote:

> Checkpatch did not handle cases where the author From: header was
> split into two lines. In those cases the author string went empty,
> and checkpatch generated a false missing author signed-off-by
> warning.
> 
> This patch adds support for split From: headers and resolves those
> false warnings.
>

You can drop 'This patch adds'. We see it is a patch, and we see that it 
adds something. Just use imperative tense:

Support split From: headers in AUTHOR_SIGN_OFF check.

(That is a good commit message header as well.)

Can you provide some statistics on number of warnings before and after
and maybe even in more detail, how many of the warnings disappeared with:

  Missing Signed-off-by: line by nominal patch author ''

Probably even new warnings appeared?

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..8c4119ca7d17 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2347,6 +2347,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $prevheader = 0;
>  	my $is_patch = 0;
>  	my $is_binding_patch = -1;
>  	my $in_header_lines = $file ? 0 : 1;
> @@ -2658,12 +2659,22 @@ sub process {
>  			}
>  		}
>  
> +# Check the patch for a split From:
> +		if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {

How about extending to check if $prevheader is not 0?

> +			$author = $1.$line;
> +			$author = encode("utf8", $author) if ($prevheader =~ /=\?utf-8\?/i);
> +			$author =~ s/"//g;
> +			$author = reformat_email($author);
> +			$prevheader = '';
> +		}
> +
>  # Check the patch for a From:
>  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>  			$author = $1;
>  			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>  			$author =~ s/"//g;
>  			$author = reformat_email($author);
> +			$prevheader = $line;
>  		}
>

So here we see two almost identical parts of code now, right?

Either use a small function or restructure the code such that the 
differences are in two branches and the common code is part of one common 
control flow. You are a good programmer, you can figure this out.

Generally looks good. Let us know once you think it is ready to be tested :)

We got some checkpatch.pl evaluation experts here and I am sure they are 
all happy to test your change and see the evaluation get better.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
