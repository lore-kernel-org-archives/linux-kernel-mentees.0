Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34492C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E4A60B9B;
	Wed, 13 Jul 2022 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E4A60B9B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qi1iy3s0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssQG45mtGvDS; Wed, 13 Jul 2022 18:56:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C2924606CB;
	Wed, 13 Jul 2022 18:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2924606CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95BC1C0035;
	Wed, 13 Jul 2022 18:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEE34C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4C7846A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4C7846A4
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Qi1iy3s0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gdLtFkGe9g1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7273846A0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7273846A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:56:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AFC261DC0;
 Wed, 13 Jul 2022 18:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB5BC34114;
 Wed, 13 Jul 2022 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657738583;
 bh=horUYRJu4L75hyURMcGYdLgNsX8H8mt9BCJYF7S/48o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qi1iy3s0onH95DCrXc3y+rAMM8+C89BtS8wM23W3glvTW0dVAwwuMmxF6+oCoOOme
 tdWl9vW8q580L0iFw08w2S2nLbmkkOBsEqLmU/jb4FEA0HQzASIsw8r3khOsw9zhee
 hPO99h1vtjVhw6toAdcbU2q0mv0fkAAMFLrqdIC/eMy40iOxbENUalbSDPqNp4s65t
 O5DJsCqNQefB8Cmk5NtBv3Odep9Ig4fzaAbEAR0XH9ayG7JOO0Q320NMVQ/MpJguXc
 7SOb0vaqpt6U5JyXX/ZzxYyhn9yUadSWuf1UExVy6Rs5aT9iPnutNoLXqUf2My43xy
 kFxRvvr+Uce6A==
Date: Wed, 13 Jul 2022 11:56:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [RFC PATCH 0/1][RESEND] Fix KASAN: slab-out-of-bounds Read in
 sk_psock_get
Message-ID: <20220713115622.25672f01@kernel.org>
In-Reply-To: <20220713181324.14228-1-khalid.masum.92@gmail.com>
References: <20220713181324.14228-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Pavel Skripkin <paskripkin@gmail.com>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, 14 Jul 2022 00:13:23 +0600 Khalid Masum wrote:
> Using size of sk_psock as the size for kcm_psock_cache size no longer
> reproduces the issue. There might be a better way to solve this issue
> though so I would like to ask for feedback.
> 
> The patch was sent to the wrong mailing list so resending it. Please
> ignore the previous one.

What happened to my other off-list feedback?

I pointed you at another solution which was already being discussed -
does it solve the issue you're fixing?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
