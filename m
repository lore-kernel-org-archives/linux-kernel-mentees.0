Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05E4C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75949415DE;
	Mon, 15 Aug 2022 07:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75949415DE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=EMEpgejq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OilZjWQS3wD; Mon, 15 Aug 2022 07:25:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 51853410BE;
	Mon, 15 Aug 2022 07:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51853410BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BB43C0033;
	Mon, 15 Aug 2022 07:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA20BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82AD7414A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82AD7414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VY9H0PQLEl-6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:25:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A884410BE
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A884410BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660548287; cv=none; d=zohomail.in; s=zohoarc; 
 b=VRmmUHogCbfEV/Z47CYgjlmBymsGM0W+eG+hMXeZrxfmQ7WHdDChY/cSLTQHeZ1Bg+9JpYS2v0BOky/TwnpSKklKxNAkeSLySLFQ72eOR8HSa5fwV26GN65RWzWZhg2byMGAUsd42tU0QmaT48Syt2+xakgns4Su6XRUHrddW3M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660548287;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=rFmN3Fcn03jyf5Yrgmq83ESGhPMfT3i8FmCTj6/USo8=; 
 b=Hysf8rXPv/lic1u7ZDbKAkqAKr2sbyld0Bsjyfd6x02S5zpPOD2WWdz4Sz+OYjSCr/UIjixYmaNHnnp5hLAme9na/S/+6TOneunqpaonoaR143LRe7stk6qzAiCm5yU93ZlH+U1nmY6VVZN0hvcsH0WVYYDfETAPCpVP5mVeAWI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660548287; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rFmN3Fcn03jyf5Yrgmq83ESGhPMfT3i8FmCTj6/USo8=;
 b=EMEpgejqJTujORMBx5/tvo5dKhYkjBqVfkGyDFM0EAjgPenELLPUSXOk7tD1SC3s
 q2r4Uu0l+gUkql+ClhNXkzNNcFu1Jm+h7Lp/5kohAX8/cgPsdSEzEXtSFqTe0CAl4IZ
 WKNyC/0L4tVZ3tRySIeH/BnlIgWBtViFT2VBb8BA=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660548274922861.5813875926336;
 Mon, 15 Aug 2022 12:54:34 +0530 (IST)
Date: Mon, 15 Aug 2022 12:54:34 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <182a063dacf.3f3632f6236592.5537187165122273734@siddh.me>
In-Reply-To: <Yvnu/WT1Z+K36UwW@kroah.com>
References: <20220814151512.9985-1-code@siddh.me> <Yvnu/WT1Z+K36UwW@kroah.com>
Subject: Re: [PATCH] wifi: mac80211: Don't finalize CSA in IBSS mode if
 state is disconnected
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 eric dumazet <edumazet@google.com>, jakub kicinski <kuba@kernel.org>,
 johannes berg <johannes@sipsolutions.net>, paolo abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "david s. miller" <davem@davemloft.net>, syzbot+b6c9fe29aefe68e4ad34
 <syzbot+b6c9fe29aefe68e4ad34@syzkaller.appspotmail.com>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 15 Aug 2022 12:30:13 +0530  Greg KH  wrote:
> Please no blank line before your signed-off-by line or the tools will
> not like it.

Oh okay, noted.

> And did sysbot verify that this change solved the problem?

Syzbot was failing to boot for reasons unrelated to the patch.
I tried testing three times, and every time the boot was failing.
It was taking more than 5 hours for syzbot to pick up the patch
from pending state every time, so I now posted it.

You can look at the syzkaller group page here:
https://groups.google.com/g/syzkaller-bugs/c/bGZwWS4Q3ek/m/dQ3pdAVSAAAJ
(Pardon the atrocious HTML email at the end, I used a mobile app
to email and forgot it doesn't send in plaintext.)

I have locally tested this with the reproducer syzbot gave.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
