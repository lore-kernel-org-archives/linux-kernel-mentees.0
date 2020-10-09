Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD7EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:24:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBA422284
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QKKuotqi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBA422284
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF90F87743;
	Fri,  9 Oct 2020 18:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSs9DhnBxg0H; Fri,  9 Oct 2020 18:24:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 72234876FE;
	Fri,  9 Oct 2020 18:24:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AD46C016F;
	Fri,  9 Oct 2020 18:24:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65881C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 52DF486D9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCTi6Q_hgsH6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:24:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DFCF886D5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:24:00 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 7so7834946pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ckfiGr79oYe2p0/v/DYMhUsHBr9HCbbVGqkLWqa/LI=;
 b=QKKuotqiCI+FZLbtoeTiS15lDQ8/GdNGdN3x+2itft2BS9nqs2ImG5wWkyxn0YpyYL
 Lz4gppLgxejEU7l09GeoF4PF/yxjzeB4+DB7sI2dMNEejjkhvc8dj6b9ypIcyKjwH/26
 vYqi/ZQtxogyyu7MyE/rFxnAeKw0K5rg/Ds7WiVM7e07GFVSQ1duN1HKPoKfeR26ifmN
 A3Vn3mJ1sCI+bQRpa7Rb7QccppqWRsq/mYc5G1pq0kDM4ywCEmQ3tHM2lsMdvHa0/ZAw
 nuA+udph8X3m+WXk876tp1X+imvzWtWxyR+qTW7RYaqITVwWKaanlKCf+KIIHA2jbuFh
 AzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ckfiGr79oYe2p0/v/DYMhUsHBr9HCbbVGqkLWqa/LI=;
 b=MF9uKY2pFvXmwBStXQFsvi370P2jAqaRw6B2eVLNjE/P9DnlOdTnMEw3cHOvr9zBH6
 saeGHWm5SltUjjp+aolQgMD2MDBW/vE5l7wLJhD5OBNvpDK7aJs2keefTcNQYEZRbepX
 EQ2Vl5lj6zGTCGQXOO+KmujIiidanXwuKn1hx87yeCRHiR8EHBbjmEEpKw/Qo5ACDAtr
 crqWv6CbOYVIzjjfX368DI8U6r0/SofqAA2RPj19XZK0M/DcdGlKgTelW2aqR1gHS5/8
 FM6SYuSmu91ZDZO/hgJV+PaYJvAp0qYDqqLESs6kxpuI3pNpVRRAGOUXt5bynB8wVbL4
 LH+A==
X-Gm-Message-State: AOAM532yu6W41Y997GoFPMgOl2NPmBkeu1FVqde7mGPsULHCNU65POwz
 qAJc8muHtGJW8LTtNZAsBEo0t+ivZ5qcjBlEh6opvA==
X-Google-Smtp-Source: ABdhPJywkjlt77zhtOgG5d9ROI2hU+wfAK0UoviB2FMYZkf/TH7yHKeWOXzlVQCNZmXGGkyFQ9PWdMHyzL7NRek8uO4=
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr3304524pgm.159.1602267840243; 
 Fri, 09 Oct 2020 11:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201003144807.13036-1-98.arpi@gmail.com>
In-Reply-To: <20201003144807.13036-1-98.arpi@gmail.com>
Date: Fri, 9 Oct 2020 11:23:49 -0700
Message-ID: <CAFd5g46Pf9=v6Eq01xPPWoyqMh85jf=gSnG=RifwJG+-Y5N4GA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC v3 1/2] kunit: Support for
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

On Sat, Oct 3, 2020 at 7:50 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
[...]
> @@ -254,7 +274,14 @@ static void kunit_run_case_internal(struct kunit *test,
>                 }
>         }
>
> -       test_case->run_case(test);
> +       if (!test->parameterized)
> +               test_case->run_case(test);
> +       else {

Sorry, I just caught this. When you put either the if or else block in
braces; the other should go in braces as well.

> +               int i;
> +
> +               for (i = 0; i < test->max_parameters_count; i++)
> +                       test_case->run_case(test);
> +       }
>  }
>
[...]
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
