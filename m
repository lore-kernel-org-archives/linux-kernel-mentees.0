Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D356CC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:36:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3866F2076D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxKySbZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3866F2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BD9286796;
	Fri, 30 Oct 2020 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeMSZJHrTVfu; Fri, 30 Oct 2020 11:36:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECC8586840;
	Fri, 30 Oct 2020 11:36:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA8B4C0859;
	Fri, 30 Oct 2020 11:36:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA6D1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 97FFB228AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7Zi+0xKsxZ8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 6B61420C92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:36:43 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id s15so8103866ejf.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1Jxz10XsBHrnbz1HWj8txTMJ6oDjEDloc9V4yMy3aEA=;
 b=LxKySbZp72/ALZ6loIY0w78XjwBcf8F0aQrdcm2WIkokoeVbeX6/1Ulm0Kb7b+uTTN
 GoB3baUZwLn1+JzkAVnSeLEb6ZOlW8dpbFB1MVzxf9TwWoqlbM9yHt3hE680lrP68uew
 AE2dq4xXk+Xnd/MNY6Jl8fj/1wcDjpMiet+/GuL/7FgIcMtGBbcM5NFzq3yqGZ3zBZkl
 VsBDoF10nmb11/TZ0CsMlwky8q7QEo6EMz0tGo1VYvBC7FwxgbI2A2muW9UIuIF8cKQW
 Z2m3ErYYzqIzrYDwZCLugQedeXCWl64VMZ9kDg8zvyUUUQ46khc7sm7s8TCk6x+U7NuF
 2cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1Jxz10XsBHrnbz1HWj8txTMJ6oDjEDloc9V4yMy3aEA=;
 b=aqOJhpI0odTvMaSgvg6ehO/8J9PGK14GfgndCjFGa0BfgjPevZuMlSsb6b4SYVFhWK
 wAQCr4c/q3mFeKA31OEH+JvA5e/NXUVGrLP49k68R3R9JnAVrJ8SP1m9jTbsqWs/5GyR
 /2i+6srptFMmJ2d+rSgpI3BgOBVlRRLfmqFra4rYSS06fLCmRRigO+ZnttkW30HRGcPj
 rfO8UVhjlZWo50H9t9yMw2MsrgRgn8pgNLEwUKb2colOQ9PUTolYzonLl7FuTS4zbYfY
 xpbdmsLgu8m8deYanS5jW9UVRHa7BcrxWc+Vc7y0GJMdEo4e5UQRtI/z3OqVKVvamTNX
 fR+Q==
X-Gm-Message-State: AOAM530Im4Snr9hXowxbQoNo96B4+9Fwxj+UbSerhCJqNdMoyO15C+yp
 xBCjl1Y+Efv1alRYT4eZsps=
X-Google-Smtp-Source: ABdhPJyv2c9lUeFKIQPESvDc5NOkRAxZKwY0BDMLrmpNBsfby555ckvpU5GKo1+uJGFC0PhaiCL/Ng==
X-Received: by 2002:a17:906:7210:: with SMTP id
 m16mr2088257ejk.490.1604057801773; 
 Fri, 30 Oct 2020 04:36:41 -0700 (PDT)
Received: from felia ([2001:16b8:2d02:400:25af:1ff4:dc3:177c])
 by smtp.gmail.com with ESMTPSA id oz18sm2868506ejb.55.2020.10.30.04.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:36:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 30 Oct 2020 12:36:40 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201030113012.23160-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2010301235280.16621@felia>
References: <20201030113012.23160-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	GERRIT_CHANGE_ID
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



On Fri, 30 Oct 2020, Aditya Srivastava wrote:

> Currently, whenever a Gerrit Change-Id is present in a commit,
> checkpatch.pl warns to remove the Change-Id before submitting the patch.
> 
> E.g., running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
> API to 53 for 22000 series"), reports this error:
>
you can drop the "," before reports here.

Otherwise looks good, do that minor fix and send it out to lkml.
 
> ERROR: Remove Gerrit Change-Id's before submitting upstream
> Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d
> 
> Provide a simple fix option by simply deleting the indicated line.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7800a090e8fe..5329927fc1c1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2852,8 +2852,11 @@ sub process {
>  
>  # Check for Gerrit Change-Ids not in any patch context
>  		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
> -			ERROR("GERRIT_CHANGE_ID",
> -			      "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr);
> +			if (ERROR("GERRIT_CHANGE_ID",
> +			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
> +			    $fix) {
> +                                fix_delete_line($fixlinenr, $rawline);
> +                        }
>  		}
>  
>  # Check if the commit log is in a possible stack dump
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
