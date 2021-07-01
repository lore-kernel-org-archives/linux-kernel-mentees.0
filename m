Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0912C11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8922361400
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 17:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8922361400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55F4841D76;
	Thu,  1 Jul 2021 17:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddYrHxAJ5G7u; Thu,  1 Jul 2021 17:03:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 756524010D;
	Thu,  1 Jul 2021 17:03:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53BEAC001A;
	Thu,  1 Jul 2021 17:03:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62ABAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE1D83C88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dubeyko-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LddQEf6b8KK4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C24D783C3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 17:03:52 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id s17so8122924oij.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M0Yqw0xxOZEekYTg3q3CvD7YLfizNegvaHh2b9l5Vmk=;
 b=A0GIXMDUpYvWxru961gfAFBLi6EXhfck8ja0MyrGOoL7HUOgoWq4tsdGQVzLdVYxYj
 mbJIrmLQwN2eLtby/ZSs1GYs3z6nAL2Csoj7vojKmmw2iJpi3391Jqe1T1pO5JuH6xP1
 Ztw3iJ6/vzU6lnra/kmmax89ndkVyKC+AJmBZdy0Zubw0+3YLY+CWUnrKF1tQwhwlCOu
 T6+/FDxJu3dwKHhNTt5epkLhGjgjnYsp+vhz2/cAPs3h+qoiO9mbhX2jQEaF056IpjVT
 l78BNYNCOWG16pBz4B+hTsKg9TCHDZDBc9sbuDDUKzUiEpZEO3xxGHytjkhH6qDUxpS0
 eOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M0Yqw0xxOZEekYTg3q3CvD7YLfizNegvaHh2b9l5Vmk=;
 b=o9rUvgeN4CmtLiDuiAwsQrdtm+j7UQRcBvQBqxBKOz+V211CKNmz+OlafGjU0VzQPD
 qjMmh+sTvTSY8CjAVEXIrGpMZEEGZuxwyq0CWRo5eQj3rkWGuDd8NS6+ttbhL+sSDbtO
 p8YSMRnSZs+A6rHnOtCw83pbJKD79BAhbZH707hG1oHefaL0UIBOO7KBZYZ0E9qUDEaH
 LZpc92UYO8nLbBd5KQIo6hlP2NSrb8cZ3U/CIgM3TuionEcWMKuhtusEGwBx8uVe8YDW
 M4ckpxrNnoQS+msLACXjdHKyjDOPRH8kPyIN+kJ5RQIrzRA+cCFxu4KYiHhP5VWuO4FA
 AXgw==
X-Gm-Message-State: AOAM532Aex0TJliTsnq19j8X4Esf8iaW/BkmLjFw47V576RuqdRP5byG
 3OH8lJB3ElqfelPCfXXh/frXOQ==
X-Google-Smtp-Source: ABdhPJwhHT2pfB50RcE85YuEIDJOKFqmMwPxxC26S94fj9TqVYDaTl0XBXOspHFIsPFOPiixueZ+0A==
X-Received: by 2002:a05:6808:1144:: with SMTP id
 u4mr2133470oiu.133.1625159031856; 
 Thu, 01 Jul 2021 10:03:51 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:4d57:e39e:c32f:13d2])
 by smtp.gmail.com with ESMTPSA id l10sm57404oti.9.2021.07.01.10.03.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:03:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v2 1/3] hfs: add missing clean-up in hfs_fill_super
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210701030756.58760-2-desmondcheongzx@gmail.com>
Date: Thu, 1 Jul 2021 10:03:50 -0700
Message-Id: <1A3F727E-8705-4164-951C-B2B99502998A@dubeyko.com>
References: <20210701030756.58760-1-desmondcheongzx@gmail.com>
 <20210701030756.58760-2-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: LKML <linux-kernel@vger.kernel.org>, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
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
> Before exiting hfs_fill_super, the struct hfs_find_data used in
> hfs_find_init should be passed to hfs_find_exit to be cleaned up, and
> to release the lock held on the btree.
> 
> The call to hfs_find_exit is missing from an error path. We add it
> back in by consolidating calls to hfs_find_exit for error paths.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> fs/hfs/super.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
> index 44d07c9e3a7f..12d9bae39363 100644
> --- a/fs/hfs/super.c
> +++ b/fs/hfs/super.c
> @@ -420,14 +420,12 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
> 	if (!res) {
> 		if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
> 			res =  -EIO;
> -			goto bail;
> +			goto bail_hfs_find;
> 		}
> 		hfs_bnode_read(fd.bnode, &rec, fd.entryoffset, fd.entrylength);
> 	}
> -	if (res) {
> -		hfs_find_exit(&fd);
> -		goto bail_no_root;
> -	}
> +	if (res)
> +		goto bail_hfs_find;
> 	res = -EINVAL;
> 	root_inode = hfs_iget(sb, &fd.search_key->cat, &rec);
> 	hfs_find_exit(&fd);
> @@ -443,6 +441,8 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
> 	/* everything's okay */
> 	return 0;
> 
> +bail_hfs_find:
> +	hfs_find_exit(&fd);
> bail_no_root:
> 	pr_err("get root inode failed\n");
> bail:
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
