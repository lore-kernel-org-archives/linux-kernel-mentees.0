Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2843C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:37:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B22D21D7F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="gNu7ut0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B22D21D7F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 808B92E119;
	Fri,  6 Nov 2020 19:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4eDNwsWeHO9; Fri,  6 Nov 2020 19:37:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 399E72E11C;
	Fri,  6 Nov 2020 19:37:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C73D5C088B;
	Fri,  6 Nov 2020 19:37:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99272C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8C84B86A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qk-xUDw155c8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:37:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EF53086A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:37:38 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id m13so2500096oih.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 11:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mP1FNfhSXY5n5cuTFQ/M/4yPG4XlmpEFYtLq6GDkKUE=;
 b=gNu7ut0U3clqE69rnhvzIiZ3OwEi3TwtXhAk+ORMHzmp+mUaN//pGv8x5n81jS/WTF
 X1xpRtZ3V4YUrpu+d9nEjd7tGDf2u+THCYyaAScnvt8xQv5fEqMTZpp6Reg1IaPKU55Q
 DEYqXfOdwV6Om8D0YqSAPniZro7lAkm3CZHvTBOxaI/r07dGtacIrkrEgo6HCC2suUys
 lKGsbKn9AZS9oKXN3my1JG+d4UBUwtR6AKHGfw2zsLhIvATpl261KCKxXeuGxoplafZe
 X/JeWyHmYkeDTbWba2gWJdGDABaBSI+pw6MHNDshMDjf2Mj5ez6674PBCXhdwjOtnBeZ
 DL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mP1FNfhSXY5n5cuTFQ/M/4yPG4XlmpEFYtLq6GDkKUE=;
 b=pFCc1EHZ9VoFrhGalJN4yERcyXyp9vGP1/0S9TiUmWx3A3sLT0alwOV6Krtgrt3C1k
 Nu5HXtem3A3DxGrET4iDAgJrrK0Iu6cbxDP6ulv5ZF94BdxTfaTzLNeuqPX25yHadMCZ
 uJsJK9eQuvUCbXrAw+7NscmALq801HHjlXXd2xBXHkJi6n165FDvo6ttX4FxkteL9Y+l
 rXw+wwQ1VgW5Y6T8exVICPp0yI2+jJuSxnGfAAuulwrMC6Uv4zz3pFmRV2A4QVglOgrh
 b7r2jI0CNIJC9GalY44hzspGih9wxqui1uBi2DaHu7LB/i/0cmL9L/6AVDgdWMhs71xa
 MuyQ==
X-Gm-Message-State: AOAM531WdT5F2bPRUlFLna+/u9L7u4sWObjeog8cHXHAmsbf96mKcYBH
 y2/++Ys2nvj1+o6LikKc6MiBLMgCZy8LlOdMnOSWYA==
X-Google-Smtp-Source: ABdhPJydJRE9oDMRNEsREh7ZPKeGFWX+yL0ZSvAAmgnD57EBdmSwWm2xusshWTHj2B1LZFSsf7tK4a9GHtNmM+nIYUQ=
X-Received: by 2002:a54:4812:: with SMTP id j18mr2150352oij.70.1604691458091; 
 Fri, 06 Nov 2020 11:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20201106192154.51514-1-98.arpi@gmail.com>
In-Reply-To: <20201106192154.51514-1-98.arpi@gmail.com>
Date: Fri, 6 Nov 2020 20:37:26 +0100
Message-ID: <CANpmjNNj=ub1TLEOxtjajVsm0Fw9fJnFAZOhiYewiBzVFgFVew@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] kunit: Support for
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 6 Nov 2020 at 20:22, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> Implementation of support for parameterized testing in KUnit.
> This approach requires the creation of a test case using the
> KUNIT_CASE_PARAM macro that accepts a generator function as input.
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides
> a macro to generate common-case generators.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
[...]
>
>  include/kunit/test.h | 36 ++++++++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 46 +++++++++++++++++++++++++++++++-------------
>  2 files changed, 69 insertions(+), 13 deletions(-)

Looks good, thank you!

Others: Please take another look.

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
