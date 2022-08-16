Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B9AC2BB41
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Aug 2022 18:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34609408D2;
	Tue, 16 Aug 2022 18:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34609408D2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=spP9luuy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pejMr0NRbJAi; Tue, 16 Aug 2022 18:21:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F38EF408CC;
	Tue, 16 Aug 2022 18:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38EF408CC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA430C0032;
	Tue, 16 Aug 2022 18:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4768C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 18:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A6860AE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 18:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A6860AE3
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=spP9luuy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1xmndnTBFyN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 18:21:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0956160ADD
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0956160ADD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 18:21:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D09DA61416;
 Tue, 16 Aug 2022 18:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B529C433D6;
 Tue, 16 Aug 2022 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660674109;
 bh=yok4cnVjsxHJqT49gDQ+73c5tXsJfXyLUJssrEQ6TOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=spP9luuyOM6Sxcq99jQsYp0/VI6NpJRjFFEna9Zg8ocuyM/Xf3hl0pWaSvsHA7ZIA
 1sgYxXaxP921kqeV2olFNot2a0JgxK60pFDBOi5oyh9USl/fBI1rc3QC9BH1+OIFbv
 PLRfqgNenDYPTmYocKZsJ/UM+NBwJVPi7UpFynHZNlqMY1sCTlok7SfnuuNL7pp2Rz
 NfHS7lfWXEbSugJE2wz+yJAwqWnE+n61o+OXeqZSCMYG9/DIFK2NpK/VEvrZa3P+72
 Uk9D8qPobIdwXW+zG4eIERME2KYRnPCUZH9m1//NHizzca9XzEY3t/1Vj0X/IzBr2e
 vDwZJLfepOF2Q==
Date: Tue, 16 Aug 2022 11:21:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
Message-ID: <20220816112147.3aa8d35b@kernel.org>
In-Reply-To: <20220816103452.479281-1-yin31149@gmail.com>
References: <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
 <20220816103452.479281-1-yin31149@gmail.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, dhowells@redhat.com,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
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

On Tue, 16 Aug 2022 18:34:52 +0800 Hawkins Jiawei wrote:
> +__rcu_dereference_sk_user_data_with_flags_check(const struct sock *sk,

This name is insanely long now.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
