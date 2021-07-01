Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3257EC11F64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:04:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8148613FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8148613FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40EF60AFA;
	Thu,  1 Jul 2021 17:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vno5EG-pGhlT; Thu,  1 Jul 2021 17:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B974F60610;
	Thu,  1 Jul 2021 17:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98CFEC001A;
	Thu,  1 Jul 2021 17:04:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45C52C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D93560AFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhztyqjIQ08p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F99E60AF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:04:05 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so7239988otp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KTfXNbsRGCZ2JJ0XX6b1VXX9NJfkKK4oNu1chBwcSns=;
 b=L3cyfSpvV5hqCG85J7o/Hg28ZuKcrfFAi5mgBxdFz9zgdZ44e/AM3Z/8/1zZ2Qn7oF
 +SRkh3fh1FM4QbDUAwA5PxTOhNTV9yHoCjNNVj9ADJAAnuFms2CGWxK/tSMD38rw1VDa
 oP1rJ9W64Vjr1F2+vxlRXIrq9epj+IdQsxGndRcsxLKiQpR0LddHhvZ237I91l4bv9PS
 wt8FEcCMiyvhEDs4Rw9oACqET0bOkvxoW+YiCiD1ZrdHxn9oe4mlLvvJv15e+aNfVBhI
 ausNnI0CIJ8WeiBr/GLan6cueOmIQ8IfmQHk6SHWgYwzIMNkSS9vrB0Y38Y7eoVYoC0G
 Hzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KTfXNbsRGCZ2JJ0XX6b1VXX9NJfkKK4oNu1chBwcSns=;
 b=aTZvGda+pfVxRBslPXeXBB1h8GU9xRiYGzQV+yjt99ktPhpPbBlhW9bni8BwP2a+Qm
 yPoBr4sRHoKoD3mxnjKCfuLNgg7Cvavc0/j5Rzv0gnMDP3uZPJ8syjBBdJvq30qvvaEx
 RbNNFKoBV2ZaO6WGVcgb5/DRW2Hmi7luPxQ2EwPHvs8j1uqBJq/G5lAUra3RfgnLWuuL
 uDMSX8zsP4kwXVo6qOZrnDNC/NpByfMcfigdEN1pq9vXgUP5FQghgYbEPxsgGWYWza8l
 Akih+HMKXc9aTOCihdzoy8/VuLAlXsVXOwYMBaO7L9bdaAqSWuS+fcEMmb4FG7+1J6P8
 J6bA==
X-Gm-Message-State: AOAM531mP09Q7bip6XcmNHrjDuJpkd7yBlHkFhHgVznooWfYNQM96Euf
 cGuhrYqxt5w6I5Npt0i4c6xZYw==
X-Google-Smtp-Source: ABdhPJyd3n4i6/Ath0pD2RILlnUYUtbGAXhiJk3HOXnvrGJGANQj8sVT7XtAcg+X/KP3/4rVSMuYlA==
X-Received: by 2002:a9d:2c44:: with SMTP id f62mr777752otb.147.1625159045120; 
 Thu, 01 Jul 2021 10:04:05 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:4d57:e39e:c32f:13d2])
 by smtp.gmail.com with ESMTPSA id l10sm57404oti.9.2021.07.01.10.04.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:04:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v2 3/3] hfs: add lock nesting notation to hfs_find_init
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210701030756.58760-4-desmondcheongzx@gmail.com>
Date: Thu, 1 Jul 2021 10:04:02 -0700
Message-Id: <7E90922F-6F1F-4D05-AB2A-E4D3CDC513E0@dubeyko.com>
References: <20210701030756.58760-1-desmondcheongzx@gmail.com>
 <20210701030756.58760-4-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: LKML <linux-kernel@vger.kernel.org>, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 syzbot+b718ec84a87b7e73ade4@syzkaller.appspotmail.com,
 Andrew Morton <akpm@linux-foundation.org>,
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



> On Jun 30, 2021, at 8:07 PM, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:
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
> Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
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

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
