Return-Path: <SRS0=ugj7=IB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82728C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 10:33:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C8364E66
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Mar 2021 10:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C8364E66
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F57447C35;
	Wed,  3 Mar 2021 10:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7W0wDrA6Q89; Wed,  3 Mar 2021 10:33:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C2D47B6F;
	Wed,  3 Mar 2021 10:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2CF9C000B;
	Wed,  3 Mar 2021 10:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D31EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C8714010C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVWOkF43twF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:33:40 +0000 (UTC)
X-Greylist: delayed 01:45:21 by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9716F483A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Mar 2021 10:33:40 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id j3so1388857qtj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Mar 2021 02:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w3iu+FPZ2AQzegLPXY/KDKL+9Oc/6sekpAqi6o7HuJI=;
 b=iEGrkfqbIjy7TAtG6ZAITpccSyN9/W2r2t5hbzfvr9lLSOTTVEfIVnVchRJAI8AZwJ
 imrk1T44duG21Zt5Ju8BAUPDJeiiGJilPv70pByvhMPxZC0tTqoyg611p0rBbXrtH1fC
 QmH1JqpKxduAr5r/txEupbyCyAUOpvxdL0WweMROrs/+YqfAwhLPNGPXsPZ2xPce+tIG
 j6/qWkCgQRJjapH6g7cguDcyonlWtitPQRGeq02LWuN8dfnRL9+9X5wBWm7MRX8XPbg0
 Xb82rdYWV49rAAfrd6W5/Vl4FqpMh3lAFiKUJo4U8y4EyVfbhQCNCrOPtxr8g3Vzphqu
 9o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w3iu+FPZ2AQzegLPXY/KDKL+9Oc/6sekpAqi6o7HuJI=;
 b=qOUAOfBxbfR+lZUmpCpSnvtmoVHI47KaH8xprv0lG3+ISOb0Qu4C0EesJIM6bNXrAC
 iinqVEbvPphVNSnHeoOMr4ty7jdxQqgl1YrDx1qV7+iKiULRKSrMcfNUr7obtz6ugcpn
 CQnCGG7I4m5lweOKBuDjLH67Q6AHk+CffYKr7HRNDgHQHsk/OSONok84uoFDAoQToT2V
 5DnsaZLZje0Wt10G6DtI1O0XWrQ4GmWOZvcy5QPbJNOrhQ0oF3EEam1G2IIVNoiNat4+
 TF59JyCJJmeADDjpWg2+saS/YCnQCoAOwRZYh8o1PKj5+k7Aq68ZVg8+0LoRSVJKtQRb
 FTwg==
X-Gm-Message-State: AOAM533L2bS/RJMosHXnEn0ORrxK3Yr1CyzV+i4FmYK7HimYfgs+O0Cs
 FBHkF3EtKLRnHFR7mNh2ka/coJA2xk1pBzwtDC94DTHlF/UFcQ==
X-Google-Smtp-Source: ABdhPJz4zeZijSXmd2tIZ8Sz21Pfc9SkCP2ddPDhF//3BI0zJ8VIiF3Bpy0cZps+fQVBiWasY126gcNsZ9qBT2MqJl0=
X-Received: by 2002:a37:96c4:: with SMTP id
 y187mr25321093qkd.231.1614767272807; 
 Wed, 03 Mar 2021 02:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20200808040440.255578-1-yepeilin.cs@gmail.com>
 <CACT4Y+b6m7kRS82iRNcmaEPKN8fbvOUmztuGJSw6OketyxM8Kw@mail.gmail.com>
 <1576870386.32806253.1614766300531.JavaMail.zimbra@redhat.com>
In-Reply-To: <1576870386.32806253.1614766300531.JavaMail.zimbra@redhat.com>
Date: Wed, 3 Mar 2021 11:27:41 +0100
Message-ID: <CACT4Y+Y090LkpY=PcuG_VGhaah1uPduO+dHww3uERP_x1MEUMQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer
 dereference in amp_read_loc_assoc_final_data()
To: Gopal Tiwari <gtiwari@redhat.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Mar 3, 2021 at 11:11 AM Gopal Tiwari <gtiwari@redhat.com> wrote:
>
> Hi,
>
> I tried to search the patch for one of the bugzilla reported (Internal) https://bugzilla.redhat.com/show_bug.cgi?id=1916057 with the traces
>
> [  405.938525] Workqueue: hci0 hci_rx_work [bluetooth]
> [  405.941360] RIP: 0010:amp_read_loc_assoc_final_data+0xfc/0x1c0 [bluetooth]
> [  405.944740] Code: 89 44 24 29 48 b8 00 00 00 00 00 fc ff df 0f b6 04 02 84 c0 74 08 3c 01 0f 8e 9d 00 00 00 0f b7 85 c0 03 00 00 66 89 44 24 2b <f0> 41 80 4c 24 30 04 4c 8d 64 24 68 48 89 ee 4c 89 e7 e8 3d 48 fe
> [  405.952396] RSP: 0018:ffff88802ea0f838 EFLAGS: 00010246
> [  405.955368] RAX: 0000000000000000 RBX: 1ffff11005d41f08 RCX: dffffc0000000000
> [  405.958669] RDX: 1ffff110254cc878 RSI: ffff88802eeee000 RDI: ffff88812a6643c0
> [  405.961980] RBP: ffff88812a664000 R08: 0000000000000000 R09: 0000000000000000
> [  405.965319] R10: ffff88802ea0fd00 R11: 0000000000000000 R12: 0000000000000000
> [  405.968624] R13: 0000000000000041 R14: ffff88802b836800 R15: ffff8881250570c0
> [  405.971989] FS:  0000000000000000(0000) GS:ffff888055a00000(0000) knlGS:0000000000000000
> [  405.975645] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  405.978755] CR2: 0000000000000030 CR3: 000000002d200000 CR4: 0000000000340ee0
> [  405.982150] Call Trace:
> [  405.984768]  ? amp_read_loc_assoc+0x170/0x170 [bluetooth]
> [  405.987875]  ? rcu_read_unlock+0x50/0x50
> [  405.990663]  ? deref_stack_reg+0xf0/0xf0
> [  405.993403]  ? __module_address+0x3f/0x370
> [  405.996184]  ? hci_cmd_work+0x180/0x330 [bluetooth]
> [  405.999170]  ? hci_conn_hash_lookup_handle+0x1a1/0x270 [bluetooth]
> [  406.002354]  hci_event_packet+0x1476/0x7e00 [bluetooth]
> [  406.005407]  ? arch_stack_walk+0x8f/0xf0
> [  406.008206]  ? ret_from_fork+0x27/0x50
> [  406.010887]  ? hci_cmd_complete_evt+0xbf70/0xbf70 [bluetooth]
> [  406.013933]  ? stack_trace_save+0x8a/0xb0
> [  406.016618]  ? do_profile_hits.isra.4.cold.9+0x2d/0x2d
> [  406.019483]  ? lock_acquire+0x1a3/0x970
> [  406.022092]  ? __wake_up_common_lock+0xaf/0x130
>
>
> I didn't found any solution upstream. After the vmcore analysis I found what is wrong. And took reference from the following patch, which seems to be on the similar line
>
> commit 6dfccd13db2ff2b709ef60a50163925d477549aa
>     Author: Anmol Karn <anmol.karan123@gmail.com>
>     Date:   Wed Sep 30 19:48:13 2020 +0530
>
>         Bluetooth: Fix null pointer dereference in hci_event_packet()
>
>         AMP_MGR is getting derefernced in hci_phy_link_complete_evt(), when called
>         from hci_event_packet() and there is a possibility, that hcon->amp_mgr may
>         not be found when accessing after initialization of hcon.
>
>         - net/bluetooth/hci_event.c:4945
>
> How we can avoid this scenario. So I made the chages and tested. It worked or avoided the kernel panic. But I really don't know that some one has already posted the patch. I would have love to backport the patch, I was more of looking for the fix. That's where I didn't applied the reported-by tag as I thought it reported internal only.

Hi Gopal,

I think it's somewhat inherent to the current kernel unstructured
processes with bugs being reported on mailing lists, bugzilla,
distro-specific trackers.
One useful thing, though, is searching Lore, e.g. searching for just
the crashing function:
https://lore.kernel.org/lkml/?q=amp_read_loc_assoc_final_data
gives the report and the patch (if we filter out all entries produced
by your patch, which obviously wasn't yet there before you wrote it
:)):

12. [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer
dereference in amp_read_loc_assoc_final_data()
    - by Peilin Ye @ 2020-08-08  4:04 UTC [21%]

13. KASAN: null-ptr-deref Write in amp_read_loc_assoc_final_data
    - by syzbot @ 2020-07-31 17:04 UTC [13%]


> Thanks & regards,
> Gopal Tiwari
>
>
>
> ----- Original Message -----
> From: "Dmitry Vyukov" <dvyukov@google.com>
> To: "Peilin Ye" <yepeilin.cs@gmail.com>
> Cc: "Marcel Holtmann" <marcel@holtmann.org>, "Johan Hedberg" <johan.hedberg@gmail.com>, "Andrei Emeltchenko" <andrei.emeltchenko@intel.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, "syzkaller-bugs" <syzkaller-bugs@googlegroups.com>, "linux-bluetooth" <linux-bluetooth@vger.kernel.org>, "netdev" <netdev@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, gtiwari@redhat.com, syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
> Sent: Wednesday, March 3, 2021 1:51:41 PM
> Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer dereference in amp_read_loc_assoc_final_data()
>
> On Sat, Aug 8, 2020 at 6:06 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > Prevent amp_read_loc_assoc_final_data() from dereferencing `mgr` as NULL.
> >
> > Reported-and-tested-by: syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
> > Fixes: 9495b2ee757f ("Bluetooth: AMP: Process Chan Selected event")
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  net/bluetooth/amp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
> > index 9c711f0dfae3..be2d469d6369 100644
> > --- a/net/bluetooth/amp.c
> > +++ b/net/bluetooth/amp.c
> > @@ -297,6 +297,9 @@ void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
> >         struct hci_request req;
> >         int err;
> >
> > +       if (!mgr)
> > +               return;
> > +
> >         cp.phy_handle = hcon->handle;
> >         cp.len_so_far = cpu_to_le16(0);
> >         cp.max_len = cpu_to_le16(hdev->amp_assoc_size);
>
> Not sure what happened here, but the merged patch somehow has a
> different author and no Reported-by tag:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8bd76ede155fd54d8c41d045dda43cd3174d506
> so let's tell syzbot what fixed it manually:
> #syz fix:
> Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
