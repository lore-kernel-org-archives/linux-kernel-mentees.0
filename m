Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96C4C28D13
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 08:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F69640309;
	Mon, 22 Aug 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F69640309
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G0Bsx/Pe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2adjf0wA_Af; Mon, 22 Aug 2022 08:48:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 326C740345;
	Mon, 22 Aug 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 326C740345
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08709C0032;
	Mon, 22 Aug 2022 08:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDEFC0035
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E572F81CA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E572F81CA5
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=G0Bsx/Pe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qgklSBTaXCf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0420881C18
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0420881C18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661158101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hf0005VbFoqadMHqE2/k8IMSgs4M7ELH98Ps6ciAPSE=;
 b=G0Bsx/PeugOuSsWTIYWimTgroy7E9RtIsr8ARDadyY0hEEJcVk3XlBvZYmAL07PT6hLH+q
 Cl8eKlnIeMvUyWgu4+NNzlyIFMN64SpnZ5IoYG12UC6XopYGXTUBIiuZSjXgVnTDYpuABE
 cjpdPscmb8Wr6A1m4eAV2TBGn3o/6XY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-Yeqpuf_3Ngep_gSMOePBeA-1; Mon, 22 Aug 2022 04:48:17 -0400
X-MC-Unique: Yeqpuf_3Ngep_gSMOePBeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46FF28037AF;
 Mon, 22 Aug 2022 08:48:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530E74010D2A;
 Mon, 22 Aug 2022 08:48:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220821125751.4185-1-yin31149@gmail.com>
References: <20220821125751.4185-1-yin31149@gmail.com>
 <000000000000ce327f05d537ebf7@google.com>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
MIME-Version: 1.0
Content-ID: <924817.1661158094.1@warthog.procyon.org.uk>
Date: Mon, 22 Aug 2022 09:48:14 +0100
Message-ID: <924818.1661158094@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 Eric Dumazet <edumazet@google.com>, paskripkin@gmail.com,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, "David S.
 Miller" <davem@davemloft.net>
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

> -		if (mutex_lock_interruptible(&call->user_mutex) < 0)
> +		if (mutex_lock_interruptible(&call->user_mutex) < 0) {
> +			mutex_lock(&call->user_mutex);

Yeah, as Khalid points out that kind of makes the interruptible lock
pointless.  Either rxrpc_send_data() needs to return a separate indication
that we returned without the lock held or it needs to always drop the lock on
error (at least for ERESTARTSYS/EINTR) which can be checked for higher up.

David

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
