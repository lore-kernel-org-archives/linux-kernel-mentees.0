Return-Path: <SRS0=Rn35=ZK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3208AC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 00:01:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CC520730
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 00:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=themaw.net header.i=@themaw.net header.b="sgnkTUOE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dq8Ooen9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CC520730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=themaw.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E63085C2E;
	Mon, 18 Nov 2019 00:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETksh8kKRwf4; Mon, 18 Nov 2019 00:01:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FC8285BE4;
	Mon, 18 Nov 2019 00:01:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 485B7C0880;
	Mon, 18 Nov 2019 00:01:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E58AAC07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 00:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DC5AD203CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 00:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmMntQeiLPVz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 00:01:26 +0000 (UTC)
X-Greylist: delayed 00:11:10 by SQLgrey-1.7.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by silver.osuosl.org (Postfix) with ESMTPS id 9171A203CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 00:01:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4A5B58A0;
 Sun, 17 Nov 2019 18:50:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 17 Nov 2019 18:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 0DjwSwNuuCOp/OVQlpsoTSIJMgZBoS/7Z1vmhjDwt88=; b=sgnkTUOEhsKBKU2Q
 gjSRtuiccaNpAL1BC2O70eveU06JEYJwX9NfN2o6/zZjttsM0YXC9qySPFDxgVrq
 kLVW2Sr64Etb5+thTcm/NKTs4S6XrbnGL4hvm4e/0v/cA8lbvVVVtMn9lSJ32I2a
 ONukdCXJiHUEh9AzJtSqJZgjVadd9dEf/v6zytXehAWxRQdrhkQWP92oBZFDHril
 Q3AMW+hGUGEqTZQHPHXb+6Gk4iBy4mNZpxqwVXfYiEjZDJMOPzYYAoR8t0+Ctb/F
 Q7e+KzGrA2bMqiZUirDdkJURGeAh3HDiBSwr2Q0jfO8SnE4kXssOQACWjbjq6RxJ
 i0BYQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0DjwSwNuuCOp/OVQlpsoTSIJMgZBoS/7Z1vmhjDwt
 88=; b=Dq8Ooen9yYhuVCb5lEIsv59dJ9phV36/YmypYdeivu4bcsXV62dsea9Lx
 WJBLLi+l+VwOGt6MhHI1N8c+1Mtu+lNSbyJ2krLJtjOTWF+/IfzfdBMocNg5nDbd
 8a1Hfpjkm5nNF0kg8HjffuBmX6XoWsVQ6VUs15JWQc48XkOCpg+mj3RIzgKJKg/r
 jHAH2egLD1SjSWu31m8T4CA1TPl9gDgfrbVkimn8RelG1ysNZIavU1q87TvXu0HQ
 Gdr7tfjGNGKRM3p4N/EN/TT55yb3FcC95LzZumpkoKnYskvDn/mQUqd7nXO5KwZg
 YfoLvMrf68z8sS780MMipoO3ttluA==
X-ME-Sender: <xms:ttzRXf1s3EVTLsHWM8UBPBSxcQSkH46gE8g8aMID0dmt9CqynNrycA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeggedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
 mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucfkphepuddukedrvddtle
 drudekiedrudekjeenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghm
 rgifrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ttzRXSWrJkmI7JeaYDMQFhNtz4vSeXiZLmyFLDHg5QodLVYZoiGgZA>
 <xmx:ttzRXa4JAYHcWI8_pmevLcvWXCb2pKBgYss9ymvillD0DVsYXOGCGg>
 <xmx:ttzRXZJ8iruzVRcZjifRg7misJE76fjRlibLXSNY5CxenWNsDj-wyA>
 <xmx:t9zRXVQx4CNoqQ65CSdZFFgq_d43TfN_dMhIW5DBEnWezZ1x_GnFAA>
Received: from mickey.themaw.net (unknown [118.209.186.187])
 by mail.messagingengine.com (Postfix) with ESMTPA id B758C8005B;
 Sun, 17 Nov 2019 18:50:09 -0500 (EST)
Message-ID: <a5b17c43fbd2b186240252b5a7fbef9c6a0ad54d.camel@themaw.net>
From: Ian Kent <raven@themaw.net>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, corbet@lwn.net
Date: Mon, 18 Nov 2019 07:50:06 +0800
In-Reply-To: <20191117172436.8831-4-jaskaransingh7654321@gmail.com>
References: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
 <20191117172436.8831-4-jaskaransingh7654321@gmail.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Cc: mszeredi@redhat.com, ebiggers@google.com, linux-doc@vger.kernel.org,
 neilb@suse.com, linux-kernel@vger.kernel.org, tobin@kernel.org,
 stefanha@redhat.com, mchehab+samsung@kernel.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, christian@brauner.io
Subject: Re: [Linux-kernel-mentees] [PATCH v2 3/3] docs: filesystems: Add
 mount map description in Content
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

On Sun, 2019-11-17 at 22:54 +0530, Jaskaran Singh wrote:
> The second paragraph of the content section does not properly
> describe how mount points are determined by autofs.
> 
> Replace the lines detailing how the determination of these mount
> points is "ad hoc" by a short description of the mount map syntax
> used by autofs.
> 
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  Documentation/filesystems/autofs.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/autofs.rst
> b/Documentation/filesystems/autofs.rst
> index 2f704e9c5dc0..c17f6bf0eb5d 100644
> --- a/Documentation/filesystems/autofs.rst
> +++ b/Documentation/filesystems/autofs.rst
> @@ -49,9 +49,10 @@ extra properties as described in the next section.
>  Objects can only be created by the automount daemon: symlinks are
>  created with a regular `symlink` system call, while directories and
>  mount traps are created with `mkdir`.  The determination of whether
> a
> -directory should be a mount trap or not is quite ad hoc, largely for
> -historical reasons, and is determined in part by the
> -*direct*/*indirect*/*offset* mount options, and the *maxproto* mount
> option.
> +directory should be a mount trap is based on a master map. This
> master
> +map is consulted by autofs to determine which directories are mount
> +points. Mount points can be *direct*/*indirect*/*offset*.
> +On most systems, the default master map is located at
> */etc/auto.master*.

Ok, lets just use this for now since it's better than what was
originally there and I'll put together an update after these
changes are merged.

What happens is actually a bit more complicated, the opening
sentence above this is talking about what happens with maps
associated with autofs mount points given in the master map,
not so much master map entries themselves.

>  
>  If neither the *direct* or *offset* mount options are given (so the
>  mount is considered to be *indirect*), then the root directory is

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
