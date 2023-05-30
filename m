Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6042C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 May 2023 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2180A417E5;
	Tue, 30 May 2023 08:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2180A417E5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=intwRy1x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gs_MeW0142Rq; Tue, 30 May 2023 08:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 14C6B404D4;
	Tue, 30 May 2023 08:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C6B404D4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E60A8C0036;
	Tue, 30 May 2023 08:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20467C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 08:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14CD40CC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 08:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14CD40CC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bq39RhXJmykI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 08:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDDD404D4
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CDDD404D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 08:26:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16E3261C0A;
 Tue, 30 May 2023 08:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE1EC433D2;
 Tue, 30 May 2023 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685435166;
 bh=gV7/E8xwGz8n4hz/QHyBLw7IDb3oqSnvYUBNMP6S4TQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=intwRy1xi/TyOKKIj28kVl1c3fBzPeTdM0ZH8LE3yH0DfOpESSMEA7TYMo1w/LINp
 3b9wJDjZIFy3D1oe4i4kedf7MYnHRavsHvF03cNPU27JE0z7XE05+dTtNkovfHco2c
 Ye0eHI8Sf76Dh6lu8JdK+4iQRxCEqdKyvjtD2uCJ52Bgt+64Y4VvLqaScTt6Sjkdsh
 Ajdt1mOHkzXScmyr4ZdJRDsP9IB/tSRl+IXpRzBpFH/gOHK2BM4X/UN/aUeQfHhwQx
 Up+RmjKnOpuPoGuib93EtTEOm34U1mkoK3ggUyJgey8BJXYU8t5o3GAaK4nHmgSjkY
 tbkC09OLGNvEw==
Date: Tue, 30 May 2023 10:26:01 +0200
From: Christian Brauner <brauner@kernel.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH v3] fs/sysv: Null check to prevent null-ptr-deref bug
Message-ID: <20230530-zenit-radeln-06417ce5fe85@brauner>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528184422.596947-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528184422.596947-1-princekumarmaurya06@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 chenzhongjin@huawei.com, syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
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

On Sun, May 28, 2023 at 11:44:22AM -0700, Prince Kumar Maurya wrote:
> sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on
> that leads to the null-ptr-deref bug.
> 
> Reported-by: syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=aad58150cbc64ba41bdc 
> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
> Change since v2: Updated subject and added Reported-by and closes tags.
> 
>  fs/sysv/itree.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/sysv/itree.c b/fs/sysv/itree.c
> index b22764fe669c..3a6b66e719fd 100644
> --- a/fs/sysv/itree.c
> +++ b/fs/sysv/itree.c
> @@ -145,6 +145,8 @@ static int alloc_branch(struct inode *inode,
>  		 */
>  		parent = block_to_cpu(SYSV_SB(inode->i_sb), branch[n-1].key);
>  		bh = sb_getblk(inode->i_sb, parent);
> +		if (!bh)
> +			break;

When you break here you'll hit:

/* Allocation failed, free what we already allocated */
for (i = 1; i < n; i++)
        bforget(branch[i].bh);
for (i = 0; i < n; i++)
        sysv_free_block(inode->i_sb, branch[i].key);

below. The cleanup paths were coded in the assumption that sb_getblk()
can't fail. So bforget() can assume that branch[i].bh has been allocated
and set up. So that bforget(branch[i].bh) is your next pending NULL
deref afaict.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
