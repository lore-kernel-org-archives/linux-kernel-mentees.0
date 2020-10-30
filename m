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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53701C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:45:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4AA20720
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmYHjJew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4AA20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B352D2050D;
	Fri, 30 Oct 2020 10:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9QdV+A0-Kig; Fri, 30 Oct 2020 10:45:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B06372047B;
	Fri, 30 Oct 2020 10:45:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92884C088B;
	Fri, 30 Oct 2020 10:45:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2107EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0831C8621D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Yox7PS9Wm89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:45:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B5BA8612E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:45:18 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id t25so7872934ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=t8aoSy0yuPyZvbmZesfhRLIy8e0pwuQhCSkQT/L6qTs=;
 b=UmYHjJew2m0mpSsNWNHLbacWU1vsEWVus8iBs3lWX5YoPwpa48DAoS0Q1SvUnKLrMt
 2adXY7JWwXLbMVWRc1MaIST+OB1qMTOD+yljJTk6E93yJwtOrh6aIkaWTe4qth6robAo
 XgFJgl28cnRGxfFXXjd81izPEV28hRFMnF2VyP2Z4crJn9lOqdZDtNiBqih/apYvB2jE
 TPTfZ0pn97vjMIXqz14rrHGpJmUOPINNEx6bzUeKtm4Jks5pphrgnzQYsPIevBjau7Yf
 CYMg7qEe+PZ+Fs2azrrWZDQ/PyntETkwkAQSnv1yjVWACxlgrDPHZyOJBY+WoTQbjBuf
 nN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=t8aoSy0yuPyZvbmZesfhRLIy8e0pwuQhCSkQT/L6qTs=;
 b=JA3GRPttac2a9HFggG82owF55dEnCGcIdlIsADvDCTpbtoXX35PdLORl9dX4jVTXQf
 o22gdYuZcttP3kL0KyBOQDV4g4V2BwVy/8eiXzSp39uQPv6xE3Seb+U9/FK9+eFX8XsP
 J6TsEBc5o/LoYgp16B0KoMpxHFfFfp1q6uHFRMa8X6VDiHwijbPhYHW2KFrJgp1HH/9f
 rc6T+kAAG0IpurVk4RghaJo0TB7SIV0wKllnySfEW0bd/rzb5hSqM61XT+3Kr5E8Y9xi
 hRoV9AYz2O3B/75akcfnbphsCU+mRiXQhjR4dZwQzwjM9AkXVe1HTIaS27dsUSECyH5j
 JJLA==
X-Gm-Message-State: AOAM532It3A8yeg2RZzgemua2j63vf4vVLPI8+4oM7bDvEPLKfX7hvwX
 vFVXaOfy8LFnsD2pgYFVTxg=
X-Google-Smtp-Source: ABdhPJyg/J5UdfRGAXjUQS8tjaNsS6uK7NkuUdkhPQLY6d3uq8t692ZREYlfDKCxoz11Exzyhw+IyQ==
X-Received: by 2002:a17:906:3294:: with SMTP id
 20mr1739744ejw.322.1604054716691; 
 Fri, 30 Oct 2020 03:45:16 -0700 (PDT)
Received: from felia ([2001:16b8:2d02:400:25af:1ff4:dc3:177c])
 by smtp.gmail.com with ESMTPSA id by8sm2259742edb.49.2020.10.30.03.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:45:15 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 30 Oct 2020 11:45:14 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201030082335.14256-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2010301134390.16621@felia>
References: <20201030082335.14256-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ERROR:GERRIT_CHANGE_ID
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


I would drop the ERROR:, just say: add fix option for GERRIT_CHANGE_ID

On Fri, 30 Oct 2020, Aditya Srivastava wrote:

> Currently, whenever gerrit change id is present in commit, checkpatch.pl
...whenever a Gerrir Change-Id is present in a commit,

> gives an error to remove the change id before submitting the patch.
>
s/gives an error/warns/
s/change id/Change-Id/
 
> For eg, running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW

Just: "E.g.," not "For eg"
 
> API to 53 for 22000 series"), causes error:

s/causes error/reports this error/

> 
> ERROR:GERRIT_CHANGE_ID: Remove Gerrit Change-Id's before submitting
> upstream
> Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d
>

The default setup does not show the type name, I would suggest to just 
show the default output from checkpatch.pl.
 
> But there is no --fix option present for this error message, in case
> user wants to fix it immediately.
> 
> To fix this error, delete the corresponding line from the patchfile when
> checkpatch.pl is executed with --fix
> 

Provide a simple fix option by simply deleting the indicated line.

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

The change itself looks good to me.

Rework the commit message, send it out again here for a second check and 
if it is fine then you can submit it to Joe and lkml.
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
