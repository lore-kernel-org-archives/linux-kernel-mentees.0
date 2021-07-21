Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120A7C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 18:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0456101B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 18:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0456101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5764240436;
	Wed, 21 Jul 2021 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeVmd_1pkvrv; Wed, 21 Jul 2021 18:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 28F424037E;
	Wed, 21 Jul 2021 18:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 135A1C001A;
	Wed, 21 Jul 2021 18:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC599C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C86E282C21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 18:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.cz header.b="xcQSz636";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.cz header.b="BKweevZE"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PROaud5G4rV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 18:02:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9065D82C1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 18:02:22 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B12522257D;
 Wed, 21 Jul 2021 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626890539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UURkxj0FzkddkNj25OCBmqPhNmUDQqkrhXQKcD008LU=;
 b=xcQSz636EWAiC85tX8hiA6MdN0EZiqEIXRlig788UnnDsmwAPzPBNq5J3lLcsUo83LT+9F
 PWY+l9YpdOPJ6SMR19CtQZDKqUAtXxhCzxHkySb4Z5Fz+k5lkuLdPKh0+Fr0OknVGundiW
 hVkzEVOGq0Yvh7CCchNWz2ZxJ+eNiJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626890539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UURkxj0FzkddkNj25OCBmqPhNmUDQqkrhXQKcD008LU=;
 b=BKweevZE47LPO8lNVm//uvT+55czJ9isHbyeT/esC54dRYhnvB5WwwqU7lmw2B08F50XxW
 Zq7IF1jCXNLG68BA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 9A5B9A3B87;
 Wed, 21 Jul 2021 18:02:19 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 6D5D5DA704; Wed, 21 Jul 2021 19:59:38 +0200 (CEST)
Date: Wed, 21 Jul 2021 19:59:38 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
Message-ID: <20210721175938.GP19710@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, anand.jain@oracle.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210715103403.176695-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715103403.176695-1-desmondcheongzx@gmail.com>
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

On Thu, Jul 15, 2021 at 06:34:03PM +0800, Desmond Cheong Zhi Xi wrote:
> Syzbot reports a warning in close_fs_devices that happens because
> fs_devices->rw_devices is not 0 after calling btrfs_close_one_device
> on each device.
> 
> This happens when a writeable device is removed in
> __btrfs_free_extra_devids, but the rw device count is not decremented
> accordingly. So when close_fs_devices is called, the removed device is
> still counted and we get an off by 1 error.
> 
> Here is one call trace that was observed:
>   btrfs_mount_root():
>     btrfs_scan_one_device():
>       device_list_add();   <---------------- device added
>     btrfs_open_devices():
>       open_fs_devices():
>         btrfs_open_one_device();   <-------- rw device count ++
>     btrfs_fill_super():
>       open_ctree():
>         btrfs_free_extra_devids():
> 	  __btrfs_free_extra_devids();  <--- device removed
> 	  fail_tree_roots:
> 	    btrfs_close_devices():
> 	      close_fs_devices();   <------- rw device count off by 1
> 
> Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")

What this patch did in the last hunk was the rw_devices decrement, but
conditional:

@@ -1080,9 +1071,6 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
                if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
                        list_del_init(&device->dev_alloc_list);
                        clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
-                       if (!test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
-                                     &device->dev_state))
-                               fs_devices->rw_devices--;
                }
                list_del_init(&device->dev_list);
                fs_devices->num_devices--;
---


> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>  		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>  			list_del_init(&device->dev_alloc_list);
>  			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
> +			fs_devices->rw_devices--;
>  		}
>  		list_del_init(&device->dev_list);
>  		fs_devices->num_devices--;

So should it be reinstated in the original form? The rest of
cf89af146b7e handles unexpected device replace item during mount.

Adding the decrement is correct, but right now I'm not sure about the
corner case when teh devcie has the BTRFS_DEV_STATE_REPLACE_TGT bit set.
The state machine of the device bits and counters is not trivial so
fixing it one way or the other could lead to further syzbot reports if
we don't understand the issue.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
