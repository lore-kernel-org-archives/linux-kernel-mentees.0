Return-Path: <SRS0=8Gt8=LL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2B0C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373EF6112D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 373EF6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC7154067E;
	Thu, 17 Jun 2021 15:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7pU6QBjkjSq; Thu, 17 Jun 2021 15:28:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2B73E40684;
	Thu, 17 Jun 2021 15:28:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04A4AC000E;
	Thu, 17 Jun 2021 15:28:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F154AC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 15:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D725441637
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 15:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bxcw4cgiScTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 15:28:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A834941615
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PbwGL8bUjpxYyR+0WdEYqqiUEuC45HxDaoltM49QXvE=; b=sLJ65hxSTVZnExEtD7X5O31nHy
 mSv3dwFtB4qX5QQAtpcN22wofXoNPi/gqbGN3t+/h27T56amfUa7c/Of8T/kqJZWy56GFoEk20nOC
 /GhdwR/qIZMwyIZ6YJQs5UPLUL/pBKR0UHbLxYzaYu7Lg4zvdJo28Crs1NvL66xYxv3LxcZaXaOS/
 qOY5oFzn4diY1r5wam6CQgd1mPxszPTx5vW7joIP55WfuM17haOFZ98mpEgCTXaEPW2rdV2WJTwI4
 xP900Iq2zL0r6wKNClUtISYRV3wiuDkzjqDBV1RV59URj0GJgjg/ZGUTvaL25yeH+U4nXEkNuAMEg
 iKNubhCg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lttvr-009HTX-EK; Thu, 17 Jun 2021 15:27:52 +0000
Date: Thu, 17 Jun 2021 16:27:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] block: break circular locks in blk_request_module
Message-ID: <YMtp957WK8sO4hwL@infradead.org>
References: <20210617092016.522985-1-desmondcheongzx@gmail.com>
 <YMs3O/cg4V7ywlVq@infradead.org>
 <ce1567cf-bc94-790c-cfc0-e4e429e1a86a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce1567cf-bc94-790c-cfc0-e4e429e1a86a@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Jun 17, 2021 at 11:23:36PM +0800, Desmond Cheong Zhi Xi wrote:
> This fix passes the Syzkaller repro test on my local machine and on Syzbot.
> I can prepare a v2 patch for this. May I include you with the
> Co-developed-by: and Signed-off-by: tags? If another tag would be more
> appropriate, or if you want to submit the patch yourself, please let me
> know.

Sounds good to me, thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
