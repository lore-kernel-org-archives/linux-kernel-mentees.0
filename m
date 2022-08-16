Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C645DC25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Aug 2022 21:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 401404013D;
	Tue, 16 Aug 2022 21:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 401404013D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUJh7eP6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2SBaaNTU9tI; Tue, 16 Aug 2022 21:16:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5C67A4013B;
	Tue, 16 Aug 2022 21:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C67A4013B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 356D8C0033;
	Tue, 16 Aug 2022 21:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 898EBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F42D8145C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 21:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F42D8145C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUJh7eP6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LfqJaN_SgCn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 21:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A805826EA
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A805826EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660684615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iqj6YUSsuItIPg1WhM2vpcdPov5sWXfn7fAfkdN2WE=;
 b=RUJh7eP6j/onI0Xo/Cguwzs1BGRrrjoi3VZOJIrpzuTfVm3jkz+G+zRda6uXdGgldaIyro
 EiSwdGSCYzY6FxLt3dWHNj+O+u1wAHmDLveSAbZtFHWCMlJ82LZemCpUPJKUo7Kq1fhpgu
 T0aVm/a5+Na1XJZrO1Vlog2xIsVVVQw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-60_09m4xMDqeYoZnVse8mQ-1; Tue, 16 Aug 2022 17:16:50 -0400
X-MC-Unique: 60_09m4xMDqeYoZnVse8mQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A80E61C13945;
 Tue, 16 Aug 2022 21:16:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B088518ECC;
 Tue, 16 Aug 2022 21:16:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220816103452.479281-1-yin31149@gmail.com>
References: <20220816103452.479281-1-yin31149@gmail.com>
 <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
MIME-Version: 1.0
Content-ID: <804152.1660684606.1@warthog.procyon.org.uk>
Date: Tue, 16 Aug 2022 22:16:46 +0100
Message-ID: <804153.1660684606@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, dhowells@redhat.com,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
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

Hawkins Jiawei <yin31149@gmail.com> wrote:

> +__rcu_dereference_sk_user_data_with_flags_check(const struct sock *sk,
> +						uintptr_t flags, bool condition)

That doesn't work.  RCU_LOCKDEP_WARN() relies on anything passing on a
condition down to it to be a macro so that it can vanish the 'condition'
argument without causing an undefined symbol for 'lockdep_is_held' if lockdep
is disabled:

x86_64-linux-gnu-ld: kernel/bpf/reuseport_array.o: in function `bpf_sk_reuseport_detach':
/data/fs/linux-fs/build3/../kernel/bpf/reuseport_array.c:28: undefined reference to `lockdep_is_held'

So either __rcu_dereference_sk_user_data_with_flags_check() has to be a macro,
or we need to go with something like the first version of my patch where I
don't pass the condition through.  Do you have a preference?

David

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
