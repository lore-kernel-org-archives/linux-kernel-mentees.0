Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87161C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 22:24:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CB62073C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 22:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fKA2uASN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CB62073C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2404A85124;
	Mon, 30 Nov 2020 22:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oO8o8kcjWRCr; Mon, 30 Nov 2020 22:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9B7480EC5;
	Mon, 30 Nov 2020 22:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86938C163C;
	Mon, 30 Nov 2020 22:24:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE101C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CBF9486945
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0ZCxs9L-LUY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F1418690D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:24:17 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x15so7309534pll.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tP10auY5b/+hzNiyTCTFtYJxVIRMIAgFsrP2yx2Sg3Y=;
 b=fKA2uASNNmUSAdH8RvG4OeS9vDii9vjtJ+qPy6l79wdX0Bhc5GCox+clxnSNfQpv5Z
 rPk1xCj6/UQ1NuWfJU9U3gLdsaloMVIAB/Ew/H1Jy5xlXQNf26auNbfF9rOh6mqvc1MJ
 gXdzMmEDbcpK9xd0QgQi8Hs1dLExTrGkI64CH1qQn3ewgb2S/PjTRlXBEvbXwOrAKxfN
 5PbOpheLTUXENkl4qhw3fc6MMK62GwNDrzYeKNO9UXo9QoDdU9EHs24cCNP/+yJ2/mV2
 Q1aOf/HeL8HiNGq95TXtUkneTvfnhlea8rCm84CqNwXPxPcrW8/XMERy9Vyn52xu0tPg
 6Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tP10auY5b/+hzNiyTCTFtYJxVIRMIAgFsrP2yx2Sg3Y=;
 b=C5iIuZ28kcXRLgr1NlsHvETK4t6vm1IUbQ/agQ4NQATmcbge0xcpiqscRapRv+kIcg
 7TaB/5I1qJxktWzgF3SBVyMP25wRoOp+GPs1s9uny1NmoNrX9bX2UEfRr3Y6s//bzaeN
 12sQB7jNvDmBeEQve7JvOXtfLEaVkKwISouQvL9w/TD5H3hpZpBlVa8goqpFRPB75MYz
 rHkh4csFXdLxt1c68Dd2AQr3nbjy4RYysywopsd1/t43PNe21krQzUZrfGuve442W6jx
 HXUpjFF4vHJnlcls1tOjqHQ45HsZ2vS9+BbDhyJSGfV/Ph+DLXKeHeZKLJOyuuCye7/v
 2j1w==
X-Gm-Message-State: AOAM530CXQKeVrWZBpLHG0ampgLWpDph5GPIB9xWyielBVrBd3xCAEQk
 BWLMkZPzin4NLpMWdncU9Y6v+WKT/ouOQVmsDSXP1w==
X-Google-Smtp-Source: ABdhPJwBW05dCKp6JwGQ8qZLyIPqU+sgllBKgG9WsgW8WuQeZ5sRlEKY2B/Pl3nXeVEzHxE+VL92fIImTrWF0SBiI7Y=
X-Received: by 2002:a17:902:bd09:b029:d9:f7c8:6210 with SMTP id
 p9-20020a170902bd09b02900d9f7c86210mr21302705pls.80.1606775056561; Mon, 30
 Nov 2020 14:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20201115185759.169279-1-98.arpi@gmail.com>
In-Reply-To: <20201115185759.169279-1-98.arpi@gmail.com>
Date: Mon, 30 Nov 2020 14:24:05 -0800
Message-ID: <CAFd5g46mV_BKC8JQkw0vTXzZfy-dQ=N0jO_DHe-nBrWZimYVCg@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Gow <davidgow@google.com>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v8 1/2] kunit: Support for
	Parameterized Testing
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

On Sun, Nov 15, 2020 at 10:58 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Implementation of support for parameterized testing in KUnit. This
> approach requires the creation of a test case using the
> KUNIT_CASE_PARAM() macro that accepts a generator function as input.
>
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides a macro to
> generate common-case generators based on arrays. Generators may also
> optionally provide a human-readable description of parameters, which is
> displayed where available.
>
> Note, currently the result of each parameter run is displayed in
> diagnostic lines, and only the overall test case output summarizes
> TAP-compliant success or failure of all parameter runs. In future, when
> supported by kunit-tool, these can be turned into subsubtest outputs.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
