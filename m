Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588E5E7C4F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Oct 2023 07:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D98823F6;
	Thu,  5 Oct 2023 07:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D98823F6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m/b50Gsz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bsxx8yk9wFPE; Thu,  5 Oct 2023 07:43:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C37EF823C6;
	Thu,  5 Oct 2023 07:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37EF823C6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0A9BC0039;
	Thu,  5 Oct 2023 07:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03A4FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 07:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D41596F529
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 07:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41596F529
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m/b50Gsz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjCUPhGl0AsS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 07:43:51 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF80160B44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 07:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF80160B44
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-9b2cee55056so121729966b.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Oct 2023 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696491829; x=1697096629;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=434RHBUC25tmTHbc0SxjMGW/nyMWNCPZ1Bst5eTtmeM=;
 b=m/b50GszYUaZDZx1Fh8U72ytkk3W1KdUe9E3OFX2vnRr+C/tk66ZmVkMwNOPbph248
 vUQQ1MtWP1nrjfbnvztUG01jgYhHM5Lth498F40Lj62sSPZecaK4LQrEqatxLkNI+L+j
 uGbZMYmR0eH388oOC761hw0d1yzP67EaahNXApeR4idTj5cBvGxwNlMApCxQyiYrrdDv
 i/UwsbtEHBvuLdgiteUUjx2OUbztWmZ9P4tSAae7U8YacLCt5GMShD9OAfTY4rfVxJYI
 3W4VLA+z3fpLrbGZHmmi5pXqf/TxVmxa52oXqzur3pR49NeaeLKakit/H36/u6Fzs1hg
 AXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696491829; x=1697096629;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=434RHBUC25tmTHbc0SxjMGW/nyMWNCPZ1Bst5eTtmeM=;
 b=MLD/fKxn/c7eQDHYtfE7gV3tskrVy82CGeYFo+yie2tCFVHgwjKu+70SzJWowV2ZSd
 bqYTqK+oTXonnZPvSKigSz0KbzSUg31USTWG7d3Hz3FUoqCzkaDAGAK4bd3v0V5exzE/
 otIbM7DuOniNoWwnG/9VagGiAaK0h8iiD46t6jfCqt3I4HJo3adUQ/LkEJ5w9L1i1M41
 1d848Ybn0MRxFGTcBlm0CD4Q5AY7YO7KkLoPAotT6rDb+ftgboqdXShs8mDA2iVoulcc
 mdvrXYzVaV5sValCUUXn0r1gKdHIzRKLfR7FFqq3oToKZxiHLcEMpJjQ5w0ZXa/AAQcD
 f7SA==
X-Gm-Message-State: AOJu0Yylz/AI4ctDy2r4MO20RTAw+yoLxBSi+qraiZzAZ4bs1LsCbLy2
 X8M4EhsFKzBu9UukNJXjJ4M=
X-Google-Smtp-Source: AGHT+IFvDmJPhDO8Jx+ZQXEtd1a2eMdmo4I9tmenB4y4AIYQ55Kkp0YyeiGHG29nPu9RkmJ6ihEApg==
X-Received: by 2002:a17:906:253:b0:9b8:9b4f:1cc2 with SMTP id
 19-20020a170906025300b009b89b4f1cc2mr3632778ejl.43.1696491828442; 
 Thu, 05 Oct 2023 00:43:48 -0700 (PDT)
Received: from akanner-r14. ([62.4.56.169]) by smtp.gmail.com with ESMTPSA id
 j16-20020a170906051000b0099bcf1c07c6sm714925eja.138.2023.10.05.00.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 00:43:47 -0700 (PDT)
Message-ID: <651e6933.170a0220.f6f76.1a12@mx.google.com>
X-Google-Original-Message-ID: <ZR5nSFVu9XhIHjit@akanner-r14.>
Date: Thu, 5 Oct 2023 10:35:56 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v2] net/xdp: fix zero-size allocation warning in
 xskq_create()
References: <20231002222939.1519-1-andrew.kanner@gmail.com>
 <2f5abbf8-8d50-3deb-19cd-9bfd654e1ceb@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f5abbf8-8d50-3deb-19cd-9bfd654e1ceb@iogearbox.net>
Cc: xuanzhuo@linux.alibaba.com, maciej.fijalkowski@intel.com, hawk@kernel.org,
 netdev@vger.kernel.org, john.fastabend@gmail.com, bjorn@kernel.org,
 ast@kernel.org, aleksander.lobakin@intel.com, edumazet@google.com,
 linux-kernel@vger.kernel.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 magnus.karlsson@intel.com,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
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

On Thu, Oct 05, 2023 at 12:49:23AM +0200, Daniel Borkmann wrote:
[...]
> > 
> > Reported-and-tested-by: syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/000000000000c84b4705fb31741e@google.com/T/
> > Link: https://syzkaller.appspot.com/bug?extid=fae676d3cf469331fc89
> > Fixes: 9f78bf330a66 ("xsk: support use vaddr as ring")
> > Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
> 
> I guess also:
> 
> Reported-by: syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com
> 
> Moreover, this fix is needed in bpf/net tree (as opposed to *-next tree), right?
>

Seems, so - I will check.

> >   net/xdp/xsk_queue.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
> > index f8905400ee07..b03d1bfb6978 100644
> > --- a/net/xdp/xsk_queue.c
> > +++ b/net/xdp/xsk_queue.c
> > @@ -34,6 +34,9 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
> >   	q->ring_mask = nentries - 1;
> >   	size = xskq_get_ring_size(q, umem_queue);
> > +	if (unlikely(size == SIZE_MAX))
> > +		return NULL;
> 
> Doesn't this leak q here ?
> 
> >   	size = PAGE_ALIGN(size);
> >   	q->ring = vmalloc_user(size);
> > 
> 

It is.
Thanks, Daniel, I will fix it in v3. 

pw-bot: cr

--
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
