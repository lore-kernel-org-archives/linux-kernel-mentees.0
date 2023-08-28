Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CAC71153
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 08:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C093960E15;
	Mon, 28 Aug 2023 08:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C093960E15
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eY2asSzz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJIYxWKMcDhe; Mon, 28 Aug 2023 08:24:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A2F6A605B5;
	Mon, 28 Aug 2023 08:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2F6A605B5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87E95C0071;
	Mon, 28 Aug 2023 08:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 553C4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2179C4151A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2179C4151A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eY2asSzz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2XQZkGL-5HO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:24:51 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D25E4410C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25E4410C1
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-565403bda57so1183749a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693211090; x=1693815890;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e9pJAr454rayHBAXFAjSdv3co7r+pS6oC0hrTuJIa6E=;
 b=eY2asSzzsQ06/so0010x36+boQ3snxsY+ZhSEEJMUPdRKigzKMOHnD3JkjdxFgLJCr
 Z/bUrl+yxCPBB+ijb2WKjbcADhY5TIZp8+rFSs5M/NOzSrLxxm3BC3oktivF+s8BTD15
 kODf45MmZgqRTEzGyppstnpBSDD1XWjLCfH0pkVOEw/m+8eL9sKYkd+tclBemVCtbaUV
 /Aa9bVsxY2yserL06GqRxhcUSullxJwOXLL2w0RiwDvAQ2Zblnux5PN2MvBuUBmPAhjy
 0zExMXiD3nDyzmTvdXr1QjJJhK6G3Hl++0dqhSZuCpuKExawyYEehlq4Hi4nQb377nTK
 wt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693211090; x=1693815890;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9pJAr454rayHBAXFAjSdv3co7r+pS6oC0hrTuJIa6E=;
 b=AvX83+XUXlbQBfzlRd867/YVcM+x/ax93VApFZYNkbG+hqXCdAycP0wKctenW4jT2x
 qWvozOg84FYspVbYM9SwU4qlKGKe1ZeEoV5LhBr2tZDkMKPMirs5vUVJG44ilzNcOOyN
 eyyRul5qqpM1lqGayVJdwHLnq2TwNJ49lQpVnF1ErD8+fVh32MpxbUzvUdw3jPsHpHcV
 F3zXekoYlv2upxSdXCP0GPh16aydl/SZOWada2Iru8ybN1GNfcjQP+zPs+2GIrDuZuRK
 wqDBygIdMNvCEqCg+9HWrsblaPStxu2eElqy3hmXsZUeOWurIaEIT1f26aYN/THAysej
 zlOg==
X-Gm-Message-State: AOJu0Yz2nOL8/Km9Rh7pBb35NnguV+rSX5bFDJiyX53Rf/+hfkvLC1wR
 LagOKBA2gh0JSUkBZpe2+i+o6/ZSbzpe59dGkd0=
X-Google-Smtp-Source: AGHT+IHPq1bU+a3PvaxjpcNWce89Da2D3WiRaqN32RXecja2hVeevqs83PNitatCwNlfrKSg/wvMUlteRN4XLAzvNek=
X-Received: by 2002:a17:90a:ca16:b0:263:fc45:4091 with SMTP id
 x22-20020a17090aca1600b00263fc454091mr18481089pjt.15.1693211090110; Mon, 28
 Aug 2023 01:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230828071829.64366-1-anshulusr@gmail.com>
 <2023082827-craftily-citric-06fa@gregkh>
In-Reply-To: <2023082827-craftily-citric-06fa@gregkh>
From: Anshul <anshulusr@gmail.com>
Date: Mon, 28 Aug 2023 13:54:41 +0530
Message-ID: <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
Subject: Re: [PATCH] fixed formatting issues
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, mattst88@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hello Greg,

> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.  This will make it easier to review the
>   patches to ensure that they are correct, and to help alleviate any
>   merge issues that larger patches can cause.

I believe that splitting the patch is not necessary in this instance since
the changes are localized and trivial to reason about.

> - You did not write a descriptive Subject: for the patch, allowing
>   everyone, to know what this patch is all about.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/process/submitting-patches.rst for what a proper
>   Subject: line should look like.

As per the feedback, the updated patch has incorporated the changes.

> - It looks like you did not use your "real" name for the patch on either
>   the Signed-off-by: line, or the From: line (both of which have to
>   match).  Please read the kernel file,
>   Documentation/process/submitting-patches.rst for how to do this
>   correctly.

I have verified that the Signed-off-by: line and the From: line contain the
same content.

Thanks for the feedback,

Anshul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
