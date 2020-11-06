Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCD8C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:37:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121E020735
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VuCd+77R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121E020735
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8055886CA6;
	Fri,  6 Nov 2020 18:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvuGJ4g4AA37; Fri,  6 Nov 2020 18:37:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2C2F86CAB;
	Fri,  6 Nov 2020 18:37:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0EB4C0893;
	Fri,  6 Nov 2020 18:37:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77156C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 58B7986CAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNejbwm-DBct
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9181F86CA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:37:46 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 79so2111903otc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3x8lkL/vF3DeMoPUyqu8hGji+Bqntj3O00ZDR1pSoh8=;
 b=VuCd+77RNfI0hWDR2kG9l/qjtgPXcb8KpunD74WGmWoVW0/r65kNFz4QDHzaXhI3yb
 LGhkeJAgJT8WUx4Vg532YPdWRe7+5IpVXBlvYohFn+XwHZEsT0lLml+fdr6hVXJLXTRU
 b2/ioDdlSvibYc2ggcjP5NIY1lQwVs4ZTpx9YAw0UAArapXqkRBSt7Tdq8OzaNlo0uCy
 ZPqbf8Iz3bOdU7Q3NfXphQIBsZJ97JkdelZs9GZ0JrbQmExwK8sRhghJnsXNvX8nzFdt
 SBb4LYPYB6SYjwQ2kg542mO/1x7fsDWm8bd6/MYtQGSSk5lMy960clq5z2VnR5HCt1EJ
 MTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3x8lkL/vF3DeMoPUyqu8hGji+Bqntj3O00ZDR1pSoh8=;
 b=dfKuBC4GlYVP24ZutMJ/SdtC8tyolQ0XLBXSgV5XowZ6C4fUTIY3y2aqo2amRvGu+7
 JcCXEAhqBdAvDFaugYAO350N2luUV/zd7iV6HAK2+xwkg9X2ztpIvdxPMopEK/tg+tBu
 ETTmhXWxE8ig+rXnZIEtAO1Un1ntcLmTwJ/Xk0vlfOYZusz58OfzFm77hDwyX+RmcHRK
 UYi0dp0ggK0pd0KToDgAPTAi70djFccQlxxxUttg7FakNlr+NwKKbqp+2IGsd9UgyX/Y
 /cBvYwOHmaZAf5GLx3Qe6tUs7rzs7eBQh/DWPiUvj9QwGhVNtjYij4OObBwhHntwaIbf
 hrCw==
X-Gm-Message-State: AOAM533gwkGi8Y7sQktbap67AapsO8CrOfZd8lvlltoLO4Umrxubfrbt
 W/ms1/EySdCMmKgedWwtC4yolpVGSvgN0lGn/uVUKQ==
X-Google-Smtp-Source: ABdhPJxkC9aWUWZPl7ZvvP579HKk4Zam6Q8tQyPSRMBu3yFJ0dlRugCsCtjDptsvn5pFUSicllmPJ91315N/2DnrAcU=
X-Received: by 2002:a9d:649:: with SMTP id 67mr2055700otn.233.1604687865602;
 Fri, 06 Nov 2020 10:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20201106182657.30492-1-98.arpi@gmail.com>
In-Reply-To: <20201106182657.30492-1-98.arpi@gmail.com>
Date: Fri, 6 Nov 2020 19:37:34 +0100
Message-ID: <CANpmjNNNpuxtMnfsFz4i+699XdyzKZc=dS_G_UavLvZSZgJsnw@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5 1/2] kunit: Support for
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

On Fri, 6 Nov 2020 at 19:28, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
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
>  include/kunit/test.h | 36 ++++++++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 46 +++++++++++++++++++++++++++++++-------------
>  2 files changed, 69 insertions(+), 13 deletions(-)

I think this is ready. Thank you for your patience, and addressing my
comments! I'm obviously fine with v5, but I think my Ack or Review
won't count much because of Co-developed. :-)

Others: Please take another look.

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
