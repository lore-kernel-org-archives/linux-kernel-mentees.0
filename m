Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD333C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 21:14:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD7822BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 21:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="BIJROpGS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADD7822BF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E9A2120003;
	Mon,  3 Aug 2020 21:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be4x8xSwe7uo; Mon,  3 Aug 2020 21:14:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6864A2051A;
	Mon,  3 Aug 2020 21:14:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48876C0051;
	Mon,  3 Aug 2020 21:14:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38309C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 21068877D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 21:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G316vKVnjC8q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 21:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 86E6586DA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 21:14:54 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r11so11065358pfl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFs5N7Aj94X2p4Itvu8tYvN2B3/GsCmBFKnespcHSO0=;
 b=BIJROpGSryxlCfoh5rldvY+j0NKCC0TMSDj/SFN4RZMbQXx5jWPcy71uC+SEtNDxX7
 BqHAgLfMCOWFh5CNKROZfxPZ7EGqxWAg93Z6IjH7NzGlBMXrZcz89dtyCQzcWdK51/rc
 4fcRl1C9vlx4ysv8yE4M/BFzdQHtnm+whqM3MeFrq5DQOznOUiZWtnNMCG0/nmJ4d/7y
 rB4POQCJpPpNHFNFza1crYxYA9RRemn99Fll6ery5GoKvTgmgHezyhpPaFZuHLcvyRsN
 GEAKftb1k0JcKY4VpjWXVi9+noA+0KYRnOD0pfyJCTCONpF6xVqUst0vVvw9lVpCHj9e
 mamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFs5N7Aj94X2p4Itvu8tYvN2B3/GsCmBFKnespcHSO0=;
 b=Kizq4XQeB2JJeT6Fs2LYgF6EziN+PuKabfngUtXLignTmpzwpB9DRyPRzIE1fJGAJ5
 8KIznaA0tVb1W/EcXto13m92Mjp9t3M+NlkijNExaUp+VqD6pY60/HTlwyeGh5WivoIB
 Xw3qKKMqnrXsuS3RfthksqmcfPe7EqMTAwNQMUTrTLKT7WRx/guHi4gQ36ikZugUl4On
 LCLSSvOykd6eBa/pdKbj3yA9jI3tCVE2bB9JB6xYdfAKBSkChAfcr6wXa5RyS0IWliOs
 r16wDdnXRg5+0NX6JJit53XBEAOWdyDDa3MURo4vO8dh68dw0mtmtM3ITxQ7SkN0BqgO
 E3ng==
X-Gm-Message-State: AOAM532Jqw7L2yrqr968JSXWp90DtW56vkLcSdcurlviWagDmW7OxyQx
 V5xcEOY8JSTv2Frin/ixS2G/8BetLQo1/NJoeh+e5g==
X-Google-Smtp-Source: ABdhPJxN74uGPSyFq/sMHzSrAyVNydvv3a1KRtp+ugVWRWUR4XzuGsQSZAk1SzJ3Mge5oZFXZ7/TRU4deckwnTL4Mdg=
X-Received: by 2002:a62:7b89:: with SMTP id
 w131mr16526946pfc.284.1596489293882; 
 Mon, 03 Aug 2020 14:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200803025939.21106-1-98.arpi@gmail.com>
In-Reply-To: <20200803025939.21106-1-98.arpi@gmail.com>
Date: Mon, 3 Aug 2020 14:14:42 -0700
Message-ID: <CAFd5g47u5u=cVAM_5rBj0mA4YcKjanebb35Po1EN13mNrEH7KA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_uuid.c to
	KUnit
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Aug 2, 2020 at 8:00 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Converts test lib/test_uuid.c to KUnit.
> More information about KUnit can be found at
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> This change is beneficial as KUnit provides a common framework for
> unit tests in the kernel. KUnit is fast as well.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
