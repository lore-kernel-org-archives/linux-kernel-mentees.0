Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6526AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 04:56:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85E0208C7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 04:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSFitD9e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E85E0208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E027E85F61;
	Mon, 14 Sep 2020 04:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CL7rmaEwPG5P; Mon, 14 Sep 2020 04:56:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE19885F5A;
	Mon, 14 Sep 2020 04:56:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7FE0C0864;
	Mon, 14 Sep 2020 04:56:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8A8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 04:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C366D20656
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 04:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m+FifJOViQIh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 04:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C46FA20531
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 04:56:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t14so10529177pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qoyVd0jUsTGxr5qBeSMaGbxX1ndrme+ZShriKoc/098=;
 b=sSFitD9eHFtqs00IGHuEvUfVCPsdxRVke7Sx9bBwgY9RuWkufczwZhsw9GiejAhg60
 hkBO5vKBFDSph3eg7zrYXDWacr2ybkjONMMBfpMb3Ygx2fSS4yf7y90OCirzoMGoWtVV
 7K3lPspxHFN24EvmiZKl69u4QcfAGIMG3P1u81r/YTb6H1g4edNy28fmlCdmK2yiSSM5
 X528NJ2uKRPUz+Zs8gyYIW/j7fEAMWgBQN+IMsrhksAxnF0RTYiamSn0+6qX9l29wScG
 7cc47zpPQWSzh01LAlpDVGA1x4+VtD3Zk4sko37oUDiQaidhMKDpl2eZczSCkiVxZFGP
 va6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoyVd0jUsTGxr5qBeSMaGbxX1ndrme+ZShriKoc/098=;
 b=LVfDdC3zAXcDpYLc8Fkqf2HJejvwHvYUrtoCdNaTcSaNT2Rl22HfBulFHvBghIgqQL
 x/26x1yRtttHvCtYyKksSw7mw7mmC6iYgXktMmvW2tCW15TuHxtVF6bvHvAauhY8bKsp
 DOiVWF7eyZkP+Coy+SZVOdbaqFqYsSvaRLZYn8HWCM1nedD/AGzQ3uyPlz/eORpXv2dd
 4VtJU9hMFzGhha92m+/zbwe2p0sUb4FjN5elekLtyNtKA0Nj8DliFYlsAtfmFUpOGU4m
 tdlEmhX9A6hf9v8uiU3QxsMg7KJHQOevwQnKQsbLAO8KaXwvqqAXhd7XSH9jxsVhiDSe
 Ztuw==
X-Gm-Message-State: AOAM5303+FaEY8fO50mncC8EIDZ+OQTcaWDbkLW6/eh8pvD5SiC8eQks
 hdCec/yleA1qPRjxIKEeAjhR0VURTFWPpVYFA5o=
X-Google-Smtp-Source: ABdhPJx3CvRu7uwbxatW4XwAPPi8nyJm869PrDt9lLE8F/eF212IZjzTmG7k2HUB53I/2y4pzbJAsg==
X-Received: by 2002:a62:ce8c:: with SMTP id
 y134mr11892292pfg.125.1600059395823; 
 Sun, 13 Sep 2020 21:56:35 -0700 (PDT)
Received: from localhost.localdomain ([49.207.209.61])
 by smtp.gmail.com with ESMTPSA id n127sm8587463pfn.155.2020.09.13.21.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 21:56:35 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Mon, 14 Sep 2020 10:26:29 +0530
Message-Id: <20200914045629.26407-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Date: Sat, 12 Sep 2020 18:25:19 +0530>
References: <Date: Sat, 12 Sep 2020 18:25:19 +0530>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2] net: fix uninit value error in
	__sys_sendmmsg
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

I can assure you that when I said "I think", I meant it in an assertive manner, and not an 
assumptive one, but I can understand how that could easily get lost in translation.
I wouldn't have sent in the patch if I had caught the build warning, and once again, my
apologies for not fixing it sooner, like I should have.
I didn't mean to disrespect or offend anyone, and definitely wasn't my intention to waste 
anybody's time. Needless to say, something like this won't happen again. :)
I have sent in a v2 for this, which doesn't add a build warning to the system. 
Thank you for your time, and once again, my apologies.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
