Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93028C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 02:41:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA6120663
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 02:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHxuqay5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA6120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AABF88FE3;
	Thu, 16 Jul 2020 02:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaBMnv6t66Ab; Thu, 16 Jul 2020 02:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD8A388F7C;
	Thu, 16 Jul 2020 02:41:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0AB4C0891;
	Thu, 16 Jul 2020 02:41:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D986C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7105C88602
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKkWsbXFAi2l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:41:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 60C4D885F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:41:43 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w2so4088888pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jqVUIDpGCAipRS+ecPG15XM7TieBrIaHAd9mloEKAfg=;
 b=JHxuqay54G74N6vgudi5DVmCfb4LywmFRGcKR/VpugHM8EUk43/s0CR2VP3/5kLIdx
 UvyJZpGYeun6i18sh6eYGHmfAvaouR2XxCQugfkAC5YUal7+JFzkKqNxJm/QVlqbFxeq
 Z/OHtPeZEPIIoWCPsB5YvZ+H78MRYn8SrV2cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jqVUIDpGCAipRS+ecPG15XM7TieBrIaHAd9mloEKAfg=;
 b=XV/XTtIpzFB6j0AS24ZtkY/9FoY79SR9gbQdkvEaEp36GcpDOz+Hcw8hh2BTLUBV2r
 48vzTRF3IOmByy3dW99nEZ2jGjHuCqzDn91mSWJtdK2xGXs1Y4U9tjifvM8r7kgZMGAp
 lLItloie8RBhLlK2kbMmA7pXD/t0XBFs/6hukCGH3wXZRLUd374lf4XJ+5exvkbab/zk
 QnMj5nemDconklkHr2mDo344wD679V53uSc1O6Va0CG739eSV5Dxpr1dhlpfZ6/DrO8x
 Y6CDRmxW7rrsuaNzygSR/H/WN0uwh1d+7p5C5T1J7fRdqzgeyzsX3oA0cbF9Vv8JuzPL
 CgJA==
X-Gm-Message-State: AOAM530zyh/tvpAqsjNu5SwtgzUfdar894XlPyu8ZoIeTxa9nDiBlBU4
 AQLiTdtmdAClLkfudy3MrOiZ2Q==
X-Google-Smtp-Source: ABdhPJzMM1zSFnYR3x2DnMDjCvyMLDkK5b+zSz4ErPk651/nIfO+yLt/HL7ZZk7cQTCfVqxRQyJNQw==
X-Received: by 2002:a65:6883:: with SMTP id e3mr2401712pgt.5.1594867303051;
 Wed, 15 Jul 2020 19:41:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z2sm3271605pff.36.2020.07.15.19.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 19:41:42 -0700 (PDT)
Date: Wed, 15 Jul 2020 19:41:41 -0700
From: Kees Cook <keescook@chromium.org>
To: David Gow <davidgow@google.com>
Message-ID: <202007151939.62EFE6F@keescook>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC 0/3] kunit: add support to use
	modules
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

On Wed, Jul 15, 2020 at 11:47:11AM +0800, David Gow wrote:
> - The inheriting of the mm stuff still means that
> copy_{from,to}_user() will only work if loaded as a module. This
> really needs to be documented. (Ideally, we'd find a way of having
> this work even for built-in tests, but I don't have any real ideas as
> to how that could be done).

I'd like to better understand this ... are there conditions where
vm_mmap() doesn't work? I thought this would either use current() (e.g.
how LKDTM uses it when getting triggered from debugfs), or use init_mm.

I'd really like to see the mm patch more well described/justified.

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
