Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409FFC25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 01:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D051982983;
	Wed, 17 Aug 2022 01:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D051982983
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EEknQiKr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxJbeF9vH-qd; Wed, 17 Aug 2022 01:39:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E7F5782542;
	Wed, 17 Aug 2022 01:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F5782542
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDD97C0033;
	Wed, 17 Aug 2022 01:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BC0AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 01:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 665BF40136
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 01:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 665BF40136
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=EEknQiKr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99jbguu6XRQv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 01:39:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB60940117
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB60940117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 01:39:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB3E561178;
 Wed, 17 Aug 2022 01:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E42C433D6;
 Wed, 17 Aug 2022 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660700372;
 bh=WNI4T2l1xlFYKRJlgSA2O9Bc98a5ZBHH6E/B6tCD50A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EEknQiKrl/fuhzX2gYjfHuS2LhzKcvaeq3V/YtQcZVtcI78dfH+0IsdjveRIYTLHh
 1grv26DVJhODDyf1ecCVDxMbjo1sSJ4DqiS37XphKS80Gl4NvqNQhdrIPoDTnt3Abz
 QmkJq5ksZu/qUhsA29utPhTN2t2Qz3uH2BuTQSYGUxF52YZT8KVZcInAT4lYyTZO+Y
 lDx+luMTE+zYuCCY/I1QGnAM3LhLa04WQaCJCog9XRcyZgpzcM340le5rc3eHddq+y
 mP8yQCYrjv4h0HShV9WvfJ8uR2lQaw0H292s6ns2Y3uuqlSs4UD0nXtewuds+18bpf
 VHHXp+xAm2gfQ==
Date: Tue, 16 Aug 2022 18:39:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Martin KaFai Lau <kafai@fb.com>
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
Message-ID: <20220816183930.2328d46d@kernel.org>
In-Reply-To: <20220817004319.fd7dekpqeumbvmsh@kafai-mbp>
References: <20220816103452.479281-1-yin31149@gmail.com>
 <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
 <804153.1660684606@warthog.procyon.org.uk>
 <20220816164435.0558ef94@kernel.org>
 <20220817004319.fd7dekpqeumbvmsh@kafai-mbp>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, David Howells <dhowells@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Hawkins Jiawei <yin31149@gmail.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, 16 Aug 2022 17:43:19 -0700 Martin KaFai Lau wrote:
> > I like your version because it documents what the lock protecting this
> > field is.
> > 
> > In fact should we also add && sock_owned_by_user(). Martin, WDYT? Would
> > that work for reuseport? Jakub S is fixing l2tp to hold the socket lock
> > while setting this field, yet most places take the callback lock...  
>
> It needs to take a closer look at where the lock_sock() has already
> been acquired and also need to consider the lock ordering with reuseport_lock.
> It probably should work but may need a separate patch to discuss those
> considerations ?

Right, the users of the field with a bit allocated protect the writes
with the callback lock, so we can hard code the check against the
callback lock for now and revisit later if needed.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
