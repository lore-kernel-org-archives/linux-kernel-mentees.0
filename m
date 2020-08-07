Return-Path: <SRS0=1TFu=BR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434E4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 21:33:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDAA20866
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 21:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="j5fGpkuV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CDAA20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB69888BEF;
	Fri,  7 Aug 2020 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 337ji67G+Gvi; Fri,  7 Aug 2020 21:33:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DC0888AA6;
	Fri,  7 Aug 2020 21:33:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59FCCC013C;
	Fri,  7 Aug 2020 21:33:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B091DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ADB86875A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 21:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1l1sLapkNVx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 21:33:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB9F987568
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 21:33:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l2so2880879wrc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Aug 2020 14:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kb51K/JMx93SnPedI+EIdFTSAF1IqBeo/q6vamdS4A8=;
 b=j5fGpkuVmHIE5Ps7zFBfy2Pdo1F76BJ2oz5uWWb95k6tuAOeu9Lp4hnY+11pqXqX1f
 eW1WZpc91IM6WYWcp4j7Pc0/kUgOqrwv13XpEAuwqgjmvnwoIIzpfOy3OE4k4/KCmI8w
 ra9stYzuUfw82bKAJG8gGxGsX6WJE2a3T138c12Td/HoyQKB2GU84ST0lk/zf/LbdF/d
 IBWP4IIg1oHczrZH/o2MdqLogojr6xaCupKt9SwIPIiPSkUipTJx5ONXLtq+8Og5YlNT
 8S80SBjxPsK8ALFVuDrRJDapxKxuC1Z1yAZquhI6AWArhrAHO3gS9bAYqZpoMK3/hxu6
 mVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kb51K/JMx93SnPedI+EIdFTSAF1IqBeo/q6vamdS4A8=;
 b=HKIPJvBWFfgZYAh8/bStcniz8pC/Z/cnxisQMPuuB8qBfpZM1aZcaTE9Zgrh8alWkn
 Th6jTzxzbcZL+1GWjvIWndAsHA4O9XMsdyzUHgERUUNUJ9PXceN/FPJrs3J5fzdGSul8
 0BWVL1GTjKIT6dMIm5cDLNqTp6u1OpQhCpEPF/euxiGMSLsnwavHCQSzAwmupL93dfJY
 c1FrHcNQD760eovX44qhuMWelk1G5tq2S3+bFEX4WqVLE7TPUyA8sSvRA6k9Opu42kDf
 u3xzlu7lEZhs0PkHphiazL1IG4un6nL4YI8mK56R6VTnUwKeGfW0UbaHhFHJpW7qasDS
 2FJQ==
X-Gm-Message-State: AOAM530uKLlvdDobKteSw+ZqXSO5rC3yba8pLnp4Vw05Vz18/2rwt4o1
 ZcpgqgGtPHUeO8c5en9So6CKVXfXA9uKZ8ztRRcJdg==
X-Google-Smtp-Source: ABdhPJxXQmEyH/oQ6CHELZFCo1U1iD2D6vbAatj8wgGfSPKfqffSXXd1hCvHhnXMVMh8U7IDXpV1HbyO9BWtNAzpZjA=
X-Received: by 2002:adf:f511:: with SMTP id q17mr9909904wro.414.1596836001220; 
 Fri, 07 Aug 2020 14:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200806094440.14962-1-98.arpi@gmail.com>
 <CAHp75Vdpyr=LiOsjgoJ1YscrvFwivtfg58dePtF9aQDYp6V9-A@mail.gmail.com>
In-Reply-To: <CAHp75Vdpyr=LiOsjgoJ1YscrvFwivtfg58dePtF9aQDYp6V9-A@mail.gmail.com>
Date: Sat, 8 Aug 2020 05:33:09 +0800
Message-ID: <CABVgOSmXFZL+uxKY9yAn9JVzChZxQDsucSQGAGBxM6OpOkCwJg@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_hexdump.c to
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Aug 6, 2020 at 5:53 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Aug 6, 2020 at 12:48 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >
> > Converts test lib/test_hexdump.c to KUnit.
> > More information about KUnit can be found at
> > https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> > KUnit provides a common framework for unit tests in the kernel.
>
> > -config TEST_HEXDUMP
> > -       tristate "Test functions located in the hexdump module at runtime"
>
> We have a nice collection of tests starting with TEST_ in the
> configuration, now it's gone.
> I'm strongly against this change.
> Code itself okay, but without addressing above - NAK.
>

This change is to make the test naming compliant with the proposed
KUnit test naming guidelines:
- https://lore.kernel.org/linux-kselftest/20200702071416.1780522-1-davidgow@google.com/

The hope is that tests built on KUnit will all end up with the same
[x]_KUNIT_TEST config options (which at least preserves the
consistency of the test naming, even if they'll not all sort
together), and should make it easier for people to know that the test
results will be in a common format, and that the test can also be run
using the KUnit tools.

The naming guidelines haven't been upstreamed yet, though, so we'd
definitely appreciate input on that thread if you've got comments more
broadly than for this particular patch. Ultimately, I don't think it
matters too much what we end up using, but having some consistency is
the goal.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
