Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4ECC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013A960E97
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 013A960E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9775839E4;
	Mon,  2 Aug 2021 09:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMYxqWMEK22u; Mon,  2 Aug 2021 09:42:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 879C2839A4;
	Mon,  2 Aug 2021 09:42:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 737E5C0010;
	Mon,  2 Aug 2021 09:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D333EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B613260651
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMjJeSn-5K0u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:42:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F34456063D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3DhzGFuBtUG7+9wyciHp3RFxAl1GfNiYwIuvXAzbdNU=; b=j6EewaR+rlidvE+z018zeYkc3h
 yuYWx6iMB6Y/bdKgkoVHmUkprkwR9FdV+0bMIkSoM/ZXB2dVqLgYC/cLiduRiKRZl3Vjso11I42Yk
 YjugvQbduueZqCHOj9K8xZ5TGABNjF96Uo7w16jxEfcUtf3XxznrDFlPZ4P1m0VpLxMIq4CL5cRhM
 h3fVBpZWl5YOm/eolCi1L+jthxWoSgBNnrF8NPmVotQeEcOLvaNQGeR3Gge2IXCRoww5YTvGEPRrf
 EOLUKmpbewr3aPXAxhyt4WAru4MoUX6Imqrg0ahI0uhSdywkBK81AsCDgkzEP6eLFbCfXjmv+0hf5
 srNWFuBw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAUSW-0057lH-N3; Mon, 02 Aug 2021 09:42:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 648FC30027F;
 Mon,  2 Aug 2021 11:42:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 45D862028FBCA; Mon,  2 Aug 2021 11:42:06 +0200 (CEST)
Date: Mon, 2 Aug 2021 11:42:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
Message-ID: <YQe97lDFTmxnR5/b@hirez.programming.kicks-ass.net>
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
 <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
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

On Mon, Aug 02, 2021 at 10:26:16AM +0200, Daniel Vetter wrote:
> On Sat, Jul 31, 2021 at 04:24:56PM +0800, Desmond Cheong Zhi Xi wrote:
> > Hi,
> > 
> > Following a discussion on the patch ("drm: use the lookup lock in
> > drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
> > helpers to make it convenient to compose lockdep checks together.
> > 
> > This series includes the patch that introduces the new lockdep helpers,
> > then utilizes these helpers in drm_is_current_master_locked in the
> > following patch.
> > 
> > v1 -> v2:
> > Patch 2:
> > - Updated the kerneldoc on the lock design of drm_file.master to explain
> > the use of lockdep_assert(). As suggested by Boqun Feng.
> > 
> > Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]
> 
> Can you pls also cc: this to intel-gfx so the local CI there can pick it
> up and verify? Just to check we got it all.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Feel free to take it through the drm tree.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
