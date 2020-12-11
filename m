Return-Path: <SRS0=qh4O=FP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEBAC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:24:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F0E23ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F0E23ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD63A85E08;
	Fri, 11 Dec 2020 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_osi_YndB5F; Fri, 11 Dec 2020 06:24:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7968C85D7D;
	Fri, 11 Dec 2020 06:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C692C0FA7;
	Fri, 11 Dec 2020 06:24:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0334EC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E4D3C86F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pp+Yo2cBpQw1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:24:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AEC5486EE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:24:29 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id y16so9672810ljk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 22:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QW79ID63V8kR6ESvojQsKwVxTm1oGvHzb7z8iHGA41E=;
 b=FYQeiWFNg6PIjczafN0yvhdPNS3z8AWfGyBkDKYKKgvfPDpuDA/8zLcevtQf2M3ZjT
 t+k9TH2ZQxZfHfAi5SUtwQ/bjxZpxj5ozLPZnafn+fPCr+TqN32oVJ0G8zqYUhbA2kaC
 p20oOcfRn0538iINQeA5RnV2rIFd35mmGm+PcK8JXx3uqHGqnFvW6WhQOawtMnTMR9Ua
 XShWRKFhEYsZCXH7P8Ib9v2KNwiCbR2Z2ATh39MxJPFcJpgrZGoPcFl/hc4HD4JUowUW
 YjLbkUeS1thE9BiivJGDEU5LOOrICOEzo202Ec3t+3FY6w9h3v9x9ru+rD++MmhzLrKX
 KIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QW79ID63V8kR6ESvojQsKwVxTm1oGvHzb7z8iHGA41E=;
 b=Qtr+gBxa3RpK/N7CULW8srO+X4yaU+4V1G6JG+13CXz+ECM3GJjpJDvWC21GrgV0ZV
 Hj2S5RJ/d6GYZxZDV7vA+jYstoIQC+oSB8Y19cVUVZgeKl/3N8qmoibLZGw0/tWC7+MN
 QFzGt1aDAdY7kcuVIShvutMfIecoXfJNYP8UvzV8WTUAMxEr2jI3wmXjxNxoC8Zg3ri6
 qCrSsVcFQprdQJYffvLkgUEzHUiFOPgyoLqLAr/5FfleswSt+a/MRmbZaR/tf+ywYgYP
 rtIEdLoelZNrvWlfK+yG0xoeq2PPnrZewwsMTKnVp172K9A2hU7VEHwh4ML9pkwYH7Ch
 Y6Yg==
X-Gm-Message-State: AOAM531ct4DaTZhofQFxVfA69LIwwLqrxPKZu6WBUzrIfjCxfBPURLlE
 DJ25FK6ZPOXAYq1bSIlb2gHGomsUNZReZQApiOY=
X-Google-Smtp-Source: ABdhPJyaXVIionPSsMHnF9GAKx2ZkVf4Tj3Dri2LrCc/UDbqKdYR4f/IRvE0hQZksC9Qg83sXQ/s7hfgjtTcDaEGksE=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr4755843lji.466.1607667867586; 
 Thu, 10 Dec 2020 22:24:27 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
In-Reply-To: <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 11 Dec 2020 11:54:02 +0530
Message-ID: <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

>
> Aditya, Dwaipayan, can you set up a git repository that you use
> together to work on this script?
>
> And provide a short description of how to use the script with an
> example in that repository?
>
> Then, I am happy to try it out... and provide you more feedback.
>
> Lukas

Hi Lukas,
Sure enough, if Aditya doesn't mind, I will put up a repo for the same.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
