Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B65C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:32:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BA420731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ8UI7u4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97BA420731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D7E8320428;
	Mon, 16 Nov 2020 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uH0cQvYI1NWM; Mon, 16 Nov 2020 08:32:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA2032041F;
	Mon, 16 Nov 2020 08:32:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3B39C0800;
	Mon, 16 Nov 2020 08:32:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E69D4C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D48C585F41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12aKvU8RIC9b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:32:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 19D3F85F3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:32:00 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s24so16452324ioj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 00:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZRJfbZxg8y9JVADNjyn4G1saLtXPcgVvV9AoM2Pg0tM=;
 b=aQ8UI7u4IBKkwCQbJcUT6sJ5DFa2/XCm4gZ3wZPihxqxTxhStKrIxfxgJlYvqHaR4c
 bmBtK9EzfIpSbZeJleCzD/iRYLhlkFX9DVe/TmyIo6lxuvyhgKujQ0rheMrzTkqmswrm
 EBxr5EMLegt4EvYlCKEHlrQbRumuy5SNnteerUPKDbI4ElcN0yvbLUojec38fA7LgoPV
 Mc4u436ngiqZF9Iz710F+MkGUIlGI/3HtNQxwksyH2bRsltakUa3+6AUeQb0IeoAp23t
 r1q8EhK4icg3HrO7ejYxTFYDY1Wo6mNBMJ7Yw+cPrvq8fy+t7yWxPC4DRI5ajQpwyf70
 OGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRJfbZxg8y9JVADNjyn4G1saLtXPcgVvV9AoM2Pg0tM=;
 b=SPC7P3vE+nUDCvyDc2b7LvXpedchmU7zprrLTOG8+qNwHVWI+ieh/NXAINtx+HhZIw
 j4V3Gh+cMxDaykdg0fEOvlBLXsQGxNmbo8FBewkU/8EuG04PU4OIFUl+/nPwrtZ4ibIE
 5GKujUG6ZK/STCPma4QhIlXoZn/G/Uyi7zBNN2IlJDMPMDehCPFGDxDq+la1EwamQQnD
 q0+OhRysfQnkrwdf6hdQrJgRy9RC4dLhgT4Jjw00YRg8k7WvubNPW/ttPqv2P+Wvjblm
 F6QCtPU3tzJcxejIDgQ5TdBqmq0g0pKuVPIRO/Dz1gLxKGWP1O0w36GjGqHalmJPLifK
 wI2w==
X-Gm-Message-State: AOAM532IYmrsC3gJaXs3gLjWH7fpkoYAKnWklaWtaPqAN0GSBsELr+zh
 xthWN+V8p2dMsO5mhSYeH1m85BOZg86zOUtfUPo=
X-Google-Smtp-Source: ABdhPJwtemNgNidlwJlkv5UbrR8JvLUdcYrH/sAKo45oNFcuD1SiG22BvV+Jx4y7Z0HPM1NsdRnpQn8ZMh9RHDMZn+Q=
X-Received: by 2002:a05:6638:41a:: with SMTP id
 q26mr10182904jap.27.1605515519294; 
 Mon, 16 Nov 2020 00:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20201116073154.8211-1-yashsri421@gmail.com>
In-Reply-To: <20201116073154.8211-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 16 Nov 2020 09:31:48 +0100
Message-ID: <CAKXUXMz5D83PMZCxFWAd0EAL6p_T0rzXQP3fYubSrBgf3meGyw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On Mon, Nov 16, 2020 at 8:32 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns us for long lines in commits even for
> signature tag lines.
>
> Generally these lines exceed the 75-character limit because of:
> 1) long names and long email address
> 2) some comments on scoped review and acknowledgement, i.e., for a
> dedicated pointer on what was reported by the identity in 'Reported-by'
> 3) some additional comments on CC: stable@vger.org tags
>
> Exclude signature tag lines from this class of warning.
>
> There were 1896 COMMIT_LOG_LONG_LINE warnings in v5.6..v5.8 before this
> patch application and 1879 afterwards.
>
> A quick manual check found all the dropped warnings related to signature
> tags.
>

Looks good, I think you can send this to Joe and lkml now.


> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> modify commit message: remove specific commit example, add cause of the warning instead
>
> Changes in v3:
> modify commit message: minor english fix; remove difference count, add relative counts instead
>
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ac7e5ac80b58..f2369ac29d50 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2961,8 +2961,8 @@ sub process {
>                                         # file delta changes
>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>                                         # filename then :
> -                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> -                                       # A Fixes: or Link: line
> +                     $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> +                                       # A Fixes: or Link: line or signature tag line
>                       $commit_log_possible_stack_dump)) {
>                         WARN("COMMIT_LOG_LONG_LINE",
>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
