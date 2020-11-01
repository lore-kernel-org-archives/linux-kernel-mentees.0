Return-Path: <SRS0=yjWw=EH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E824BC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 18:41:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCF422253
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 18:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnSKQjJB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCF422253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B76AB8788D;
	Sun,  1 Nov 2020 18:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdIeSrsAt6Mr; Sun,  1 Nov 2020 18:41:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61E4687894;
	Sun,  1 Nov 2020 18:41:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DDCAC088B;
	Sun,  1 Nov 2020 18:41:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D38B6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C7D02033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDEJ8RiGgOIi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:41:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E6C620008
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:41:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u127so12430445oib.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4c01qTu7eKfC/iF/pts2olAGkQbDL56P0c5ulWky8zM=;
 b=jnSKQjJBSkeGhY2jSS+hGEra6m/c7z44/yYbld2QW8aA5zLEI8ABbzH8QCLZpuNE+M
 3vDJs39XhIGgvifxAL4XdCLiMLzQqqTQaoXFKS8/v1nvVwGwoZFKEUwcIsO9rZZOhWZC
 Eyp5LQU8zIis6vbDvnfQE0Y89dnArh/FIjg6AtpBGMi49d77Or4LeW+toTwqd90OAk7q
 83Nc31oqUECdcq7JenUSBPX35B41R7g7FT6p5LhlYjomFj7vy4GDtALjjt73LY1hv1u3
 Pr/EOM23rope66m4zTIVyEsqti0JHK4HVUvB/UwC/Yosd0bFysvalO51pbgjtAvrt1dE
 CXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4c01qTu7eKfC/iF/pts2olAGkQbDL56P0c5ulWky8zM=;
 b=SnocKm7d8FKHh3gbeR2fwaJGaJ4UXob2cFG5Wa7H9UZQ4I1wCg/OPTTH+IY1ndAydB
 DGSWs72dF04o7n704IxHgfnSZtiL6ad4QBjsD1aQeXakXZm4zh/NySD43nKhv4/quNqn
 DdYS61Jk0h545bKE9poSzkkvm6TKd6w1AKxmU7pOdx2Fx1K/tDd3YAqA+juMWxeIOeaW
 FD9EQwZKLnWjrMXVAqjRSxoGCaLpAaFOliz7ZsELQk3rNtt4FG39/+iX8kPx+YtTzHxf
 4vckto022pl82QLWNd/BRMD0Mi081L3F6+2Jj8R8b6epQcHWRTpJesmk62abnrXUchKF
 OIVw==
X-Gm-Message-State: AOAM532IKdtQDRwqvtLyKrfIhJ+8ZeP32da7D8nm4sBlF7w8YwpxvXy1
 avlgHouiwtauDLx/Dxhqwpm36rD6as+bgg==
X-Google-Smtp-Source: ABdhPJwJSxtRjz0O53LMJExGiyyh4omG3Kw/bv5mukwNhoWNnJjgDhfof66pDx5kKuoUZVLQvsHVuA==
X-Received: by 2002:a17:90a:4481:: with SMTP id
 t1mr13892290pjg.216.1604255627311; 
 Sun, 01 Nov 2020 10:33:47 -0800 (PST)
Received: from ?IPv6:2402:3a80:40c:3397:d01d:7878:b941:f1cf?
 ([2402:3a80:40c:3397:d01d:7878:b941:f1cf])
 by smtp.gmail.com with ESMTPSA id s23sm10255735pgl.47.2020.11.01.10.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 10:33:46 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201101182106.28568-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <dd8349f6-f847-103c-f393-eabc4cc0101e@gmail.com>
Date: Mon, 2 Nov 2020 00:03:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201101182106.28568-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	DEPRECATED_VARIABLE
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

On 1/11/20 11:51 pm, Aditya Srivastava wrote:
> The coding style of Makefile has been improved to use certain different
> variable names as compared to earlier.
> 
> E.g., variable name asflags-y should be used instead of EXTRA_AFLAGS, etc
> 
> Currently checkpatch.pl warns the user to change variable name with
> its corresponding upgrade, but does not have a fix option
> 
> Provide simple fix by substituting the variable name with its
> corresponding upgrade.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index a0107ed257d1..5fd34a862522 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3266,8 +3266,13 @@ sub process {
>  				'EXTRA_LDFLAGS' =>  'ldflags-y',
>  			};
>  
> -			WARN("DEPRECATED_VARIABLE",
> -			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
> +			if($replacement->{$flag}) {
> +				if (WARN("DEPRECATED_VARIABLE",
> +					 "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) &&
> +				    $fix) {
> +					$fixed[$fixlinenr] =~ s/$flag/$replacement->{$flag}/;
> +				}
> +			}
>  		}
>  
>  # check for DT compatible documentation
> 

For this warning, I couldn't find any warning in the past. So, I
generated a patch for myself, for testing:

From 1bab609eae606a0b89aa6c752d07b0e64488a6e2 Mon Sep 17 00:00:00 2001
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Sun, 1 Nov 2020 20:12:44 +0530
Subject: [PATCH] makefile: testing

random description, random content

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/Makefile.lib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 94133708889d..c9f50e2d9901 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,6 +4,7 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
+EXTRA_LDFLAGS  = ldflags-y
 ifneq ($(always),)
 $(warning 'always' is deprecated. Please use 'always-y' instead)
 always-y   += $(always)
-- 
2.17.1

Running checkpatch.pl on it gives the warning:

WARNING: Use of EXTRA_LDFLAGS is deprecated, please use `ldflags-y
instead.
#21: FILE: scripts/Makefile.lib:7:
+EXTRA_LDFLAGS  = cppflags-y

On executing it with --fix produces this result:

From 1bab609eae606a0b89aa6c752d07b0e64488a6e2 Mon Sep 17 00:00:00 2001
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Sun, 1 Nov 2020 20:12:44 +0530
Subject: [PATCH] makefile: testing

random description, random content

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/Makefile.lib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 94133708889d..c9f50e2d9901 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,6 +4,7 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
+ldflags-y  = cppflags-y
 ifneq ($(always),)
 $(warning 'always' is deprecated. Please use 'always-y' instead)
 always-y   += $(always)
-- 
2.17.1


Here, the variable 'EXTRA_LDFLAGS' gets replaced with 'ldflags-y', as
was suggested in the message.


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
