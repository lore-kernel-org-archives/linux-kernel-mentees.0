Return-Path: <SRS0=L/ns=LR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422A8C49EA4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 07:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6F961076
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 07:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6F961076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A374D400BA;
	Wed, 23 Jun 2021 07:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQ33kbBHyxr2; Wed, 23 Jun 2021 07:26:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B433B400CF;
	Wed, 23 Jun 2021 07:26:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C092C0010;
	Wed, 23 Jun 2021 07:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 665BFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D7FA82BBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooKDqAzeFE3n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:26:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AF1D82BA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1624433195; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QjXi9Z744O4gVA2dBuKeemIS9umnEE/rKC2RPbp7t4usshO8nBKY1MIkT0TofK6/dbOrb++xRQghvWiW8iSH7aCOH3Eg2lqcrExGNb4nyMig1WqapEBsNLJvsjnRlGqzGrCJEl4mwDN0Bo+fWyrDgxQ7uD98bi03MhHP6cXZ7EA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624433195;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=gw/vXIkX0vz1a4zhZIygnhHXrFnG7MN5D4ERSVv0ZRU=; 
 b=WwDF92utG6F7WAr3LPCAEBjZhqyz26gi7Ada3JSZZKAUlbhC0YAjArTD22v50mhWSd5FhAwXRFgcqjIzuF7gOK90e9z7Hqvjf4jgVdT6qDKHpZ8ZusiQQznCxcSto2cP2+moio8U0cEVgTUYcD/ReZH5wHMkcytzKjKx++FZ/qs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624433195; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=gw/vXIkX0vz1a4zhZIygnhHXrFnG7MN5D4ERSVv0ZRU=;
 b=Uy1yxaRMSrOj/+oFOcmxgL+3E/juQW3WfPGsLOGznVB7saneg0wrPedyFgwtx/Yc
 b9cNz0SmxgitgcpBPIbeERZxNy9aIsbO8xVpkhQLOZPyUuFtC5vqJaVp0Mi3PKoGsPG
 nEg1Fj9a98x3pNMpgrMxGAFrxroEjub1Efa7WWuU=
Received: from anirudhrb.com (49.207.62.88 [49.207.62.88]) by mx.zohomail.com
 with SMTPS id 1624433190736196.19138414928034;
 Wed, 23 Jun 2021 00:26:30 -0700 (PDT)
Date: Wed, 23 Jun 2021 12:56:20 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] mac80211_hwsim: correctly handle zero length frames
Message-ID: <YNLiHJuD3GuDgbKR@anirudhrb.com>
References: <20210610161916.9307-1-mail@anirudhrb.com>
 <a3589e399e179b389e90df36acb67ae1ec7dea97.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3589e399e179b389e90df36acb67ae1ec7dea97.camel@sipsolutions.net>
X-ZohoMailClient: External
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+b2645b5bf1512b81fa22@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
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

On Fri, Jun 18, 2021 at 11:36:16AM +0200, Johannes Berg wrote:
> On Thu, 2021-06-10 at 21:49 +0530, Anirudh Rayabharam wrote:
> > syzbot, using KMSAN, has reported an uninit-value access in
> > hwsim_cloned_frame_received_nl(). This is happening because frame_data_len
> > is 0. The code doesn't detect this case and blindly tries to read the
> > frame's header.
> > 
> > Fix this by bailing out in case frame_data_len is 0.
> 
> This really seems quite pointless - you should bail out if the frame is
> too short for what we need to do, not just when it's 0.

That makes sense. Do you happen to know what the min length of a valid
frame is? There doesn't seem to be constant defined for that already.

	- Anirudh

> 
> johannes
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
