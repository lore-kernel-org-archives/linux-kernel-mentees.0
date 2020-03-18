Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F2DC2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:55:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1305206EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BQEzJ+Wu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1305206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C09C386C2B;
	Wed, 18 Mar 2020 01:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kJXgaUpsGtE; Wed, 18 Mar 2020 01:55:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E81A84CF4;
	Wed, 18 Mar 2020 01:55:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51B7CC1D74;
	Wed, 18 Mar 2020 01:55:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47A36C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 41771883D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5TAl+OGuFJQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D210587829
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JwLP7T2Nhv4IJwKxJdaOS6yxMziogPu3arJamEutxXI=; b=BQEzJ+Wu/XmWCwzSHixx3ZIcVn
 JdXC+tlSiy6LpzLZ+yt9xFfFvISYeZCKpV1yeKHF5ToKFikzcgE9JSktHR2e8FLwEDGjOe3o6lYrM
 flGwN/8ks5BalXbuE+Pi/5gZTQoAl//eEY4d4XLdJ8oAdjHyiCYiyb+awZzSTlGtFWAd+twlE0Ff5
 +lWNdVDgtr67tnrVW5cn+LGca28J1JafhltusCQzOJdZ7EdvQfmRMRkncVrsVGkqE6L31pgm8OxN4
 NeJvH163C2ng8IW/qsffC7gn3Db2bSt74V/yTfiSGnfTpx65p8Kp+LhHmF4UzWcPTunzADgqFKwMk
 FJMYhBzw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jENvS-0004lI-9Q; Wed, 18 Mar 2020 01:55:18 +0000
Date: Tue, 17 Mar 2020 18:55:18 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200318015518.GF22433@bombadil.infradead.org>
References: <cover.1584494902.git.vitor@massaru.org>
 <f75ffec5b2d1a2e3f6ba9151732fb37cc2bed040.1584494902.git.vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f75ffec5b2d1a2e3f6ba9151732fb37cc2bed040.1584494902.git.vitor@massaru.org>
Cc: , To-header@osuosl.org, no@osuosl.org, on@osuosl.org,
 linux-kernel@vger.kernel.org, "input <"@osuosl.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] xarray: Add identifier names
 for function definition arguments
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

On Tue, Mar 17, 2020 at 10:43:02PM -0300, Vitor Massaru Iha wrote:
> Fix several checkpatch warnings such as:
> 
> WARNING: function definition argument 'struct xarray *' should also have an identifier name
> +void *xa_load(struct xarray *, unsigned long index);

Checkpatch is wrong.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
