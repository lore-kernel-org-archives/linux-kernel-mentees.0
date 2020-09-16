Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4320C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:42:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49F092076B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z6DxVqWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49F092076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D177D86DE0;
	Wed, 16 Sep 2020 05:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5ieWOWLOekl; Wed, 16 Sep 2020 05:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA69186CE3;
	Wed, 16 Sep 2020 05:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FB67C0864;
	Wed, 16 Sep 2020 05:42:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C89C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C6EEF869DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNlvdmMqryXS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4229D8692E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:41:59 +0000 (UTC)
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88F1D206F7;
 Wed, 16 Sep 2020 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600234918;
 bh=hSP4gRwVEWhysa34HuwuUeUWtwGLR+7qBuvWJ/US/xI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z6DxVqWLpWKYFixD+gwLxBRh1iUCN5ANUHZOZ773rz+A3XDsFwA3/qz5POT3/X5pv
 MEO3ATs0i1zhe9mEIRHRP3dHjUStgDnGX5eRK4iG4LawIRdKytaRh1Wlvx2gNGSION
 MwoogpUb3sI4lAbZ2Mi8BbgtPd4HPKJXYKsFyazc=
Date: Tue, 15 Sep 2020 22:41:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20200916054157.GC825@sol.localdomain>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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

On Wed, Sep 16, 2020 at 10:56:56AM +0530, Anant Thazhemadam wrote:
> The KMSAN bug report for the bug indicates that there exists;
> Local variable ----nd@do_file_open_root created at:
>  do_file_open_root+0xa4/0xb40 fs/namei.c:3385
>  do_file_open_root+0xa4/0xb40 fs/namei.c:3385
> 
> Initializing nd fixes this issue, and doesn't break anything else either
> 
> Fixes: https://syzkaller.appspot.com/bug?extid=4191a44ad556eacc1a7a
> Reported-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
> Tested-by: syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>  fs/namei.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index e99e2a9da0f7..b27382586209 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3404,7 +3404,7 @@ struct file *do_filp_open(int dfd, struct filename *pathname,
>  struct file *do_file_open_root(struct dentry *dentry, struct vfsmount *mnt,
>  		const char *name, const struct open_flags *op)
>  {
> -	struct nameidata nd;
> +	struct nameidata nd = {};
>  	struct file *file;
>  	struct filename *filename;
>  	int flags = op->lookup_flags | LOOKUP_ROOT;

Looking at the actual KMSAN report, it looks like it's nameidata::dir_mode or
nameidata::dir_uid that is uninitialized.  You need to figure out the correct
solution, not just blindly initialize with zeroes -- that could hide a bug.
Is there a bug that is preventing these fields from being initialized to the
correct values, are these fields being used when they shouldn't be, etc...

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
