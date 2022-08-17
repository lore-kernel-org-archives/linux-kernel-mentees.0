Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC9C32772
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 23:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8881883E81;
	Wed, 17 Aug 2022 23:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8881883E81
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKqzDfLd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXCFxKXs9LNZ; Wed, 17 Aug 2022 23:42:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7D42083E08;
	Wed, 17 Aug 2022 23:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D42083E08
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B56AC0033;
	Wed, 17 Aug 2022 23:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CACFC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 23:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70DF761023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 23:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DF761023
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=bKqzDfLd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2rsQK98SCN2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 23:42:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E896101E
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29E896101E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 23:42:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1ED26B81DEB;
 Wed, 17 Aug 2022 23:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3A8C433D6;
 Wed, 17 Aug 2022 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660779730;
 bh=90a0gHd140Crru58gwz91c0iI4UzcfwU6EDuHdNf2Mc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKqzDfLdSmpjAPt1fgcvYgH9DmrNEP84Fa4J4OmzTzbSQ3xi+N30wqlhxxB8F/DsU
 67waHblV+XrGuh4SPKBgvy+kHI3rK97tZ6AaFE0DBIzZgJAnIEbDELwggfu7+sx00N
 7MyWl+NacEKVkMCvr1syY0zMGfcsmLNHc8ETKXrFz+ZBeyLTzXF1bkWLpuqlhJNzKV
 lOSyh56WbqUEH0AG/Yq/gxjEz/erUXZGTr4zGs56oeWqcx1mZiw7Pp4U629N2aAYcX
 ReOxkkYj9J6SN9NJFsatUEf73nWVVDQMDhdmQxzkBKkdPclgQJ/E4dUHKSvVtZLf0t
 HDctf4J7QsLEA==
Date: Wed, 17 Aug 2022 16:42:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
Message-ID: <20220817164209.72c182fb@kernel.org>
In-Reply-To: <3974013.1660769749@warthog.procyon.org.uk>
References: <20220816164435.0558ef94@kernel.org>
 <20220816103452.479281-1-yin31149@gmail.com>
 <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
 <804153.1660684606@warthog.procyon.org.uk>
 <3974013.1660769749@warthog.procyon.org.uk>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-kernel@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
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

On Wed, 17 Aug 2022 21:55:49 +0100 David Howells wrote:
> Jakub Kicinski <kuba@kernel.org> wrote:
> 
> > I like your version because it documents what the lock protecting this
> > field is. 
> > 
> > In fact should we also add && sock_owned_by_user(). Martin, WDYT? Would
> > that work for reuseport? Jakub S is fixing l2tp to hold the socket lock
> > while setting this field, yet most places take the callback lock...  
> 
> So how do you want to proceed?  My first version of the patch with
> sock_owned_by_user()?

Sorry about the lack of clarity. I was sort of expecting the name 
to still be shortened, but what you have is probably good enough.

Applying v1, then, thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
