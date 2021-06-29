Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FBFC11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B0F61DFF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B0F61DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D854401E6;
	Tue, 29 Jun 2021 19:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sfm_2LD9uG8; Tue, 29 Jun 2021 19:33:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2A5F640174;
	Tue, 29 Jun 2021 19:33:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EA23C001A;
	Tue, 29 Jun 2021 19:33:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA7F4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB1DD40174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfd3T5QDWYLk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C3B5401E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:33:53 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so23856853otl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YS2WgG+tm1E7PR+z7d8KIk2kzEbs0O6AT9o1/tVCqkY=;
 b=U3n9RwRXoJqysAEH+Lfdr+UguX2OEsKtMAF/USgVtXNCVreoTQim2CLR48JS18vska
 bmE3ofHMYRmRtU2YxWA9svI8OJEeXbMSFtzB30Em5xtphQiqf7tHqUhySlMIJpoMojXd
 lrqsit/Htx+PTQ3nIqybve/hPT8sLVk6/hKIRqfeCH/wnokzkTM40qjAWKY0EuRaNbsI
 BPQsAinHpb1RNDB7M9nIth2ZnP8R5rG3ctapDXz3T8wI2mzlWuH/XCjByQtLr+RTbUoc
 jbKbyqTrrIGw1OOn/z7r2Y95BDm3KRZNtB9M8+esbS2W4NgZpHncaaR+iqEhGjxX2WSr
 g/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YS2WgG+tm1E7PR+z7d8KIk2kzEbs0O6AT9o1/tVCqkY=;
 b=TaHygtX2AvTlgG6G0wcZPXIxm/+IRsh+PnMVnqPubYkiQwGgtX1kwygrreanRxKT5S
 xlQT4gMRNrZ4vR6vpi7MGs2b+U5Lz/I4cEtkoaz2hiF8ZD5vYuKaPBMfcu8gO1oK2fDG
 06cAQ5kOhA5s9Sd3tLB8bBcZlXNTpXvHkbxxe6u1t4D9/3IiDmsOKSljdl1nmx6F9O1d
 1Axf+8OHOIg4KvLhxFYjKXH8NP79AeiF3X+v+ZEbND0ZGIIxckd7Ti3239U5uctBMUBm
 2ey4v7XuTraOkpnOOz0BmxBatgXbbAoBfPosL4U2lYW1gaPjz180PvopWwNNWnERtNsQ
 o8YA==
X-Gm-Message-State: AOAM530WNaBH5thzgmw/jBjcWuvHBwMkP75l4M+ifeb/URER9lI246zK
 +De325XKuVHOrfls7uw8EYl9ig==
X-Google-Smtp-Source: ABdhPJwzuGWcwChFeYdw7UOh8XgXDPZE3DrYTHwi1cKl8VKgs4RjCo48nSOMn6uoYe1M6Ba66k+ZLw==
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr5919112oth.25.1624995232643; 
 Tue, 29 Jun 2021 12:33:52 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:f8e3:a853:8646:6bc8])
 by smtp.gmail.com with ESMTPSA id 35sm4374415oth.49.2021.06.29.12.33.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jun 2021 12:33:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 3/3] hfs: add lock nesting notation to hfs_find_init
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210629144803.62541-4-desmondcheongzx@gmail.com>
Date: Tue, 29 Jun 2021 12:33:46 -0700
Message-Id: <763B3E9F-1D48-4D0E-830C-8260D2329627@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-4-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 syzbot+b718ec84a87b7e73ade4@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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



> On Jun 29, 2021, at 7:48 AM, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:
> 
> Syzbot reports a possible recursive lock:
> https://syzkaller.appspot.com/bug?id=f007ef1d7a31a469e3be7aeb0fde0769b18585db
> 
> This happens due to missing lock nesting information. From the logs,
> we see that a call to hfs_fill_super is made to mount the hfs
> filesystem. While searching for the root inode, the lock on the
> catalog btree is grabbed. Then, when the parent of the root isn't
> found, a call to __hfs_bnode_create is made to create the parent of
> the root. This eventually leads to a call to hfs_ext_read_extent which
> grabs a lock on the extents btree.
> 
> Since the order of locking is catalog btree -> extents btree, this
> lock hierarchy does not lead to a deadlock.
> 
> To tell lockdep that this locking is safe, we add nesting notation to
> distinguish between catalog btrees, extents btrees, and attributes
> btrees (for HFS+). This has already been done in hfsplus.
> 
> Reported-and-tested-by: syzbot+b718ec84a87b7e73ade4@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> fs/hfs/bfind.c | 14 +++++++++++++-
> fs/hfs/btree.h |  7 +++++++
> 2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
> index 4af318fbda77..ef9498a6e88a 100644
> --- a/fs/hfs/bfind.c
> +++ b/fs/hfs/bfind.c
> @@ -25,7 +25,19 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> 	fd->key = ptr + tree->max_key_len + 2;
> 	hfs_dbg(BNODE_REFS, "find_init: %d (%p)\n",
> 		tree->cnid, __builtin_return_address(0));
> -	mutex_lock(&tree->tree_lock);
> +	switch (tree->cnid) {
> +	case HFS_CAT_CNID:
> +		mutex_lock_nested(&tree->tree_lock, CATALOG_BTREE_MUTEX);
> +		break;
> +	case HFS_EXT_CNID:
> +		mutex_lock_nested(&tree->tree_lock, EXTENTS_BTREE_MUTEX);
> +		break;
> +	case HFS_ATTR_CNID:
> +		mutex_lock_nested(&tree->tree_lock, ATTR_BTREE_MUTEX);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> 	return 0;
> }
> 
> diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
> index 4ba45caf5939..0e6baee93245 100644
> --- a/fs/hfs/btree.h
> +++ b/fs/hfs/btree.h
> @@ -13,6 +13,13 @@ typedef int (*btree_keycmp)(const btree_key *, const btree_key *);
> 
> #define NODE_HASH_SIZE  256
> 
> +/* B-tree mutex nested subclasses */
> +enum hfs_btree_mutex_classes {
> +	CATALOG_BTREE_MUTEX,
> +	EXTENTS_BTREE_MUTEX,
> +	ATTR_BTREE_MUTEX,
> +};
> +
> /* A HFS BTree held in memory */
> struct hfs_btree {
> 	struct super_block *sb;
> -- 
> 2.25.1
> 

Looks good to me.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
