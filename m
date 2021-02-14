Return-Path: <SRS0=zhe+=HQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69828C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 12:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF8F64DF2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 12:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF8F64DF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 908B06F52F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 12:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rnb90ydzmXT
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 14 Feb 2021 12:15:17 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 87B1E6F500; Sun, 14 Feb 2021 12:15:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4557C6F500;
	Sun, 14 Feb 2021 12:15:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AD1FC0174;
	Sun, 14 Feb 2021 12:15:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 629F7C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 12:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426976F500
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 12:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw2YwHvybPhp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 12:15:12 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 9D2BB6F522; Sun, 14 Feb 2021 12:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 065AB6F500
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cO4TJQiLzSJvyzQhBBsyceVZexbL8Li+rkU5IQoUjek=; b=quJ48Y+XnK1GYayG0Hgxm3hCkV
 iKMWge/aVkCbxqxWT35slYvdE8xSdW8MMH72RImumL9ouvnVD5ZsvM7upKoRYjcLIbjP0O7oEdMTf
 spLwPXTyqtKgWv48Juzydxkl+rWjnrmVFH3zE5fVnv0cke1PAXZCkqOFyOpi3GnZGiOOpTm+tp44q
 t2FjExjwNt23HOFRs1q/cQFzQZSFuqxYx8QPfleaZdVYuUXI0NjJFiL+SgYp56fjjXmNQFEqu78wO
 4ZxFd+zvwuktqH1NOy3dfDMMYo5gBj7XOzGPNyIsfXc8H2hO9bkHaUVHWjTLYmEO8a0oZJcuKnRfo
 KZHcS01w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lBGIn-00EAjO-GG; Sun, 14 Feb 2021 12:15:01 +0000
Date: Sun, 14 Feb 2021 12:15:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20210214121501.GC2858050@casper.infradead.org>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210213131513.51386-3-dwaipayanray1@gmail.com>
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Sat, Feb 13, 2021 at 06:45:12PM +0530, Dwaipayan Ray wrote:
> +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style

It's quite amusing that this patch contains lines > 80 columns.

Also patches 2 & 3 can be combined into a single patch.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
