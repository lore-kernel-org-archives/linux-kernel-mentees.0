Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E6C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 15:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4305041BBB;
	Thu,  4 Aug 2022 15:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4305041BBB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L1ovtR14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajbwgwEmF4xv; Thu,  4 Aug 2022 15:29:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0D8C741821;
	Thu,  4 Aug 2022 15:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8C741821
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9132C0032;
	Thu,  4 Aug 2022 15:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23E4FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 15:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B2A81589
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 15:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B2A81589
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=L1ovtR14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALIlQJA1HuiA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 15:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C25281435
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C25281435
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 15:29:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92D3361348;
 Thu,  4 Aug 2022 15:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28F9C433D7;
 Thu,  4 Aug 2022 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659626956;
 bh=yNci9Y78VKSjDPAsOc4SPLROEnwi+kQbPuSYK4F3UDM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L1ovtR14M1yhAHYJR2tiX+//Ol0qAwBZXs+aKGiVhh42t9aKijrKfqDdUyHwGh+7E
 Ej8zdKT4mnd64nr+T1x7TKCl8zz34d/TSv8ZOzXoaftIur7o2Huj7lMFwQNecE1+CP
 WgmgcVSi/xHNIFD4nPGWgz2mvpA6PWSIEU+KtMhMjOoC00XxC+TCP30PV8/jz4cvCR
 Hn1JHvTHfZjnAh0JXxNIcfOVv4GOv41ep9cFZzP7wr30fNvyObKh7aoo8JydHUQLDY
 e4B7NfOxeOAa2URYuB8IqxL5k7cLSIFij8l4huhH5GhR21hD6m7DDeacNULdP1z56J
 6MtoizmCfOsnw==
Date: Thu, 4 Aug 2022 08:29:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH v4] net: fix refcount bug in sk_psock_get (2)
Message-ID: <20220804082913.5dac303c@kernel.org>
In-Reply-To: <20220804030514.7118-1-yin31149@gmail.com>
References: <20220803153706.oo47lv3kvkpb7yem@kafai-mbp.dhcp.thefacebook.com>
 <20220804030514.7118-1-yin31149@gmail.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, kafai@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, davem@davemloft.net
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

On Thu,  4 Aug 2022 11:05:15 +0800 Hawkins Jiawei wrote:
> I wonder if it is proper to gather these together in a patchset, for
> they are all about flags in sk_user_data, maybe:
> 
> [PATCH v5 0/2] net: enhancement to flags in sk_user_data field
> 	- introduce the patchset
> 
> [PATCH v5 1/2] net: clean up code for flags in sk_user_data field
> 	- refactor the things in include/linux/skmsg.h and
> include/net/sock.h
> 	- refactor the flags's usage by other code, such as
> net/core/skmsg.c and kernel/bpf/reuseport_array.c
> 
> [PATCH v5 2/2] net: fix refcount bug in sk_psock_get (2)
> 	- add SK_USER_DATA_PSOCK flag in sk_user_data field

Usually the fix comes first, because it needs to be backported to
stable, and we don't want to have to pull extra commits into stable
and risk regressions in code which was not directly involved in the bug.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
