Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AAFC77B76
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Apr 2023 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EB02408A6;
	Tue, 18 Apr 2023 21:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB02408A6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=TDvWQVGe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAR1kLG8QEV1; Tue, 18 Apr 2023 21:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4720D40580;
	Tue, 18 Apr 2023 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4720D40580
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22B84C007A;
	Tue, 18 Apr 2023 21:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5CFEC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 21:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE18F60B8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 21:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE18F60B8A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg
 header.b=TDvWQVGe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQp2LrHBIoVg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 21:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7AA60B60
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D7AA60B60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 21:28:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0198A6395E;
 Tue, 18 Apr 2023 21:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234BDC433EF;
 Tue, 18 Apr 2023 21:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1681853324;
 bh=2SNZxN9hzt7Hcn612PhEVKLrSU4yAg5SPreBYxtfaP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TDvWQVGeqhj3/mWi/MRa3z2d2YtdyfUdrfzN4bDApR8Tccgr04pUJspvHZgMWe2sH
 KAVTt5BWR0pdykBB6joWO8tyUNmSIdqamNfJ5Hu2MwsWjSat5dIAPM4t4AitEminqe
 RzukRKpSuFilmu6UtJ5QUqZB4vOQeLzDzp70LC/8=
Date: Tue, 18 Apr 2023 14:28:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
Message-Id: <20230418142843.4ef62be30f529458344fa0e0@linux-foundation.org>
In-Reply-To: <5dc97e10-8c64-4818-2642-dd8edb21c016@gmail.com>
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
 <20230331013301.ecgkjymaf3ws6rfb@google.com>
 <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
 <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
 <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
 <5dc97e10-8c64-4818-2642-dd8edb21c016@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Yang Shi <shy828301@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Zach O'Keefe <zokeefe@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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

On Mon, 17 Apr 2023 22:28:51 +0400 Ivan Orlov <ivan.orlov0322@gmail.com> wrote:

> Tested today on the latest rc7, the bug still exists.

OK, thanks.  I'll send this patch upstream during the next merge window. 
If you, Zach or someone else decides to remove SCAN_STORE_FAILED and
perhaps those WARN_ON_ONCE()es then we can address these things later.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
