Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768B0C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:05:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8945A24171
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSRdARq+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8945A24171
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0987C85F4B;
	Wed, 21 Oct 2020 20:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThZZ95XhX1tT; Wed, 21 Oct 2020 20:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C01F85F43;
	Wed, 21 Oct 2020 20:05:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C2CFC08A1;
	Wed, 21 Oct 2020 20:05:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88A98C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 64E672E62E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbSqHMHVCmtO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id DD13B2EBCF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:59:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n11so1732469ota.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSSTapaRvfcOvJGv34VZnKufiYA0sC5x36uRb2n3tmQ=;
 b=ZSRdARq+99wgg9ynQRHtmlHzBHVMdHPboT5kvbJybMNk3veW+BM7TKuPeG+t62HO88
 HCb+w8Rg672WPwZBXAa2Y9zqExVH3oL+k8ZfLIMJ9qAR9NpNUWCy6jZjcwCkxcm46PkX
 mBMNY/7EbMftFakGWvqTDOJKx/PkE2Vn4jLQj4YnWejBSSdISk9gSfXUh7PVGlvHcuxY
 YKrI+577X6LB9xa6Wk0f98zxfklwTwjQS0c1jyV0ggeUKFUmlApCW+cRBfVHtfGn7nMR
 mdoOMFBYtI8VtqBXfo6egbNip6//xMO6+izf6jIJkTD6spJrJVvMHvYd/qPPqG70dr0x
 iXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSSTapaRvfcOvJGv34VZnKufiYA0sC5x36uRb2n3tmQ=;
 b=e10Yiwp6arFlw1SCM5kDQIbnJLcfpfvCo/A8Oa8brsZWwFQlYdBgHSZO3vgsaVbKQt
 OjXnSeEZdueJq+UOW3o+p5Yne2Qt8gf/Va5vS0gYGVuanJG+SayQJFdJ92BFDFbIm4Nn
 kcRyJ6N/X/xKEq7Mw/Sn7+XZ8Q/unuM9CzZVbrvLY3fzDSKG2TDCbQe++ndu4J/XoK4b
 tBtnweuSmevjuwchAxs1shEFjXYYT+3DAMOLEHMmVwLJx1F486HG/OxnY7CTx6PfGC0J
 K+1ETSGFAWYRpHVGc0OOVwhWqS1yYaqN7ciQnqG4akwGdu8+qCAy+E/QXdOuPfvwcDu3
 NnTA==
X-Gm-Message-State: AOAM531ij/J+094PVAyvsvkOWdcKBbolzTQTAWo343drm2l9kIxsJATR
 TgSQ71S0MKBtXlkaFNENa3TBI0RGNjk/5kyjgNE=
X-Google-Smtp-Source: ABdhPJwTem+D2pxTJTJmpHD67zfre6bBqCdfESAODixef0r9/XVUg8sVTfL1Its8173bDdgUpzaBOL2EA9fRcFGLSFY=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr2412253otq.265.1603285172944; 
 Wed, 21 Oct 2020 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
 <alpine.DEB.2.21.2010211049020.8328@felia>
 <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
In-Reply-To: <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 21 Oct 2020 18:29:04 +0530
Message-ID: <CABJPP5CRkZKFaBjLLDmsaT=Tj19UwBUavB3sVRsRj23k0ncQ-A@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

>  # check for repeated words separated by a single space
>                 if ($rawline =~ /^\+/ || $in_commit_log) {
> -                       while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> +                       # avoid repeating hex occurrences like 'ff ff fe 09 ...'

Hey,
Probably one more change you could do here:

> +                       while ($rawline !~ /(\b[0-9a-f]{2}( )+){4,}/ &&
> +                               $rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {

The hex check is performed everytime a duplicate word is found
in the line. A line with multiple duplicate words will lead to
unnecessary re run of the hex check.

Example:

"This is is the the repeated word"
Two repeated words: 'is' and 'the', and two runs
of the hex check on the same line.


Probably move it here?
 +               if (($rawline =~ /^\+/ || $in_commit_log) &&
 +                    $rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
