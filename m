Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A3EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jun 2023 13:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 092A540C88;
	Mon, 19 Jun 2023 13:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 092A540C88
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ine5LS6c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqDv09w6Pj2v; Mon, 19 Jun 2023 13:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0621540BF7;
	Mon, 19 Jun 2023 13:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0621540BF7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF8B1C007A;
	Mon, 19 Jun 2023 13:49:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C815C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A75680964
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A75680964
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ine5LS6c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X60YcKiQcj7c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957D981769
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 957D981769
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:49:27 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b520c77de0so14355055ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687182567; x=1689774567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfV234ipEV2m8xogB7Wi+sWBOiJ7SNMV0abfD7C/wG8=;
 b=Ine5LS6c9y6jwgvPYxtPmp3P+gEHDDJp7KHx59PjhUElufW0f4UcBZlKvqAr5XwPbp
 bJfOVz1sMMhPSh4Rzv0AmURNRc6WUw70Rxd/uQFxsilFi0rmyC7lEVHPgIcyM0ZpNHnd
 1Y1ae7fYj506xRLLJ5Ufm+mc48XziVNB6C0hwZ3Ewa+2qht6XzRA1//Rd/BxMaJYO+4U
 alelOTV8aAV/oGz9ADJLrI+K7TpffXNJsbDvw3FjB6+Yr9Tr4UVyZjCR3QSmhQpTG1di
 43u/OS0ZP+9Hh25z4PQY5yHKju2EkENsCbEYCmKlfEue3H2ex+ThpX7iZqFha70LRy2F
 7Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687182567; x=1689774567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfV234ipEV2m8xogB7Wi+sWBOiJ7SNMV0abfD7C/wG8=;
 b=YPwvTkjso9PJqbywN/058k+qUKVi0DbLMn6xRRQwe0TP2XhzzEbKQNIlHt/4Gj21n7
 bqHWLbbZInozlKVQDlu9VGLvlagTiDax5DMGPBJi+V3I2J9M2kpR7QSOAF5gSbbWi7tU
 0TvMg8xkdwyeCNUBKRRG+FzArckoTo0Ij5NW9leOKyHG2wFzcc6cyaW/+skipctCkRBM
 rILoatAbNvscZJLeUSPumtGJy2/RHLexGRsAJyMaJ2LsPFgciKEXRBkru14XCIAsIliW
 ikpRrqC80SkWj/OW2qOl6/yT88oPP7aTqydmpLgs3uJe6+hzu0bLTNDDfAPvnTr8BDAb
 6ghQ==
X-Gm-Message-State: AC+VfDwYXzoTGzpcjtBncWA8gtFHDG0HykubTkZpb4sWzAnhzl8jkuSy
 A/1mOL3r6QZVcU+MPT1G6qY=
X-Google-Smtp-Source: ACHHUZ6UkYGnyShtmIsx+2AzmKB5WwOodXTLV9pRDEnnIp+I/qSpQYiXcWw+0WYZsdbPX0yEYlgbVA==
X-Received: by 2002:a17:903:22c4:b0:1b0:6e1:4b9f with SMTP id
 y4-20020a17090322c400b001b006e14b9fmr876665plg.43.1687182566817; 
 Mon, 19 Jun 2023 06:49:26 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a170902a71000b001b061dcdb6bsm20501435plq.28.2023.06.19.06.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:49:26 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:19:21 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <ZJBc4bok1krfjqWf@zephyrusG14>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
 <2023061938-unbounded-unbent-e706@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023061938-unbounded-unbent-e706@gregkh>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, dan.carpenter@linaro.org
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

Hi Greg, 
On Mon, Jun 19, 2023 at 02:57:56PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> > This patch series alone is fine. But when my patch series ([PATCH 0/9]
> > staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> > fails as we change same lines. Will see what happens.
> 
> Yes, none of these apply :(
> 
> Yogesh, can you rebase this on my staging-next branch and resend?
Sure, will rebase and resend. Did you mean staging-testing branch instead of 
staging-next branch ? 

The patch series is rebased to commit "f99bbb4412ce axis-fifo: remove the 
unnecessary dev_info()" which is the HEAD of staging-next.
Latest changes by Philipp are merged into staging-testing branch. 
Let me know if you still want to rebase it to staging-next branch. 

Regards 
Yogesh 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
