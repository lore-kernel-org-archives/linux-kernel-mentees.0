Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DA9C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 05:46:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971822222C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 05:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwv5Jrun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971822222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DAE92203FA;
	Wed, 14 Oct 2020 05:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGoHKLKsS7jH; Wed, 14 Oct 2020 05:46:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F0A6C2039A;
	Wed, 14 Oct 2020 05:46:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0819C07FF;
	Wed, 14 Oct 2020 05:46:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE404C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 05:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C38A203FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 05:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDgHQabyolZW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 05:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 804C92039A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 05:46:43 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id t25so2984510ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=STRPyXECWcKIltplEj2C6HgW45CdmUPVhi1h9K50BgA=;
 b=nwv5JrunBDQOJDnDy8DxJyuBzuA/Y7BaCN/OCMVqP6MuQLli+zyRmEEGAq060tbJI3
 f6pkpYhrqcFU+WydRQSYKm+iyJTTBYZ7KKMP37t/w821wgr0DJQdqKOKYMi6P7woG+Ry
 j9rv7cGtnS37rwibw7h+sR8h8NfpugEuSecPwDBT7W5wIokytyYCqBa4HDsDktpxsYNv
 pQLwRJ2EZ040dWCxujjuI+2cMU9Av40uZhEhLcwYbQm+cY7SBoSuvIA+dyWTNVNkNsBp
 56CdJUu9El1jynQGDU+icjSF+YSnevfGW6fvjc+YWQBZrRPXY5ZY/aLK9uWs07aSry9K
 FK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=STRPyXECWcKIltplEj2C6HgW45CdmUPVhi1h9K50BgA=;
 b=bOh7gRVKY92r7NrQkAOBMJ/m8zXPSOSgyAXqHuWaJ2xQqPpysn5BaNFEOTwBSfvnnJ
 MOXt4sAEaJb6zaSQIlXvDlPjNomS870ovUs9OWZHyUfMBBJg2Oe5V+jUKc9SMxcH3/dw
 PaFKNaVePmm7Pf1zqR99ZZIwDp8Ee1H5B9HSNRg//2l5smBeXDGPn2nWQOGsEQg7mPIM
 7xLiL/ZhWsNRucsAeKLdteY7EJx5XtOYGGZx70cbeVG6CW3bWQbtPo2U5SshNoojLA8G
 MDCZO3WFBcunjt7ygQ3tY63lMyMm8Td/HaTyxtDSm+3wtNZCrYEguefD0DdUdaXipyHc
 T5Vw==
X-Gm-Message-State: AOAM533pCHcTXIrnQjbnT94JLWkSsQkFoHAKpg4pvUarUyubl3aEOTS3
 bEhZWsJru/34yK8WkpW9Oxo=
X-Google-Smtp-Source: ABdhPJxX/pHP+wB0Q0Rx87O0NVMkFbwJSOQsleVvEoA6b2DlvKbLJ28VuGQQ/GkvXeI8kDJVObpMSg==
X-Received: by 2002:a17:906:a988:: with SMTP id
 jr8mr3525968ejb.508.1602654401785; 
 Tue, 13 Oct 2020 22:46:41 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id n4sm988978ejj.19.2020.10.13.22.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 22:46:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 07:46:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
Message-ID: <alpine.DEB.2.21.2010140734270.6186@felia>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Tue, 13 Oct 2020, Ujjwal Kumar wrote:

> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
> 
> Based on current check conditions, a perl script file having
> execute permissions, without '.pl' extension in its filename
> and not belonging to 'scripts/' directory is reported as ERROR
> which is a false positive.
> 
> Adding a shebang check along with current conditions will make
> the check more generalised and improve checkpatch reports.
> To do so, without breaking the core design decision of checkpatch,
> we can fetch the first line from the patch itself and match it for
> a shebang pattern.
> 
> There can be cases where the first line is not part of the patch.
> For instance: a patch that only changes permissions without
> changing any of the file content.
> In that case there may be a false positive report but in the end we
> will have less false positives as we will be handling some of the
> unhandled cases.
>

I get the intent of your addition. However:

I would bet that you only find one or two in a million commits, that would 
actually benefit for this special check of a special case of a special 
rule...

So given the added complexity of yet another 19 lines in checkpatch with 
little benefit of lowering false positive reports, I would be against 
inclusion.

You can provide convincing arguments with an evaluation, where you show 
on how many commits this change would really make a difference...

It is probably better and simpler to just have a script checking for
execute bits on all files in the repository on linux-next (with a list of 
known intended executable files) and just report to you and then to the 
developers when a new file with unintentional execute bit appeared.

Keep up the good work. I just fear this patch is a dead end.

There is still a lot of other issues you can contribute to.

Just one bigger project example: Comparing clang-format suggestions on 
patches against checkpatch.pl suggestions are fine-tuning both of them to fit to 
the actual kernel style.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
