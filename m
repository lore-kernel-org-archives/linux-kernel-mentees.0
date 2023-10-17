Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E22CCDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 13:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF2D60E6A;
	Mon, 23 Oct 2023 13:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF2D60E6A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dVY4G6Hq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJgBerec5lsx; Mon, 23 Oct 2023 13:28:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BC9A360EC4;
	Mon, 23 Oct 2023 13:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9A360EC4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97C35C0039;
	Mon, 23 Oct 2023 13:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D59FC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 13:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BFB642074
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 13:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFB642074
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dVY4G6Hq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5uyGCUYN-Tj
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 13:28:25 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFACC41FE7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 13:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFACC41FE7
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ca6809fb8aso20329595ad.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698067704; x=1698672504;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sa6E4Qj1oc9mMqsv5L9bh8Mbh/T7iNaz8w1q2WI91v8=;
 b=dVY4G6HqeHgKkEI7fdkGso339BRsR+5xcQdeKO5n+zKTf87NDTnAmEEA8F0QSQ6iL4
 0NxKW6jgT2WUw1gpEeBPDDV5jxMWj2Y2so1ykuyhMIAahfgvXTlWc/xwkUbX5znzrOYR
 w+pecZRZZzuReUI52rvvwxh3z3yIcbHVn0TMjvOLh44bwmq5lK1MGub1U2ZDa9dqGtWz
 QaLlHFvCE924MdOcRWi6uXQe5J5dPwkYTtDpkddZ+Vk4M1OkDbWJNO5vpwA/9IO19oyk
 TTbXDCEhOtyH70c1fUxwDjAhjgE8GPMuhbMpb6J500TPILLyQ8feGnQf1DRVSAn7nN6E
 A8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067704; x=1698672504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa6E4Qj1oc9mMqsv5L9bh8Mbh/T7iNaz8w1q2WI91v8=;
 b=Tcx2Q2x7tSBsPD7Re1lR3zU2kP04NdCmHu8iYsMWpTlxKm4986Hg+p1oPiETPmapfW
 I/nnrVz4lNWLpG9xmVszL5BMpHaM9XNO5Bewcq5PLwo/eQIvnW1efPt1PawjUQ2grpfm
 TkicphWfvmPlWs+i/wRjSUdEGXoX67HZKWfw/pCvYx+swF63vU5nPJLP30vIwD+e7uZJ
 FAjUnnIdGBHDq/9YJxL6XfVDbaQQe3nOghaLjoPra5gtkg9/2kbe0vJuDp2TgZKFPgKU
 RDTYg//IWG+x6ubwtzBwIKpPCoU467XlVLi73R1WKY2zqQ1wk4f+LeyLqH9y8t3ItqhT
 m4eQ==
X-Gm-Message-State: AOJu0YzmswCPL96RhuT8a/35WvXKEY10uxkbtXK50SCJ+ks3C0u4WCju
 OQFxfz/N3PSuWU4ypSpx4Kg=
X-Google-Smtp-Source: AGHT+IFvottFAmnA7SB2WAWQGZ9+jtpVVAczNTCh+JHMH8eODQoBHsYfdkkToljNxaQi/f+AKQzL6g==
X-Received: by 2002:a17:902:da8e:b0:1ca:4681:eb39 with SMTP id
 j14-20020a170902da8e00b001ca4681eb39mr7180734plx.17.1698067704143; 
 Mon, 23 Oct 2023 06:28:24 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.177]) by smtp.gmail.com with ESMTPSA id
 u15-20020a170902e80f00b001c9d2360b2asm5898797plg.22.2023.10.23.06.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 06:28:23 -0700 (PDT)
Message-ID: <339774d7-b50b-b4bc-7c49-b128b781428b@gmail.com>
Date: Tue, 17 Oct 2023 17:35:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in dbAdjTree
Content-Language: en-US
To: dave.kleikamp@oracle.com, shaggy@kernel.org
References: <20231017120356.55322-1-ghandatmanas@gmail.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20231017120356.55322-1-ghandatmanas@gmail.com>
Cc: syzbot+39ba34a099ac2e9bd3cb@syzkaller.appspotmail.com,
 jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Just a friendly remainder

On 17/10/23 17:33, Manas Ghandat wrote:
> Currently there is a bound check missing in the dbAdjTree while
> accessing the dmt_stree. To add the required check added the bool is_ctl
> which is required to determine the size as suggest in the following
> commit.
> https://lore.kernel.org/linux-kernel-mentees/f9475918-2186-49b8-b801-6f0f9e75f4fa@oracle.com/
>
> Reported-by: syzbot+39ba34a099ac2e9bd3cb@syzkaller.appspotmail.com
> Fixes: https://syzkaller.appspot.com/bug?extid=39ba34a099ac2e9bd3cb
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
>   fs/jfs/jfs_dmap.c | 57 ++++++++++++++++++++++++++---------------------
>   1 file changed, 31 insertions(+), 26 deletions(-)
>
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index 88afd108c2dd..57fba21994c3 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -63,10 +63,10 @@
>    */
>   static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   			int nblocks);
> -static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval);
> -static int dbBackSplit(dmtree_t * tp, int leafno);
> -static int dbJoin(dmtree_t * tp, int leafno, int newval);
> -static void dbAdjTree(dmtree_t * tp, int leafno, int newval);
> +static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval, bool is_ctl);
> +static int dbBackSplit(dmtree_t * tp, int leafno, bool is_ctl);
> +static int dbJoin(dmtree_t * tp, int leafno, int newval, bool is_ctl);
> +static void dbAdjTree(dmtree_t * tp, int leafno, int newval, bool is_ctl);
>   static int dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc,
>   		    int level);
>   static int dbAllocAny(struct bmap * bmp, s64 nblocks, int l2nb, s64 * results);
> @@ -2096,7 +2096,7 @@ static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   		 * system.
>   		 */
>   		if (dp->tree.stree[word] == NOFREE)
> -			dbBackSplit((dmtree_t *) & dp->tree, word);
> +			dbBackSplit((dmtree_t *) & dp->tree, word, false);
>   
>   		dbAllocBits(bmp, dp, blkno, nblocks);
>   	}
> @@ -2182,7 +2182,7 @@ static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   			 * the binary system of the leaves if need be.
>   			 */
>   			dbSplit(tp, word, BUDMIN,
> -				dbMaxBud((u8 *) & dp->wmap[word]));
> +				dbMaxBud((u8 *) & dp->wmap[word]),false);
>   
>   			word += 1;
>   		} else {
> @@ -2222,7 +2222,7 @@ static void dbAllocBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   				 * system of the leaves to reflect the current
>   				 * allocation (size).
>   				 */
> -				dbSplit(tp, word, size, NOFREE);
> +				dbSplit(tp, word, size, NOFREE, false);
>   
>   				/* get the number of dmap words handled */
>   				nw = BUDSIZE(size, BUDMIN);
> @@ -2329,7 +2329,7 @@ static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   			/* update the leaf for this dmap word.
>   			 */
>   			rc = dbJoin(tp, word,
> -				    dbMaxBud((u8 *) & dp->wmap[word]));
> +				    dbMaxBud((u8 *) & dp->wmap[word]),false);
>   			if (rc)
>   				return rc;
>   
> @@ -2362,7 +2362,7 @@ static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   
>   				/* update the leaf.
>   				 */
> -				rc = dbJoin(tp, word, size);
> +				rc = dbJoin(tp, word, size, false);
>   				if (rc)
>   					return rc;
>   
> @@ -2514,16 +2514,16 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
>   		 * that it is at the front of a binary buddy system.
>   		 */
>   		if (oldval == NOFREE) {
> -			rc = dbBackSplit((dmtree_t *) dcp, leafno);
> +			rc = dbBackSplit((dmtree_t *) dcp, leafno, true);
>   			if (rc) {
>   				release_metapage(mp);
>   				return rc;
>   			}
>   			oldval = dcp->stree[ti];
>   		}
> -		dbSplit((dmtree_t *) dcp, leafno, dcp->budmin, newval);
> +		dbSplit((dmtree_t *) dcp, leafno, dcp->budmin, newval, true);
>   	} else {
> -		rc = dbJoin((dmtree_t *) dcp, leafno, newval);
> +		rc = dbJoin((dmtree_t *) dcp, leafno, newval, true);
>   		if (rc) {
>   			release_metapage(mp);
>   			return rc;
> @@ -2554,7 +2554,7 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
>   				 */
>   				if (alloc) {
>   					dbJoin((dmtree_t *) dcp, leafno,
> -					       oldval);
> +					       oldval, true);
>   				} else {
>   					/* the dbJoin() above might have
>   					 * caused a larger binary buddy system
> @@ -2564,9 +2564,9 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
>   					 */
>   					if (dcp->stree[ti] == NOFREE)
>   						dbBackSplit((dmtree_t *)
> -							    dcp, leafno);
> +							    dcp, leafno, true);
>   					dbSplit((dmtree_t *) dcp, leafno,
> -						dcp->budmin, oldval);
> +						dcp->budmin, oldval, true);
>   				}
>   
>   				/* release the buffer and return the error.
> @@ -2614,7 +2614,7 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
>    *
>    * serialization: IREAD_LOCK(ipbmap) or IWRITE_LOCK(ipbmap) held on entry/exit;
>    */
> -static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
> +static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval, bool is_ctl)
>   {
>   	int budsz;
>   	int cursz;
> @@ -2636,7 +2636,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
>   		while (cursz >= splitsz) {
>   			/* update the buddy's leaf with its new value.
>   			 */
> -			dbAdjTree(tp, leafno ^ budsz, cursz);
> +			dbAdjTree(tp, leafno ^ budsz, cursz, is_ctl);
>   
>   			/* on to the next size and buddy.
>   			 */
> @@ -2648,7 +2648,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
>   	/* adjust the dmap tree to reflect the specified leaf's new
>   	 * value.
>   	 */
> -	dbAdjTree(tp, leafno, newval);
> +	dbAdjTree(tp, leafno, newval, is_ctl);
>   }
>   
>   
> @@ -2679,7 +2679,7 @@ static void dbSplit(dmtree_t * tp, int leafno, int splitsz, int newval)
>    *
>    * serialization: IREAD_LOCK(ipbmap) or IWRITE_LOCK(ipbmap) held on entry/exit;
>    */
> -static int dbBackSplit(dmtree_t * tp, int leafno)
> +static int dbBackSplit(dmtree_t * tp, int leafno, bool is_ctl)
>   {
>   	int budsz, bud, w, bsz, size;
>   	int cursz;
> @@ -2730,7 +2730,7 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
>   				 * system in two.
>   				 */
>   				cursz = leaf[bud] - 1;
> -				dbSplit(tp, bud, cursz, cursz);
> +				dbSplit(tp, bud, cursz, cursz, is_ctl);
>   				break;
>   			}
>   		}
> @@ -2758,7 +2758,7 @@ static int dbBackSplit(dmtree_t * tp, int leafno)
>    *
>    * RETURN VALUES: none
>    */
> -static int dbJoin(dmtree_t * tp, int leafno, int newval)
> +static int dbJoin(dmtree_t * tp, int leafno, int newval, bool is_ctl)
>   {
>   	int budsz, buddy;
>   	s8 *leaf;
> @@ -2813,12 +2813,12 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
>   			if (leafno < buddy) {
>   				/* leafno is the left buddy.
>   				 */
> -				dbAdjTree(tp, buddy, NOFREE);
> +				dbAdjTree(tp, buddy, NOFREE, is_ctl);
>   			} else {
>   				/* buddy is the left buddy and becomes
>   				 * leafno.
>   				 */
> -				dbAdjTree(tp, leafno, NOFREE);
> +				dbAdjTree(tp, leafno, NOFREE, is_ctl);
>   				leafno = buddy;
>   			}
>   
> @@ -2831,7 +2831,7 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
>   
>   	/* update the leaf value.
>   	 */
> -	dbAdjTree(tp, leafno, newval);
> +	dbAdjTree(tp, leafno, newval, is_ctl);
>   
>   	return 0;
>   }
> @@ -2852,15 +2852,20 @@ static int dbJoin(dmtree_t * tp, int leafno, int newval)
>    *
>    * RETURN VALUES: none
>    */
> -static void dbAdjTree(dmtree_t * tp, int leafno, int newval)
> +static void dbAdjTree(dmtree_t * tp, int leafno, int newval, bool is_ctl)
>   {
>   	int lp, pp, k;
> -	int max;
> +	int max, size;
> +
> +	size = is_ctl ? CTLTREESIZE : TREESIZE;
>   
>   	/* pick up the index of the leaf for this leafno.
>   	 */
>   	lp = leafno + le32_to_cpu(tp->dmt_leafidx);
>   
> +	if (lp > size || lp < 0)
> +		return;
> +
>   	/* is the current value the same as the old value ?  if so,
>   	 * there is nothing to do.
>   	 */
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
