Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82874C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 16:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220B260F23
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 16:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 220B260F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27A583474;
	Thu, 29 Jul 2021 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v46b4Mxs8tcy; Thu, 29 Jul 2021 16:52:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 126F283216;
	Thu, 29 Jul 2021 16:52:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1D3BC001A;
	Thu, 29 Jul 2021 16:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3273BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 16:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD5C405C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 16:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJ9JbCifMA9z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 16:52:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D014404F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 16:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1627577560; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BsmWKq+5VCr2FsOe8rEynZpMqKTPxQLhfSREK11YYKMkFq9pj5wkUEmcuwOPynAJswpjVlDMcgXs82u07obaoqUcVpEnlYSqV1IBvP3uPLkbFDETsobI02tkAipushBqVObz10men0AOjCPYp3pwASo09SEWGF6a2gA1OJGsgfk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1627577560;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=CeMIoMGJKi5xWxjzK0BqJB0xLd4uAWj2QZ+Ixq0EaEc=; 
 b=RYULpI+KVCdXpIFdXZPWo3KeB4Ov7g41ch+tB3g3WPDJD4t+/EOM6VMhvO1HYFNz1FsOwnbOa1k+uvccALRP+WXaA5ylGxJINnFfKhomj7qnNcDwHcxwh4zu30rMEqpqqurOu5DhXkM+nEO1UQoA3vPPZco4/X3+Y5esBt/la6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627577560; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=CeMIoMGJKi5xWxjzK0BqJB0xLd4uAWj2QZ+Ixq0EaEc=;
 b=RuShqD9poBj0Om5UXYEtnjIndUCzvUuDnBa0AytduYlMm++/+Py0on5fgfFvaH+w
 jRsy5K36G0nFiD8Ly6yx4gMikuEkBCC7mml+GnVPPqkEHrnwAVz2cBeIERAePZsnpZ7
 +vUFzG9o/MtDhQEBs/RgGANhSKGn2bKqazSwJuyE=
Received: from anirudhrb.com (106.51.105.90 [106.51.105.90]) by mx.zohomail.com
 with SMTPS id 162757755916951.49160872968753;
 Thu, 29 Jul 2021 09:52:39 -0700 (PDT)
Date: Thu, 29 Jul 2021 22:22:33 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v8 0/2] firmware_loader: fix uaf in firmware_fallback_sysfs
Message-ID: <YQLc0UYXSjqbARAJ@anirudhrb.com>
References: <20210728085107.4141-1-mail@anirudhrb.com>
 <YQG/9RPgETxF08Vz@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQG/9RPgETxF08Vz@bombadil.infradead.org>
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org
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

On Wed, Jul 28, 2021 at 01:37:09PM -0700, Luis Chamberlain wrote:
> On Wed, Jul 28, 2021 at 02:21:05PM +0530, Anirudh Rayabharam wrote:
> > This series fixes the use after free in firmware_fallback_sysfs reported by
> > syzbot at: 
> > https://syzkaller.appspot.com/bug?extid=de271708674e2093097b
> 
> Greg,
> 
> With Shua's review ammeded, this series is ready to be queued up, finally.
> 
> Anirudh, thanks for following up on all these iterations!

Thank you for your guidance throughout this series!

	- Anirudh.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
