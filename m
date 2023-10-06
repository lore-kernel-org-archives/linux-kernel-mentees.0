Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A9E94139
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 23:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7964E60C1A;
	Fri,  6 Oct 2023 23:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7964E60C1A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bRp8bZaQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCTZYYBUZZ3P; Fri,  6 Oct 2023 23:58:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2048D60AF6;
	Fri,  6 Oct 2023 23:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2048D60AF6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBCC5C0071;
	Fri,  6 Oct 2023 23:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5167EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2716A60B0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2716A60B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpoIi_yLGXxc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:58:34 +0000 (UTC)
Received: from out-200.mta1.migadu.com (out-200.mta1.migadu.com
 [95.215.58.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF1D560AF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF1D560AF6
Message-ID: <eb61966f-8666-80f6-1eab-c89bffe496b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1696636709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDT9aDLVsvLOYEEw3RfZqvCDnW1m/iupVkMyeiBZkag=;
 b=bRp8bZaQOTZ0RK9xi0lir38QHE8v8QBKgJcvmeoeYaNR/IEA1nPc6gk1SCWnOrW3geE8q5
 SFeTWujgrha+ovCuE032fSZ5wTFtw5twahhoma/m66jMNpq33ud9K9jtJClu9970B1GWn+
 XA3wZYQCtHyiI655HDSBavI2iGp6Mfg=
Date: Fri, 6 Oct 2023 16:58:18 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>
References: <20231005193548.515-1-andrew.kanner@gmail.com>
 <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
 <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
 <57c35480-983d-2056-1d72-f6e555069b83@linux.dev>
 <6520971d.a70a0220.758e3.8cf7@mx.google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <6520971d.a70a0220.758e3.8cf7@mx.google.com>
X-Migadu-Flow: FLOW_OUT
Cc: xuanzhuo@linux.alibaba.com, daniel@iogearbox.net,
 maciej.fijalkowski@intel.com, hawk@kernel.org, edumazet@google.com,
 aleksander.lobakin@intel.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com, bjorn@kernel.org,
 ast@kernel.org, jonathan.lemon@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com,
 magnus.karlsson@intel.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/6/23 4:24 PM, Andrew Kanner wrote:
>> Thanks for the explanation, so iiuc it means it will overflow the
>> struct_size() first because of the is_power_of_2(nentries) requirement?
>> Could you help adding some comment to explain? Thanks.
>>
> The overflow happens because there's no upper limit for nentries
> (userspace input). Let me add more context, e.g. from net/xdp/xsk.c:
> 
> static int xsk_setsockopt(struct socket *sock, int level, int optname,
>                            sockptr_t optval, unsigned int optlen)
> {
> [...]
>                  if (copy_from_sockptr(&entries, optval, sizeof(entries)))
>                          return -EFAULT;
> [...]
>                  err = xsk_init_queue(entries, q, false);
> [...]
> }
> 
> 'entries' is passed to xsk_init_queue() and there're 2 checks: for 0
> and is_power_of_2() only, no upper bound check:
> 
> static int xsk_init_queue(u32 entries, struct xsk_queue **queue,
>                            bool umem_queue)
> {
>          struct xsk_queue *q;
> 
>          if (entries == 0 || *queue || !is_power_of_2(entries))
>                  return -EINVAL;
> 
>          q = xskq_create(entries, umem_queue);
>          if (!q)
>                  return -ENOMEM;
> [...]
> }
> 
> The 'entries' value is next passed to struct_size() in
> net/xdp/xsk_queue.c. If it's large enough - SIZE_MAX will be returned.

All make sense. I was mostly asking to add a comment at the "if (unlikely(size 
== SIZE_MAX)" check to explain this details on why checking SIZE_MAX is enough.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
