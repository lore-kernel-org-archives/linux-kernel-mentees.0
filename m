Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D4DC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 09:37:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282CB20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 09:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QB/44L2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282CB20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82030868A9;
	Fri, 30 Oct 2020 09:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzE7nC-dhvod; Fri, 30 Oct 2020 09:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FA8481F0F;
	Fri, 30 Oct 2020 09:37:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 020C2C0859;
	Fri, 30 Oct 2020 09:37:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 680B7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 57419868A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQHtZEXYj-XA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:37:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8989381F0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:37:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e15so4769567pfh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5aVXnX620grHDgSsQ5xTgyg3OeYAemzZeXx5RrAujg0=;
 b=QB/44L2yx2cu3WTFJBbU7Fm6OlAUnsVL8UcvlIt9YlaKzoOjO7dF82Tkp1gVrVOb4l
 MsoPHY9OymiWUTtRylCR1NqwsMP93/f+VnpY+zxZwvyA3+03Z7fycvoLy8joNkG4ayr7
 VIh20uMkiNNcdUlVV5OhjKgn7HZhX2tAgrRi11CQ67tNUr8+IoKFgNptfhwODOQIaWiI
 ke5UohQcvuSLYBDf33x2F5M8IR2TYNU9Z28Geie+9GuGon940kDWZq9LR4aujh2Z6DRT
 Ex9EB8rlJHSI9g8VfjSaHF3+M5Wx9xhtMkQ4To4KunqFArepR6jM552291kFXezBpeuo
 bLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5aVXnX620grHDgSsQ5xTgyg3OeYAemzZeXx5RrAujg0=;
 b=FH4Ouqb0OmF04p+xH/J1jW0v8aRXV0CCx3v+p7VxmALvk5lN+GHSk2AK8hXr7dOkbH
 yq4LmqwdIHLxSUrOTpIJDB6gwINYxkKKKW/WJel+eDFoLdNlOOdw2MqzvhWTHerGF5bz
 folfsHbf+6PpcDVfx2iXap1nDDdr7V35cDOaVTBHKT2eXuBJ4GFpZbcH2cvMMrNz/bKX
 uwFYqbyJRCLm9Xkl3J3N3+tQZbPiRka0+WLpSt2NeN18+Krg8S9xD94YveQgHOAdbrq6
 4FKugPRVGavA9XmOIjzTKs2LXQu4+QVnFunYfCqn5XOpkjVOcRnd+B7SzT1lXZ6qcUMV
 xOqA==
X-Gm-Message-State: AOAM532hcgHV0k407odEq+LaeHLUAEzug4xXetWkdLdEuMl2xaGhPitA
 MkYhSBkfJU+7xXe4OspsSYbPYpbZfPmTLw==
X-Google-Smtp-Source: ABdhPJyfhnPuEd0FqMjFJ5KvsCLutgYZCzLXKWv1OoLJsJwCM/oxD2ikDS/eJvn0FKOFAjfopdpJ8A==
X-Received: by 2002:a62:7695:0:b029:152:3ddd:24a3 with SMTP id
 r143-20020a6276950000b02901523ddd24a3mr8067786pfc.2.1604050659711; 
 Fri, 30 Oct 2020 02:37:39 -0700 (PDT)
Received: from ?IPv6:2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a?
 ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.gmail.com with ESMTPSA id s22sm5380093pfu.119.2020.10.30.02.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 02:37:39 -0700 (PDT)
To: lukas.bulwahn@gmail.com
References: <20201030082335.14256-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <a3c50073-4af5-9f58-bdb1-831c6e900b57@gmail.com>
Date: Fri, 30 Oct 2020 15:07:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030082335.14256-1-yashsri421@gmail.com>
Content-Language: en-US
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

On 30/10/20 1:53 pm, Aditya Srivastava wrote:
> Currently, whenever gerrit change id is present in commit, checkpatch.pl
> gives an error to remove the change id before submitting the patch.
> 
> For eg, running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
> API to 53 for 22000 series"), causes error:
> 
> ERROR:GERRIT_CHANGE_ID: Remove Gerrit Change-Id's before submitting
> upstream
> Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d
> 
> But there is no --fix option present for this error message, in case
> user wants to fix it immediately.
> 
> To fix this error, delete the corresponding line from the patchfile when
> checkpatch.pl is executed with --fix
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
> 

Sir I have a doubt: Can I start working on another patch and send that
too before the first one gets accepted?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
