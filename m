Return-Path: <SRS0=ugj7=IB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F82C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 10:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0DB164E99
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 10:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0DB164E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835D56F573;
	Wed,  3 Mar 2021 10:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LVyu5uyBu16; Wed,  3 Mar 2021 10:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731C8605F8;
	Wed,  3 Mar 2021 10:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AD29C000A;
	Wed,  3 Mar 2021 10:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 692D1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B21E8404A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MejNW-rpiXsa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A08CF83FAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77uf6dC0svUNR9tlB1KVBLE1LZZ5lgDE+cme98poYho=;
 b=XNtSjZba7PWnsD01pg7EUMPzuRTNQSmSNr8BUxi4+Jcnzd94FlEY8cjXCbvtql5Zd+uUP3
 AR5ykXX2xxmEVhVFejuA9aqQq0RyGYOrAd69BFvY+8jM0N1MgDbKcTbEUKD3E/xCJs+tmP
 ehuymu3fiWtfmvFT7+L2vXkdCraNENw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-tGVb2QpTNpOIC5Di3rK86A-1; Wed, 03 Mar 2021 05:11:43 -0500
X-MC-Unique: tGVb2QpTNpOIC5Di3rK86A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E4E7107ACE3;
 Wed,  3 Mar 2021 10:11:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 426715B4A7;
 Wed,  3 Mar 2021 10:11:41 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com
 (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD7324EEEC;
 Wed,  3 Mar 2021 10:11:40 +0000 (UTC)
Date: Wed, 3 Mar 2021 05:11:40 -0500 (EST)
From: Gopal Tiwari <gtiwari@redhat.com>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <1576870386.32806253.1614766300531.JavaMail.zimbra@redhat.com>
In-Reply-To: <CACT4Y+b6m7kRS82iRNcmaEPKN8fbvOUmztuGJSw6OketyxM8Kw@mail.gmail.com>
References: <20200808040440.255578-1-yepeilin.cs@gmail.com>
 <CACT4Y+b6m7kRS82iRNcmaEPKN8fbvOUmztuGJSw6OketyxM8Kw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer
 dereference in amp_read_loc_assoc_final_data()
MIME-Version: 1.0
X-Originating-IP: [10.64.242.156, 10.4.195.27]
Thread-Topic: Bluetooth: Fix NULL pointer dereference in
 amp_read_loc_assoc_final_data()
Thread-Index: VtEcXu3teRJFxIx5tcgeemHuREdD3g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Andrei Emeltchenko <andrei.emeltchenko@intel.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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

Hi, 

I tried to search the patch for one of the bugzilla reported (Internal) https://bugzilla.redhat.com/show_bug.cgi?id=1916057 with the traces 

[  405.938525] Workqueue: hci0 hci_rx_work [bluetooth]
[  405.941360] RIP: 0010:amp_read_loc_assoc_final_data+0xfc/0x1c0 [bluetooth]
[  405.944740] Code: 89 44 24 29 48 b8 00 00 00 00 00 fc ff df 0f b6 04 02 84 c0 74 08 3c 01 0f 8e 9d 00 00 00 0f b7 85 c0 03 00 00 66 89 44 24 2b <f0> 41 80 4c 24 30 04 4c 8d 64 24 68 48 89 ee 4c 89 e7 e8 3d 48 fe
[  405.952396] RSP: 0018:ffff88802ea0f838 EFLAGS: 00010246
[  405.955368] RAX: 0000000000000000 RBX: 1ffff11005d41f08 RCX: dffffc0000000000
[  405.958669] RDX: 1ffff110254cc878 RSI: ffff88802eeee000 RDI: ffff88812a6643c0
[  405.961980] RBP: ffff88812a664000 R08: 0000000000000000 R09: 0000000000000000
[  405.965319] R10: ffff88802ea0fd00 R11: 0000000000000000 R12: 0000000000000000
[  405.968624] R13: 0000000000000041 R14: ffff88802b836800 R15: ffff8881250570c0
[  405.971989] FS:  0000000000000000(0000) GS:ffff888055a00000(0000) knlGS:0000000000000000
[  405.975645] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  405.978755] CR2: 0000000000000030 CR3: 000000002d200000 CR4: 0000000000340ee0
[  405.982150] Call Trace:
[  405.984768]  ? amp_read_loc_assoc+0x170/0x170 [bluetooth]
[  405.987875]  ? rcu_read_unlock+0x50/0x50
[  405.990663]  ? deref_stack_reg+0xf0/0xf0
[  405.993403]  ? __module_address+0x3f/0x370
[  405.996184]  ? hci_cmd_work+0x180/0x330 [bluetooth]
[  405.999170]  ? hci_conn_hash_lookup_handle+0x1a1/0x270 [bluetooth]
[  406.002354]  hci_event_packet+0x1476/0x7e00 [bluetooth]
[  406.005407]  ? arch_stack_walk+0x8f/0xf0
[  406.008206]  ? ret_from_fork+0x27/0x50
[  406.010887]  ? hci_cmd_complete_evt+0xbf70/0xbf70 [bluetooth]
[  406.013933]  ? stack_trace_save+0x8a/0xb0
[  406.016618]  ? do_profile_hits.isra.4.cold.9+0x2d/0x2d
[  406.019483]  ? lock_acquire+0x1a3/0x970
[  406.022092]  ? __wake_up_common_lock+0xaf/0x130


I didn't found any solution upstream. After the vmcore analysis I found what is wrong. And took reference from the following patch, which seems to be on the similar line 

commit 6dfccd13db2ff2b709ef60a50163925d477549aa
    Author: Anmol Karn <anmol.karan123@gmail.com>
    Date:   Wed Sep 30 19:48:13 2020 +0530
    
        Bluetooth: Fix null pointer dereference in hci_event_packet()
    
        AMP_MGR is getting derefernced in hci_phy_link_complete_evt(), when called
        from hci_event_packet() and there is a possibility, that hcon->amp_mgr may
        not be found when accessing after initialization of hcon.
    
        - net/bluetooth/hci_event.c:4945

How we can avoid this scenario. So I made the chages and tested. It worked or avoided the kernel panic. But I really don't know that some one has already posted the patch. I would have love to backport the patch, I was more of looking for the fix. That's where I didn't applied the reported-by tag as I thought it reported internal only. 

Thanks & regards, 
Gopal Tiwari 



----- Original Message -----
From: "Dmitry Vyukov" <dvyukov@google.com>
To: "Peilin Ye" <yepeilin.cs@gmail.com>
Cc: "Marcel Holtmann" <marcel@holtmann.org>, "Johan Hedberg" <johan.hedberg@gmail.com>, "Andrei Emeltchenko" <andrei.emeltchenko@intel.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, "syzkaller-bugs" <syzkaller-bugs@googlegroups.com>, "linux-bluetooth" <linux-bluetooth@vger.kernel.org>, "netdev" <netdev@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, gtiwari@redhat.com, syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
Sent: Wednesday, March 3, 2021 1:51:41 PM
Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer dereference in amp_read_loc_assoc_final_data()

On Sat, Aug 8, 2020 at 6:06 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Prevent amp_read_loc_assoc_final_data() from dereferencing `mgr` as NULL.
>
> Reported-and-tested-by: syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
> Fixes: 9495b2ee757f ("Bluetooth: AMP: Process Chan Selected event")
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  net/bluetooth/amp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
> index 9c711f0dfae3..be2d469d6369 100644
> --- a/net/bluetooth/amp.c
> +++ b/net/bluetooth/amp.c
> @@ -297,6 +297,9 @@ void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
>         struct hci_request req;
>         int err;
>
> +       if (!mgr)
> +               return;
> +
>         cp.phy_handle = hcon->handle;
>         cp.len_so_far = cpu_to_le16(0);
>         cp.max_len = cpu_to_le16(hdev->amp_assoc_size);

Not sure what happened here, but the merged patch somehow has a
different author and no Reported-by tag:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8bd76ede155fd54d8c41d045dda43cd3174d506
so let's tell syzbot what fixed it manually:
#syz fix:
Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
