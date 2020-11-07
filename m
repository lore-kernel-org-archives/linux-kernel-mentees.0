Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7225C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 14:49:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B6A20702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 14:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tC4U5VLQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B6A20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 10FB88539F;
	Sat,  7 Nov 2020 14:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXiAiPwfJjhV; Sat,  7 Nov 2020 14:49:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 73680868EA;
	Sat,  7 Nov 2020 14:49:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ABADC088B;
	Sat,  7 Nov 2020 14:49:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3AF3C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 14:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A750D20452
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 14:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4n-GP6CxtdHb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 14:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D44BA20020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 14:49:31 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 10so4275403pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 06:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e+YwN3qanMjSAlRV/NRae0FGRJLQE/0F6ShH4SidaSg=;
 b=tC4U5VLQ1FrFCLNJRfOzouiHt3kUbRPKdroqHDEoK6r1RmV3MyF5M7si5/PYLr1Q6n
 2MLsqyWr32S4JF3/NAYrFfZnMFoqvyzyuIZdJPjOgp09x/s9U4b+GCsHHNUjBhNOwE3I
 WSKOvJq9PGS/trX1elsLbzwQpcaTK3uCAgRAmL5aCNo/4gJuCOiAhJ/LD/KL3xJc4KQR
 9zx+x/O6av1lS04JhrfiW+VNkWeS5YE+OQpSBMR5bIcd45rWjG6XVJ70lUYXqYzkaMpq
 +2c4UChBtgUAP8j9Rht/ygssY2uX8t4wLoKBj274iz9E/PpxAm+zV0gbhRFdLKS9K8Yj
 MPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+YwN3qanMjSAlRV/NRae0FGRJLQE/0F6ShH4SidaSg=;
 b=D/dSIhK/dLHV9lt1069bELlWY6EB5IZIcf/bzlgnzGBZzmdSIdm90LD405VD7OL1Ou
 iIx9dOLdj9u76Kn1GwKaH1ru+uoFQ9dhOe1m4UvkW2UPeiZUxgZhDG4xIoqCHiZUR2wP
 MqTKxJuyB79zFiTAWiX63RVrtO1269dOPxZqih/VtcHtggWTvfAqaI+cWHWlxEkSKjz0
 v7yR+YDw+UmEN2Wbd15EldYTIYPqH933JKstQG/lYCzSC8HDVbb/8epg2uBYT0VsReX3
 BR1iBQrpYD/TuKT694iAlrQCWtTzitItXo1FkJXupCKuTr18v8zSX402k5g5Otf/Qrvf
 shQw==
X-Gm-Message-State: AOAM531tVo39F7xRD13bzvv3m1/FjDy8xcXpYmvb35sRt9WrAVtO48cW
 +uYtHjGKcmKpD+v356zSctD26jboMMO1Bw==
X-Google-Smtp-Source: ABdhPJzrKJagrfFMgrMuXHv8bQTp6I8LvZ/gbwL4e0KrP/vkuSCWlI6/7buhA9R6kmWJpHTeA0pctw==
X-Received: by 2002:a62:5293:0:b029:18b:5c86:7ad0 with SMTP id
 g141-20020a6252930000b029018b5c867ad0mr6539824pfb.51.1604760571139; 
 Sat, 07 Nov 2020 06:49:31 -0800 (PST)
Received: from ?IPv6:2402:3a80:42d:7bb5:3470:9721:ad9d:115e?
 ([2402:3a80:42d:7bb5:3470:9721:ad9d:115e])
 by smtp.gmail.com with ESMTPSA id k21sm2330337pfu.7.2020.11.07.06.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:49:30 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201107121742.27144-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
Date: Sat, 7 Nov 2020 20:19:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201107121742.27144-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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

On 7/11/20 5:47 pm, Aditya Srivastava wrote:
> Currently, when a line exceeds 75 characters in a commit message,
> checkpatch.pl gives a warning corresponding to the same.
> 
> E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
> for some cards having 0 maximum voltage") we get this warning:
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> 
> Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.
> 
> Provide a fix by consuming first 70 chars of the corresponding line,
> then stop at the next whitespace, and substitute it with the consumed
> chars and a newline char.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 5a1096a4e220..ee665208ef02 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2881,8 +2881,11 @@ sub process {
>  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
>  					# A Fixes: or Link: line
>  		      $commit_log_possible_stack_dump)) {
> -			WARN("COMMIT_LOG_LONG_LINE",
> -			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> +			if (WARN("COMMIT_LOG_LONG_LINE",
> +				 "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr) &&
> +			    $fix) {
> +				$fixed[$fixlinenr] =~ s/(.{70}[^\s]*)\s+/$1\n/g;
> +			}
>  			$commit_log_long_line = 1;
>  		}
>  
> 

Changes made in v2:
- Changing newline at whitespace instead of abrupt termination
- The special line cases such as 'Link', 'Fixes' or code addition
lines, etc. seem to be already excluded from this warning in the
if-block statements above the warning statement.


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
