Return-Path: <SRS0=N8k6=K3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11749C47080
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 15:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A873261396
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 15:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A873261396
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C4EF403F7;
	Tue,  1 Jun 2021 15:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfpWJHccpy0r; Tue,  1 Jun 2021 15:43:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F535403F5;
	Tue,  1 Jun 2021 15:43:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C3BDC000E;
	Tue,  1 Jun 2021 15:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69656C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 15:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C97403F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 15:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Zdhx1WenP7K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 15:43:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0820403F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 15:43:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D52C61396;
 Tue,  1 Jun 2021 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622562207;
 bh=tM/wfsfxndtVhkhHKz1txBAUiL8wNEiq2Ds4vqAjqG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dnU6XhtjlmmmkmHa+XZ1bvZc2DU2Zx+40mD2doJ7PZNuWUmPtb91cL+KeWLg3aetb
 Sd30wI+nbaZHL61qMmjhSSdk/e97xYFySB44BpiroteRByr+IHobvRxdi8hikcKB5F
 qz6Z4fix57DBQIqtuQLMmBIvemy2D0SrHpDRlIpQ=
Date: Tue, 1 Jun 2021 17:43:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kurt Manucredo <fuzzybritches0@gmail.com>
Subject: Re: [PATCH v2] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <YLZVnNNAkAQFvSm8@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com> <12537-32529-curtm@phaethon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12537-32529-curtm@phaethon>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Jun 01, 2021 at 04:33:09PM +0200, Kurt Manucredo wrote:
> Fix shift-out-of-bounds in ___bpf_prog_run().

How is this "fixed"?

> 
> UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> shift exponent 248 is too large for 32-bit type 'unsigned int'

What is this from?

Any reason you didn't cc: the bpf maintainers and developers?


> Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com

Does this pass the syzbot testing?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
