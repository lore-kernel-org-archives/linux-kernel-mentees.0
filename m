Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E056C1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 02:54:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404F120724
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 02:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="v7GVXmsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404F120724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 00B3B25CA8;
	Wed, 18 Mar 2020 02:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFxrk1CUYrKM; Wed, 18 Mar 2020 02:54:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45E2A2048B;
	Wed, 18 Mar 2020 02:54:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3626DC18DA;
	Wed, 18 Mar 2020 02:54:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F065C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 02:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 159368813D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 02:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KiF0NNaRN27g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 02:54:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59F708874A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 02:54:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l20so19511397qtp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 19:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=3C35olvr1uxQiZRtYljp/04B+jhJRb+WGjzvnqhzgag=;
 b=v7GVXmsSily/kZNruo2e16FY69XQOJH+InvEnxAEDpuWD8oIImfY1E9EKApFSSoR3T
 gjFG0SR361lkbHkn5ORR2E/m1a2pkKYrLk6hnIT/4coqTbu3s/ISOlF80tGzWUzM1dIe
 6R3jOFw6wTX49ggV6w5fkhiZIWDv841jWa512+xTzslDHT45q52aU+wQ/kercNdfiIar
 hz5OELca/SuULhcxuvcj4HhqreDlcdadknI7m0CLjmtX85r0awtCZKas1WqzVH8WRCSo
 2SfRrPt+cUyIyAvrVn2l25e6fkbEDB+3GBgmgUwPoDE9FJBJKsORMs8IyKv8nIAcKwIH
 H0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3C35olvr1uxQiZRtYljp/04B+jhJRb+WGjzvnqhzgag=;
 b=meR9ddVaNM25SnZwQAcvkpWoJ3trK6FOygEqMBU2IrKcb4LPbBOFgQtao7d1KH35wY
 lqDSC1iSvSb05HPKdOnHdrVU3e/6p3ymrgQTGCUYwwm2aGWFhUn0FxfEFR6G7+WjS6Nh
 /DWjS2u9N32GdiHd4gcmSxWegShGMMj07W67hkGPlg0jPepPIIVa7Tx3MyERqG0Kg4qM
 Z4z+oVem8qibmWZhly77YS4gPHReZyrAdqkqihg7eAgd6XxBaXieBCnS6ybHfbBaO+Y7
 lY7iwGBcs4NR1ooMbfyOa6FxS9BVhpq6qjkasrYKTZAwIKZ7aQ7Pt+F8pXFsi+1+Spfz
 IXOw==
X-Gm-Message-State: ANhLgQ1NvgXwrc1Y78oPBKbdMmQbo1BdK/T/zX3sXRd47l2WD7Q9YeIv
 Rt8LQF0E4m6rHctR20R3X6FAMg==
X-Google-Smtp-Source: ADFU+vteDlIFDxIFBjR110bpf0AYyhSYo8d+6qoGC4GIAk5D5OfM8L0STIPhamRFdzI1ovii7IW22Q==
X-Received: by 2002:ac8:191d:: with SMTP id t29mr2442080qtj.40.1584500064221; 
 Tue, 17 Mar 2020 19:54:24 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id z9sm3662537qtu.20.2020.03.17.19.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 19:54:23 -0700 (PDT)
Message-ID: <06d82c7cf86e998cc712b545e7d43d9193a6cd21.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Tue, 17 Mar 2020 23:54:21 -0300
In-Reply-To: <20200318015518.GF22433@bombadil.infradead.org>
References: <cover.1584494902.git.vitor@massaru.org>
 <f75ffec5b2d1a2e3f6ba9151732fb37cc2bed040.1584494902.git.vitor@massaru.org>
 <20200318015518.GF22433@bombadil.infradead.org>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: no To-header on input <>, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] xarray: Add identifier names
 for function definition arguments
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

Hi Matthew,

On Tue, 2020-03-17 at 18:55 -0700, Matthew Wilcox wrote:
> On Tue, Mar 17, 2020 at 10:43:02PM -0300, Vitor Massaru Iha wrote:
> > Fix several checkpatch warnings such as:
> > 
> > WARNING: function definition argument 'struct xarray *' should also
> > have an identifier name
> > +void *xa_load(struct xarray *, unsigned long index);
> 
> Checkpatch is wrong.

Sorry about that. I just tried to follow the kernel coding style.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
