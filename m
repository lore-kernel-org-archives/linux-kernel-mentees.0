Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E1DE75450
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Oct 2023 11:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2FC61150;
	Tue,  3 Oct 2023 11:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2FC61150
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=hSVvXxhn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufZeP3ZQg0EY; Tue,  3 Oct 2023 11:40:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B163760AEC;
	Tue,  3 Oct 2023 11:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B163760AEC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9503CC0039;
	Tue,  3 Oct 2023 11:40:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CDBCC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 11:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B24408ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 11:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B24408ED
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=hSVvXxhn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEuUZWwndpm8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 11:40:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B07740382
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 11:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B07740382
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0hVrByY9OZMwSDVH4NovQCWUi18feulbnZSSWENahGo=; b=hSVvXxhnluuBkQzvcowECzcZFw
 tYY0dT4IQ7hyJCFF4qhBYq3cYI2yhXvGfhlBkxAdxO6RWGgStz33lCrIT5N/eWO1+gANcwuxROBhs
 OuBiGuhXxWcToFjgeCs/oUNPU/FCAcnQl2I0lIaiD1L10SqCS7ZjwxZkLMM5E36hGOgSwWJmrkKxF
 39IxjbYKBloEF9hcCDCQuCS7ESqNcx453xtfd1mbehjMkLwXeiNSDgUsd6Oogc0Qej6k7Regmjy9d
 YzHs0ftfUxyqY4Axkr94WYVfciIe4QtfZXRDeA4oRGwapuKy2jVBW+wMZeNgJ6KcJsf4D6v83yFBX
 PmNROhpw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qndkv-00EmKj-A6; Tue, 03 Oct 2023 11:40:01 +0000
Date: Tue, 3 Oct 2023 12:40:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH] pagevec: Add remaining space check before adding folio
 to batch.
Message-ID: <ZRv9kXspdAZ5OamD@casper.infradead.org>
References: <VI1P193MB0752429AFF2B87041B0D9E2799C4A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB0752429AFF2B87041B0D9E2799C4A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Cc: lstoakes@gmail.com, linux-kernel@vger.kernel.org,
 syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 vbabka@suse.cz
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

On Tue, Oct 03, 2023 at 05:18:52PM +0800, Juntong Deng wrote:
> Currently there is no check for remaining space before adding folio to
> batch, which means that folios can still be added via folio_batch_add()
> when the batch is full and cause errors.

No.  This is an ntfs3 error.  It corrupted the stack.  You can't fix
this in pagevec.  Ignore all syzbot treports that involve ntfs3.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
