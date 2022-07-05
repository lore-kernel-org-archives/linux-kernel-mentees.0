Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606C0C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jul 2022 03:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D83D160EED;
	Tue,  5 Jul 2022 03:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83D160EED
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lVfRRVCc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Az0ZbYlY6fVW; Tue,  5 Jul 2022 03:03:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0591960EB9;
	Tue,  5 Jul 2022 03:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0591960EB9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE587C0032;
	Tue,  5 Jul 2022 03:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B1F9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jul 2022 03:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 537A660EC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jul 2022 03:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537A660EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfI9MxhNaw1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jul 2022 03:03:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA3260EB9
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DA3260EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jul 2022 03:03:17 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x4so10339860pfq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Jul 2022 20:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xuoTm740zVnxYj5EINPCCJAKnkMg+xM2xxfC0FX3QAQ=;
 b=lVfRRVCcNBeAzTM+0N6lGGmhf9eubl5xS/PERTwhsaERJCE1Cv8yHtxeAYsDeRQjtB
 KweQOWrX+kopTsrJAVSVtiVwDm+4I7rze3YoOLiJWyXDyl1mLoY13yo8iTzE3rM1tV01
 JmiA+BRD/Qp12FfuKrB5dsL3qiOOHr5j6yervq8w9D6b7cquQ1SF40vl/LopV0En3ucQ
 47oQLBTT/Xjeb8Bi5nmtpvy0sPyV0NP0qNfpCu9fyN09WxtRYKz0ni9KrOAweQyMwBiW
 9UE+mw+EOyek/gL7JdLqdfnD5T4djeN3TLzSxgKQYxVcJhqSCicFZLD50JSB7cxZrKsw
 FCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xuoTm740zVnxYj5EINPCCJAKnkMg+xM2xxfC0FX3QAQ=;
 b=wp8lVfJmLtHLrq/z/XryGQpDhSLIlvfUoMi2Og2akhSgo9qqY33fYtgKELjnwRV86D
 dpAWhQp2gfdY8cKWQe3InL2NsyU1Ubn/Jnyt6uHc5uL9v7oEKcXZKDaHlLZ/4PGAS0z8
 1iwJqNPNGKbtqQuwU+v5m+cmZCecHvAcgRzbtBqw6mXaodt5Lmu/jcxlYSmyPvzv/1Rc
 RweSCvNBLxPq5RkQnoj2D1AvRAO7RG5M139KpHIOm4Naq8WQOdC0qpnVmmOLntssJGIj
 +AxCMwP7kRjPkgMc+AGqN3xXkE2mVUSub8CZXGXIHDvktdvEqcYWYB6hj/1KIkHclbrn
 shdg==
X-Gm-Message-State: AJIora9Vbv2+ekp8f9LcjdKBH1wBZgvrDKk3jjRSrh//SdArZC6YdpuS
 +QGyoy7x/Jfj2avCH6Bo2pjk6P+5Wss=
X-Google-Smtp-Source: AGRyM1teZXvlPR1RhR4pGZk4Axk4r2XrnuZp0s7Z0SHSOgQV3rhnZvQkZQuoUAQCENLrwdNo/yXL5w==
X-Received: by 2002:a05:6a00:148d:b0:528:3d32:f111 with SMTP id
 v13-20020a056a00148d00b005283d32f111mr18931266pfu.31.1656990196654; 
 Mon, 04 Jul 2022 20:03:16 -0700 (PDT)
Received: from Negi ([68.181.16.243]) by smtp.gmail.com with ESMTPSA id
 l7-20020a170903244700b0016bcc35000asm6153099pls.302.2022.07.04.20.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 20:03:16 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:03:15 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [RFT PATCH] isdn: capi: Add check for controller count in
 detach_capi_ctr()
Message-ID: <20220705030315.GA16609@Negi>
References: <20220701235014.13025-1-soumya.negi97@gmail.com>
 <ee159745-07d2-dca3-6be3-bef823090088@gmail.com>
 <20220702093734.GA24575@Negi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220702093734.GA24575@Negi>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,
I was just told on the syzkaller mailing list that this bug had been
fixed long back and syzbot didn't catch it as the commit didn't have
a Fixes tag.

-Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
