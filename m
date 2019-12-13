Return-Path: <SRS0=HmkY=2D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0751C2D0C9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 21:02:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C29A24682
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 21:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C29A24682
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C757088A9D;
	Fri, 13 Dec 2019 11:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35xLAPY32gQo; Fri, 13 Dec 2019 11:35:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E7E0F88A6C;
	Fri, 13 Dec 2019 11:35:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7BD1C1D7C;
	Fri, 13 Dec 2019 11:35:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A290C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 11:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1338925445
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 11:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1dMqAZ1zn68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 11:35:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id F04A4203A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 11:35:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 724F5ACD9;
 Fri, 13 Dec 2019 11:35:11 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E5FC21E0CAF; Fri, 13 Dec 2019 12:35:10 +0100 (CET)
Date: Fri, 13 Dec 2019 12:35:10 +0100
From: Jan Kara <jack@suse.cz>
To: Phong Tran <tranmanphong@gmail.com>
Message-ID: <20191213113510.GG15474@quack2.suse.cz>
References: <20191201035107.24355-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191201035107.24355-1-tranmanphong@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tytso@mit.edu, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] ext4: use rcu API in
	debug_print_tree
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

On Sun 01-12-19 10:51:07, Phong Tran wrote:
> struct ext4_sb_info.system_blks was marked __rcu.
> But access the pointer without using RCU lock and dereference.
> Sparse warning with __rcu notation:
> 
> block_validity.c:139:29: warning: incorrect type in argument 1 (different address spaces)
> block_validity.c:139:29:    expected struct rb_root const *
> block_validity.c:139:29:    got struct rb_root [noderef] <asn:4> *
> 
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>

Thanks for the patch. It looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/block_validity.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/block_validity.c b/fs/ext4/block_validity.c
> index d4d4fdfac1a6..1ee04e76bbe0 100644
> --- a/fs/ext4/block_validity.c
> +++ b/fs/ext4/block_validity.c
> @@ -133,10 +133,13 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
>  {
>  	struct rb_node *node;
>  	struct ext4_system_zone *entry;
> +	struct ext4_system_blocks *system_blks;
>  	int first = 1;
>  
>  	printk(KERN_INFO "System zones: ");
> -	node = rb_first(&sbi->system_blks->root);
> +	rcu_read_lock();
> +	system_blks = rcu_dereference(sbi->system_blks);
> +	node = rb_first(&system_blks->root);
>  	while (node) {
>  		entry = rb_entry(node, struct ext4_system_zone, node);
>  		printk(KERN_CONT "%s%llu-%llu", first ? "" : ", ",
> @@ -144,6 +147,7 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
>  		first = 0;
>  		node = rb_next(node);
>  	}
> +	rcu_read_unlock();
>  	printk(KERN_CONT "\n");
>  }
>  
> -- 
> 2.20.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
