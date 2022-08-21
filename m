Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7175DC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 19:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C7F81ADE;
	Sun, 21 Aug 2022 19:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C7F81ADE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kDU2UU5S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnMHGqHFxqvZ; Sun, 21 Aug 2022 19:18:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1028681AAC;
	Sun, 21 Aug 2022 19:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1028681AAC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB954C0033;
	Sun, 21 Aug 2022 19:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D7A6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 19:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6151605AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 19:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6151605AC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kDU2UU5S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UA9vYXW87XLz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 19:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139826068F
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 139826068F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 19:18:06 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x19so5708747pfq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=g4Jq3jLthELbJHukRc3Iv/BvScPnTFSVj9j7skCzo1c=;
 b=kDU2UU5SlgmthEgn6AtfuD9P27Zu6gu7yy3Cr/bPAD5vrFnOsb6gEBqVTevTlfFmVa
 FUbXWqT2/iWfzzIEzqSEvbkhwpkX1mvPiUblcOyvZ97u4FTJ8zBf95ylVpVMSUc4aStq
 WdIiD5JKfvIV+Nsbnk+0v+ZtqT9a1ef3ceHZ25LnxU29ixiWYa+qRJWAsJCoD7szCzdk
 Ht3ee/SzTjB+gUwiofg6iNOPClmm2V0IH2sAP8NbP7hqKC7mmOC964vkTk0YZUTkxY3Q
 gRgrj4dZ21G6NTA54wS9d1DwsV9a7wMXg1VFlUbz1JliGRAX9/QcYiszo6ExeA/0u4wv
 o7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=g4Jq3jLthELbJHukRc3Iv/BvScPnTFSVj9j7skCzo1c=;
 b=K51JiJEWzp0tzobLOqxxb8dfPcr25iXbw1Hk61ct3wKfjozqUKG6spuTQLbCfQXA+N
 ZfnoudL3vUdDdxEXnY6kEe1Vpj/DK/FZ/kubP9xDUppkJk/yKUllrdXxaKnWmmubgqFB
 9yRvKN1owzZmlEqZxnVOIHCk31hDPOVTZxzJ1HvXLSIVNrYxekde9YDvQdcu8bOZthd5
 9Ei/4jch+PY4l61y7CJWuxkbru2KQjuHmLwA2tExDyRvk0Xmq70MU4NWSVsLq67CVSoO
 WTG7ofKmGcqmDdWpOj7fCexhWrDsMKsloMfn5aNeX61P1E+cJ58nfZ6X8+7qtgio2yrG
 8Iig==
X-Gm-Message-State: ACgBeo0f9+tuIquABFZERb65RhenzXdbfrm4p/saNA40FTOT+UD4faNy
 1nrSpeAFQ8J7/lyjRjtx5AU=
X-Google-Smtp-Source: AA6agR7g0vUdHNB436qax714lzXjZm0PbKlo0UfLHsf2DpJCNmP1zuz4nFo5+5LXimvrXhQ3j3lZHw==
X-Received: by 2002:a65:6d13:0:b0:41d:b593:e5ab with SMTP id
 bf19-20020a656d13000000b0041db593e5abmr14000051pgb.467.1661109485454; 
 Sun, 21 Aug 2022 12:18:05 -0700 (PDT)
Received: from fedora.. ([103.159.189.146]) by smtp.gmail.com with ESMTPSA id
 w23-20020a627b17000000b0052d16416effsm7051203pfc.80.2022.08.21.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 12:18:05 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com
Subject: Re: [syzbot] WARNING: bad unlock balance in rxrpc_do_sendmsg
Date: Mon, 22 Aug 2022 01:17:51 +0600
Message-Id: <20220821191751.222357-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <000000000000ce327f05d537ebf7@google.com>
References: <000000000000ce327f05d537ebf7@google.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Hawkins Jiawei <yin31149@gmail.com>, paskripkin@gmail.com,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
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

Maybe we do not need to lock since no other timer_schedule needs 
it. 

Test if this fixes the issue.
---
#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 568035b01cfb
 net/rxrpc/sendmsg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 1d38e279e2ef..640e2ab2cc35 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -51,10 +51,8 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
 			return sock_intr_errno(*timeo);
 
 		trace_rxrpc_transmit(call, rxrpc_transmit_wait);
-		mutex_unlock(&call->user_mutex);
 		*timeo = schedule_timeout(*timeo);
-		if (mutex_lock_interruptible(&call->user_mutex) < 0)
-			return sock_intr_errno(*timeo);
+		return sock_intr_errno(*timeo);
 	}
 }
 
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
