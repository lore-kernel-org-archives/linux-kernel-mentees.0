Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D84E784AB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 04:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3F260FCA;
	Mon,  2 Oct 2023 04:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3F260FCA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HeGchRNU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTb5jYZjxTAa; Mon,  2 Oct 2023 04:35:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D21F2607A1;
	Mon,  2 Oct 2023 04:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21F2607A1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B15E4C0039;
	Mon,  2 Oct 2023 04:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08596C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7A5B60FCA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A5B60FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lE4mcg8cTWiv
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:56 +0000 (UTC)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AC57607A1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC57607A1
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-1c5c91bec75so119367245ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Oct 2023 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696221355; x=1696826155;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+QJdTadjS8UJxjgx2mNiZLVXiy8/ENWxPVhe2tdfgqY=;
 b=HeGchRNUhSQ7NZXbgoIs6DRkT5G78h2DAPXhlytBMKFi6GKpq3PXwPoLY9xh44fR1a
 hkK5wj0+SMw/eIJ9vVl3Md96hygBeb/mbR0kDFnjDvW/aGn5pPGWuSsBeKgDmT74yYaT
 O30FHZCphby60ev5vJKsqLKgHDt7bEEhn+Mf8wKHjmBM6NcGygcmdBSEp8tKq83iRGb0
 kbfQIXax8Fn+KpxxtSwU0r5fLUd1CfZNFKYF9Nm1m0UToz3r6/9a73QI/7egFLbqFx8m
 nFmwE1U3Kjp/NsbMA2rm4hfJ8lfBOAYwfMFO5lrJ7YrLUpUTlVeXnAsyN0rVFzJ269Mt
 6qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696221355; x=1696826155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QJdTadjS8UJxjgx2mNiZLVXiy8/ENWxPVhe2tdfgqY=;
 b=BuUStMuAFKpx1J8aih1pg17mx12tv8zS7icD3h1DtTVwO0LoLdYFz3ZJMZ2I25ABmy
 qcnvzk4yqLzwfR/aDVr8RxNOilJF7r8b3qgysfwAQIqaHsX0GMnS+oObaPlgmDGno9Ck
 nmtnVy2Z5Ite75NMos9E6we1DyT2X2jyJ5pdDU1xABQHPpzmvyDMaKRQuM1ISliwdCst
 jW6qAn3B0KaJA8liYh39JpBYTSirQIUzagCFydh2HTk+mDEepBy0OjkYpAw7oVTFR0sl
 aoW8pVd9bAy3Py5jvYbsLCbPmeFFKZBb1YIppWzKB2lnwHlIj5WrTA/dTBxmDH4maWNz
 A6+Q==
X-Gm-Message-State: AOJu0Yz5klwNMZ+1rEcd+PO0HWfpybbT0em0vTbfs5jVJc+gmR93tvBM
 akAObyinBE5PT0vlKFPDJAM=
X-Google-Smtp-Source: AGHT+IGi7XaUnIoApjJmGGM4nSA7Rar2ynZKxKiTDnf7E5OilAOUT8g+toeKDeeP3+tg4AzHJq3dqw==
X-Received: by 2002:a17:903:2587:b0:1c2:218c:3762 with SMTP id
 jb7-20020a170903258700b001c2218c3762mr7020364plb.42.1696221355305; 
 Sun, 01 Oct 2023 21:35:55 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.176]) by smtp.gmail.com with ESMTPSA id
 m10-20020a170902768a00b001c7276398f1sm9339272pll.164.2023.10.01.21.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 21:35:54 -0700 (PDT)
Message-ID: <7ce1a9af-e966-2d1e-2e80-bb019a35a22b@gmail.com>
Date: Mon, 2 Oct 2023 10:05:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] jfs: fix array-index-out-of-bounds in dbFindLeaf
Content-Language: en-US
To: dave.kleikamp@oracle.com, shaggy@kernel.org
References: <20230922120341.10805-1-ghandatmanas@gmail.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20230922120341.10805-1-ghandatmanas@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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

just a friendly ping

On 22/09/23 17:33, Manas Ghandat wrote:
> Currently while searching for dmtree_t for sufficient free blocks there
> is an array out of bounds while getting element in tp->dm_stree. To add
> the required check for out of bound we first need to determine the type
> of dmtree. Thus added an extra parameter to dbFindLeaf so that the type
> of tree can be determined and the required check can be applied.
>
> Reported-by: syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=aea1ad91e854d0a83e04
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
> V1 -> V2: Updated dbFindLeaf function.
>
>   fs/jfs/jfs_dmap.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index a14a0f18a4c4..cee5164c4879 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -87,7 +87,7 @@ static int dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno,
>   static int dbExtend(struct inode *ip, s64 blkno, s64 nblocks, s64 addnblocks);
>   static int dbFindBits(u32 word, int l2nb);
>   static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno);
> -static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx);
> +static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, int type);
>   static int dbFreeBits(struct bmap * bmp, struct dmap * dp, s64 blkno,
>   		      int nblocks);
>   static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
> @@ -1709,7 +1709,7 @@ static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno)
>   		 * dbFindLeaf() returns the index of the leaf at which
>   		 * free space was found.
>   		 */
> -		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx);
> +		rc = dbFindLeaf((dmtree_t *) dcp, l2nb, &leafidx, 0);
>   
>   		/* release the buffer.
>   		 */
> @@ -1956,7 +1956,7 @@ dbAllocDmapLev(struct bmap * bmp,
>   	 * free space.  if sufficient free space is found, dbFindLeaf()
>   	 * returns the index of the leaf at which free space was found.
>   	 */
> -	if (dbFindLeaf((dmtree_t *) & dp->tree, l2nb, &leafidx))
> +	if (dbFindLeaf((dmtree_t *) &dp->tree, l2nb, &leafidx, 1))
>   		return -ENOSPC;
>   
>   	if (leafidx < 0)
> @@ -2920,14 +2920,18 @@ static void dbAdjTree(dmtree_t * tp, int leafno, int newval)
>    *	leafidx	- return pointer to be set to the index of the leaf
>    *		  describing at least l2nb free blocks if sufficient
>    *		  free blocks are found.
> + *	type	- type of dmtree
>    *
>    * RETURN VALUES:
>    *	0	- success
>    *	-ENOSPC	- insufficient free blocks.
>    */
> -static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
> +static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, int type)
>   {
>   	int ti, n = 0, k, x = 0;
> +	int max_size;
> +
> +	max_size = type ? TREESIZE : CTLTREESIZE;
>   
>   	/* first check the root of the tree to see if there is
>   	 * sufficient free space.
> @@ -2948,6 +2952,8 @@ static int dbFindLeaf(dmtree_t * tp, int l2nb, int *leafidx)
>   			/* sufficient free space found.  move to the next
>   			 * level (or quit if this is the last level).
>   			 */
> +			if (x + n > max_size)
> +				return -ENOSPC;
>   			if (l2nb <= tp->dmt_stree[x + n])
>   				break;
>   		}
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
