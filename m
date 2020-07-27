Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0FEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:23:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DE82074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jE5eHLGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DE82074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3EEE1FE41;
	Mon, 27 Jul 2020 13:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4SZAQHGpQPq; Mon, 27 Jul 2020 13:23:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 24C6F20481;
	Mon, 27 Jul 2020 13:23:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14879C0050;
	Mon, 27 Jul 2020 13:23:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC009C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B1FB48769E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmnV0XR7Q1CR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:23:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E45A887677
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:23:00 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 278B22070A;
 Mon, 27 Jul 2020 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595856180;
 bh=KYaSv9xXBPcvT0Apo2G8kSAbXzJYKl5iiZ4cPD0qUOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jE5eHLGPDe2S3rBwmkitD9TkFJyH1DEuBHpcW1URvPS8/nlVGhInX28IuwGW2rI7s
 YgBbJBYw3HFO/gd2FIh0qR5cbv5/0OhTU/redOikOxKC/LzBztbE5mbXZEVVE2+YKs
 K9SERkNkw/D3MVfEH72uo6WGFm2SuE4VrboTR7Zo=
Date: Mon, 27 Jul 2020 15:22:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: B K Karthik <bkkarthik@pesu.pes.edu>
Message-ID: <20200727132256.GA3933866@kroah.com>
References: <20200727131057.7a3of3hhsld4ng5t@pesu.pes.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727131057.7a3of3hhsld4ng5t@pesu.pes.edu>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, tipc-discussion@lists.sourceforge.net,
 Ying Xue <ying.xue@windriver.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: tipc: fix general
 protection fault in tipc_conn_delete_sub
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

On Mon, Jul 27, 2020 at 06:40:57PM +0530, B K Karthik wrote:
> fix a general protection fault in tipc_conn_delete_sub
> by checking for the existance of con->server.
> prevent a null-ptr-deref by returning -EINVAL when
> con->server is NULL
> 
> general protection fault, probably for non-canonical address 0xdffffc0000000014: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x00000000000000a0-0x00000000000000a7]
> CPU: 1 PID: 113 Comm: kworker/u4:3 Not tainted 5.6.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: tipc_send tipc_conn_send_work
> RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
> Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
> RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
> RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
> RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
> R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
> R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
> FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000076c000 CR3: 000000009441d000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  tipc_conn_send_to_sock+0x380/0x560 net/tipc/topsrv.c:266
>  tipc_conn_send_work+0x6f/0x90 net/tipc/topsrv.c:304
>  process_one_work+0x965/0x16a0 kernel/workqueue.c:2266
>  worker_thread+0x96/0xe20 kernel/workqueue.c:2412
>  kthread+0x388/0x470 kernel/kthread.c:268
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Modules linked in:
> ---[ end trace 2c161a84be832606 ]---
> RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
> Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
> RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
> RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
> RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
> R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
> R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
> FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020800000 CR3: 0000000091b8e000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> Reported-and-tested-by: syzbot+55a38037455d0351efd3@syzkaller.appspotmail.com
> Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
> ---
>  net/tipc/topsrv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/tipc/topsrv.c b/net/tipc/topsrv.c
> index 1489cfb941d8..6c8d0c6bb112 100644
> --- a/net/tipc/topsrv.c
> +++ b/net/tipc/topsrv.c
> @@ -255,6 +255,9 @@ static void tipc_conn_send_to_sock(struct tipc_conn *con)
>  	int count = 0;
>  	int ret;
>  
> +	if (!con->server)
> +		return -EINVAL;

What is wrong with looking at the srv local variable instead?

And how is server getting set to NULL and this function still being
called?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
