Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB3CC3DA79
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Dec 2022 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1148C4037A;
	Mon, 26 Dec 2022 15:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1148C4037A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=acvZznAk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cC4enIBC7nT; Mon, 26 Dec 2022 15:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9C64340357;
	Mon, 26 Dec 2022 15:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C64340357
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6005FC0032;
	Mon, 26 Dec 2022 15:02:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ADCFC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Dec 2022 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F199680C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Dec 2022 15:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F199680C19
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=acvZznAk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQcN4HWkbnKX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Dec 2022 15:02:42 +0000 (UTC)
X-Greylist: delayed 00:24:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00AD80BBF
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D00AD80BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Dec 2022 15:02:41 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BQEU0nO028865; Mon, 26 Dec 2022 06:31:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=IshxhtlSnyCL5O8xZwcyOXGGGBA63RqRdErQaGSn5a4=;
 b=acvZznAkym3+fX7zskzF6uAXS08r9ootJry0bIMmoVRjDpJRowRs+FKzjM9NB+pwzGjt
 LK7jmt0MvfoyWwqOowoZZMQF1Hx62lMZMU7B9anc8Oxqg4VMcgVKaSk10pxV8xQyfswj
 +ozyWnoZVEJxydSvDUxiZaigAA3wppSjVwsS56FNq7Ccli/UZVVgW/yma9QbKKYSZCwl
 cXUA7gWlC63H/LiWS5C9iMKPzBt3jHhKzrxEW9Cos2+P7UX/E76OLMhfP0CAZ+05EPd4
 B54Jd3FSHN507ZBA1gOHxrkP0kUvzz2/XcUU9zetWrKMqRGaJCD55m+EkYEjgHk9PKlG zQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com
 [147.11.82.254])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk8941v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Dec 2022 06:31:22 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 26 Dec 2022 06:31:24 -0800
Received: from pek-lpd-ccm4.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 26 Dec 2022 06:31:21 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <mail@anirudhrb.com>
Subject: How can this fix prevent information from leaking to user space and
 prevent the kernel from crashing?
Date: Mon, 26 Dec 2022 22:31:19 +0800
Message-ID: <20221226143119.3719096-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20210506185655.7118-1-mail@anirudhrb.com>
References: <20210506185655.7118-1-mail@anirudhrb.com>
MIME-Version: 1.0
X-Proofpoint-GUID: SPQ9vl3mT4fnrN82mEfX-A8yj0IzfWGe
X-Proofpoint-ORIG-GUID: SPQ9vl3mT4fnrN82mEfX-A8yj0IzfWGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_11,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212260126
Cc: akpm@osdl.org, tytso@mit.edu,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 adilger.kernel@dilger.ca, shaggy@austin.ibm.com,
 syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com,
 linux-ext4@vger.kernel.org, alex@clusterfs.com
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

Hi, Anirudh Rayabharam

I verify this patch in the following environment, using reproducer: https://syzkaller.appspot.com/x/repro.c?x=122870ff800000

1. kernel version:  kernel version 5.15.72 
2. gcc 11.3
3. libc 2.35

Because the kernel version 5.15.72 already contains this patch ce3aba43599f0b50adbebff133df8d08a3d5fffe, 
So I deleted this patch to make a kernel image to reproduce the problem,
On the other hand, I reserve this patch to verify that the problem has been fixed,
The result of the experiment is that no matter whether this patch is applied or not, 
this problem cannot be reproduced in kernel version 5.15.72.

In addition, I am also very confused. There are three places to initialize "eh_generation". 
There is no other reference to the parameter "eh_generation" in all the source code of the kernel,
At the same time, there is no indirect operation on the parameter "eh_generation" in reproducer,
How can this fix prevent information from leaking to user space and prevent the kernel from crashing?

> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 77c84d6f1af6..677d4821bcc1 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -825,6 +825,7 @@ void ext4_ext_tree_init(handle_t *handle, struct inode *inode)
>  	eh->eh_entries = 0;
>  	eh->eh_magic = EXT4_EXT_MAGIC;
>  	eh->eh_max = cpu_to_le16(ext4_ext_space_root(inode, 0));
> +	eh->eh_generation = 0;
>  	ext4_mark_inode_dirty(handle, inode);
>  }
>  
> @@ -1090,6 +1091,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
>  	neh->eh_max = cpu_to_le16(ext4_ext_space_block(inode, 0));
>  	neh->eh_magic = EXT4_EXT_MAGIC;
>  	neh->eh_depth = 0;
> +	neh->eh_generation = 0;
>  
>  	/* move remainder of path[depth] to the new leaf */
>  	if (unlikely(path[depth].p_hdr->eh_entries !=
> @@ -1167,6 +1169,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
>  		neh->eh_magic = EXT4_EXT_MAGIC;
>  		neh->eh_max = cpu_to_le16(ext4_ext_space_block_idx(inode, 0));
>  		neh->eh_depth = cpu_to_le16(depth - i);
> +		neh->eh_generation = 0;
>  		fidx = EXT_FIRST_INDEX(neh);
>  		fidx->ei_block = border;
>  		ext4_idx_store_pblock(fidx, oldblock);
> -- 
> 2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
