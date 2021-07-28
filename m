Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B26AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 13:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940E860C41
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 13:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 940E860C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517DC40379;
	Wed, 28 Jul 2021 13:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbMdAvKYclPm; Wed, 28 Jul 2021 13:00:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6B44240358;
	Wed, 28 Jul 2021 13:00:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 381EDC0010;
	Wed, 28 Jul 2021 13:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0277C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 13:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF9E400FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 13:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.cz header.b="v9G2MRBI";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.cz header.b="+dVFHCK5"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGpb7AjCS7WR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 13:00:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 510CE400C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 13:00:53 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 351D91FFAB;
 Wed, 28 Jul 2021 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627477250;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBVxtrSmWVlOscO72s3n1kpnLDIq1UYxTJT1qArgmmQ=;
 b=v9G2MRBI9ZC4oh0wXp76nkFZulbeIh/X9Kl1ZGYf/vBtLRwjYZPKCWMjGaRiT7QKYSZ90s
 i2rYnube6FOkbpHqj9DPbp0cx+VKOZb1YjHEpJqCBf25YPC8FoasiJ5BPJ1X7OLwnWRPBA
 sU8h+anD6jFn6PPXXnDbdwGz2vDQy+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627477250;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBVxtrSmWVlOscO72s3n1kpnLDIq1UYxTJT1qArgmmQ=;
 b=+dVFHCK5TxbazeQB9uIkp8YvmgS+oT8ugRDKduJ54Ig3smLynu17XhzYkBjIKnruYW57R2
 r6oB1pCP3NPKd9Bg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 1D3ACA3B93;
 Wed, 28 Jul 2021 13:00:50 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 49595DA8A7; Wed, 28 Jul 2021 14:58:05 +0200 (CEST)
Date: Wed, 28 Jul 2021 14:58:05 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
Message-ID: <20210728125805.GE5047@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, anand.jain@oracle.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210727071303.113876-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727071303.113876-1-desmondcheongzx@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com, josef@toxicpanda.com,
 anand.jain@oracle.com, linux-kernel@vger.kernel.org, clm@fb.com,
 dsterba@suse.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-btrfs@vger.kernel.org
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jul 27, 2021 at 03:13:03PM +0800, Desmond Cheong Zhi Xi wrote:
> When removing a writeable device in __btrfs_free_extra_devids, the rw
> device count should be decremented.
> 
> This error was caught by Syzbot which reported a warning in
> close_fs_devices because fs_devices->rw_devices was not 0 after
> closing all devices. Here is the call trace that was observed:
> 
>   btrfs_mount_root():
>     btrfs_scan_one_device():
>       device_list_add();   <---------------- device added
>     btrfs_open_devices():
>       open_fs_devices():
>         btrfs_open_one_device();   <-------- writable device opened,
> 	                                     rw device count ++
>     btrfs_fill_super():
>       open_ctree():
>         btrfs_free_extra_devids():
> 	  __btrfs_free_extra_devids();  <--- writable device removed,
> 	                              rw device count not decremented
> 	  fail_tree_roots:
> 	    btrfs_close_devices():
> 	      close_fs_devices();   <------- rw device count off by 1
> 
> As a note, prior to commit cf89af146b7e ("btrfs: dev-replace: fail
> mount if we don't have replace item with target device"), rw_devices
> was decremented on removing a writable device in
> __btrfs_free_extra_devids only if the BTRFS_DEV_STATE_REPLACE_TGT bit
> was not set for the device. However, this check does not need to be
> reinstated as it is now redundant and incorrect.
> 
> In __btrfs_free_extra_devids, we skip removing the device if it is the
> target for replacement. This is done by checking whether device->devid
> == BTRFS_DEV_REPLACE_DEVID. Since BTRFS_DEV_STATE_REPLACE_TGT is set
> only on the device with devid BTRFS_DEV_REPLACE_DEVID, no devices
> should have the BTRFS_DEV_STATE_REPLACE_TGT bit set after the check,
> and so it's redundant to test for that bit.
> 
> Additionally, following commit 82372bc816d7 ("Btrfs: make
> the logic of source device removing more clear"), rw_devices is
> incremented whenever a writeable device is added to the alloc
> list (including the target device in btrfs_dev_replace_finishing), so
> all removals of writable devices from the alloc list should also be
> accompanied by a decrement to rw_devices.
> 
> Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
> Reported-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
> Tested-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Reviewed-by: Anand Jain <anand.jain@oracle.com>

Added to misc-next, thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
