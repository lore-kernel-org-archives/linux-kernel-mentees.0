Return-Path: <SRS0=HmkY=2D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AB6C2D0D3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 20:46:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C61F2469B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 20:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="VoZOlw8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C61F2469B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0FE18203A6;
	Fri, 13 Dec 2019 18:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ecQnNFsWY0q; Fri, 13 Dec 2019 18:18:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 515141FFFF;
	Fri, 13 Dec 2019 18:18:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 322CDC1D7F;
	Fri, 13 Dec 2019 18:18:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67FBCC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 18:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 567EF86F6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 18:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXW9HKwADIjI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 18:18:32 +0000 (UTC)
X-Greylist: delayed 00:06:30 by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 25E0D86DA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 18:18:32 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w127so311860qkb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 10:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYPYNQC53+CxeOZMSLaSXNleC2alunHbsG33GQacSz4=;
 b=VoZOlw8aTRJ5130OpGd/2QPPeJVLXlpFsO6lMnt0ZVol+swiG2OufkT5eZ5bZNX1t7
 6uq3Wh9ztEg6X4u9wTAPnozLL7VzKAPoXn1vpSn2db+we4rYrwIknRm5sY6suY68VX6z
 qT12MybJIwhfdsNBRT2iKWvDh8hJH5RCDmfsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYPYNQC53+CxeOZMSLaSXNleC2alunHbsG33GQacSz4=;
 b=aJdAkqsVeUjavcLE4lrMLTmVKG4dh8/b7hfPOclTviXL6dtdv7Z6hA8YMTiNRpcBd9
 44BhxhPvP9WA0K8ayEvYH3jA4VV2+8G+yJsy4EG0SCq/NYvGKPAm658mkkf4c57vGveL
 HI+JbSpq3ZaAZ3kqIqOj5oXYNf3fy3Xejm6hTqgDe4QjWqOQ/MoHsKpVXS/ctrunijPc
 onFp4jAlcBv7+Dx8mbZpt41ngiK+/oqaE9i9LTzf5fKohCvNcwUTDXRRgfgThgYNTUsZ
 e7lYD6NwrUIYDOYbqgL3xBojEhBqZyOea0RqulVRh95e4izVdpbZb5w5fPXxK91c81dB
 MsoA==
X-Gm-Message-State: APjAAAUUzXVG6wpA4lyzYzn4LbUOTDJBzYJ4++IryVFqLXgRb+Scz2Gi
 RkqR5AqbYMcazfcdVewHinF085eZ/JmSaPuRNG6Y7eZw
X-Google-Smtp-Source: APXvYqyenKHhwGviYc0bhj1kkNQB0iXKYg0CMjzjCOLDKyeheouOTpWir748zTNRkxFY2sr98wCfcLVq/vHGlgYTv1g=
X-Received: by 2002:a37:514:: with SMTP id 20mr14328531qkf.321.1576260721379; 
 Fri, 13 Dec 2019 10:12:01 -0800 (PST)
MIME-Version: 1.0
References: <20191213113510.GG15474@quack2.suse.cz>
 <20191213153306.30744-1-tranmanphong@gmail.com>
In-Reply-To: <20191213153306.30744-1-tranmanphong@gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 13 Dec 2019 10:11:50 -0800
Message-ID: <CAEXW_YQwrM6=u1gsij-5SL5+2n9Pk9HFEYdF_JWYjitLvr7Dcg@mail.gmail.com>
To: Phong Tran <tranmanphong@gmail.com>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 rcu <rcu@vger.kernel.org>, adilger.kernel@dilger.ca, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH V2] ext4: use rcu API in
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

On Fri, Dec 13, 2019 at 7:39 AM Phong Tran <tranmanphong@gmail.com> wrote:
>
> struct ext4_sb_info.system_blks was marked __rcu.
> But access the pointer without using RCU lock and dereference.
> Sparse warning with __rcu notation:
>
> block_validity.c:139:29: warning: incorrect type in argument 1 (different address spaces)
> block_validity.c:139:29:    expected struct rb_root const *
> block_validity.c:139:29:    got struct rb_root [noderef] <asn:4> *
>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>

Thanks Phong! Looks like a real bug fix caught thanks to Sparse. So
let us mark for stable as well?

- Joel

> ---
>  fs/ext4/block_validity.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> ---
> change log:
> V2: Add Reviewed-by: Jan Kara <jack@suse.cz>
>
> diff --git a/fs/ext4/block_validity.c b/fs/ext4/block_validity.c
> index d4d4fdfac1a6..1ee04e76bbe0 100644
> --- a/fs/ext4/block_validity.c
> +++ b/fs/ext4/block_validity.c
> @@ -133,10 +133,13 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
>  {
>         struct rb_node *node;
>         struct ext4_system_zone *entry;
> +       struct ext4_system_blocks *system_blks;
>         int first = 1;
>
>         printk(KERN_INFO "System zones: ");
> -       node = rb_first(&sbi->system_blks->root);
> +       rcu_read_lock();
> +       system_blks = rcu_dereference(sbi->system_blks);
> +       node = rb_first(&system_blks->root);
>         while (node) {
>                 entry = rb_entry(node, struct ext4_system_zone, node);
>                 printk(KERN_CONT "%s%llu-%llu", first ? "" : ", ",
> @@ -144,6 +147,7 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
>                 first = 0;
>                 node = rb_next(node);
>         }
> +       rcu_read_unlock();
>         printk(KERN_CONT "\n");
>  }
>
> --
> 2.20.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
