Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DF1C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 00:44:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DAE22076D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 00:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqO+brb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DAE22076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55C8385546;
	Mon, 31 Aug 2020 00:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azKhGI8q1-Hr; Mon, 31 Aug 2020 00:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10E5285124;
	Mon, 31 Aug 2020 00:44:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFDA7C0052;
	Mon, 31 Aug 2020 00:44:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ABCEC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 00:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7D4AA875A7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 00:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJS+q4lBNclF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 00:44:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF75D87553
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 00:44:11 +0000 (UTC)
Received: from X1 (unknown [65.49.58.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F10C9207BB;
 Mon, 31 Aug 2020 00:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598834651;
 bh=6LFPsle47n36rc0FcyNKsEGD+oQ4SDQDYywUFSKldSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FqO+brb/S1ZYZR+ybuH+M8gh/BEZ8/GsluEaod9qSVDzwNgYPGNyU7DDH2mFQJtGk
 1rt59pZPUr/dPHYYhq9IJH9JCvqG/i49ZHYaUV8gikAXPEDtE0GC2ilTIEc2ySqG8J
 bmXa2J5CykCnsfwLD9XSikkCFf2IWpjf+0P9Yy9s=
Date: Sun, 30 Aug 2020 17:44:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mrinal Pandey <mrinalmni@gmail.com>
Message-Id: <20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org>
In-Reply-To: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-spdx@vger.kernel.org, maennich@google.com, linux-kernel@vger.kernel.org,
 re.emese@gmail.com, tglx@linutronix.de,
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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

On Thu, 27 Aug 2020 14:54:05 +0530 Mrinal Pandey <mrinalmni@gmail.com> wrote:

> commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> spdxcheck-test.sh to the repository without the executable flag and license
> information.

The x bit shouldn't matter.

If someone downloads and applies patch-5.9.xz (which is a supported way
of obtaining a kernel) then patch(1) will erase the x bit anyway.

Is some other script invoking spdxcheck-test.sh directly, instead of
using `/bin/sh spdxcheck-test.sh'?  If so, please let's fix that.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
