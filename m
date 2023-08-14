Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767B5EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 01:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E182B81551;
	Mon, 14 Aug 2023 01:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E182B81551
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FOB/qY/P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfuPl179py36; Mon, 14 Aug 2023 01:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C912981514;
	Mon, 14 Aug 2023 01:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C912981514
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BF3BC0072;
	Mon, 14 Aug 2023 01:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21140C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 089E860E90
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089E860E90
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=FOB/qY/P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_QWGjG-sXjS
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D092960C2E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D092960C2E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C0E061135
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CC7C433CA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 01:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691974946;
 bh=JEEY10hBYz8RwhXPPVD6zF4+YQYQsXCRSg8FIpcrlVY=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=FOB/qY/PpdgHCtif2jsnF7NTFxHEmFbrI3NnLit3qzbbEwG0sHPOCAfEhTpS58s2i
 7zrZcLz9cA8dfipUEWmWoJb6euJQ4aIjWtG1Sof3Ho+0SREVOR0PINgxS/mhpwuPQI
 rE5ggXMCOD/e6KwTLUByfD0d6tLgZ+JNkip6wF1jenLYVMO7zXpSYFKgeqZ2z8nFEg
 2wKesPUUbsPrtaP76RRB4nZrB5W+FPUgMAWNBgl6zoeZ8fWe9NnL5aLs0q6auiTwEL
 IbWzHcbEyKtJXyDyigng30ra7xZpMpckRBQtSebqarla6TJdx/pJrXvn2S1g7kRRbn
 0Y9UEJMKiA5dg==
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-56e0d6651fbso687636eaf.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 18:02:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy73dz6JOi540YxzvGnQvjOvJyzhfsRt1+rrP/dH9cWZSWkGzrx
 xI36Gq4LBT0jxJKV7c6s6t4aMUVgbIaqQDns4Ok=
X-Google-Smtp-Source: AGHT+IEZBAOsoH5R9sMuTJ0tT6LAbfT4e8g0Coz08nyYUPTnQN4yEKjF5zsRrsRYGnMLm7X+87vqmfeDUsDdJWyaSG8=
X-Received: by 2002:a05:6870:e985:b0:19f:e5a8:7525 with SMTP id
 r5-20020a056870e98500b0019fe5a87525mr7150030oao.12.1691974945110; Sun, 13 Aug
 2023 18:02:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:14c:0:b0:4e8:f6ff:2aab with HTTP; Sun, 13 Aug 2023
 18:02:24 -0700 (PDT)
In-Reply-To: <20230813055948.12513-1-ghandatmanas@gmail.com>
References: <20230813055948.12513-1-ghandatmanas@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 14 Aug 2023 10:02:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8A9+Zcg=8wLV0h4fdcvybp=BB-a0yRKSTHmk0sQi26_A@mail.gmail.com>
Message-ID: <CAKYAXd8A9+Zcg=8wLV0h4fdcvybp=BB-a0yRKSTHmk0sQi26_A@mail.gmail.com>
Subject: Re: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
To: Manas Ghandat <ghandatmanas@gmail.com>, anton@tuxera.com
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org
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

2023-08-13 14:59 GMT+09:00, Manas Ghandat <ghandatmanas@gmail.com>:
Hi,
> Currently there is not check for ni->itype.compressed.block_size when
> a->data.non_resident.compression_unit is present and NInoSparse(ni) is
> true. Added the required check to calculation of block size.
>
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
> Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b
> ---
> V3 -> V4: Fix description
> V2 -> V3: Fix patching issue.
> V1 -> V2: Cleaned up coding style.
>
>  fs/ntfs/inode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 6c3f38d66579..a657322874ed 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
>  					goto unm_err_out;
>  				}
>  				if (a->data.non_resident.compression_unit) {
> +					if (a->data.non_resident.compression_unit +
> +					vol->cluster_size_bits > 32) {
> +						ntfs_error(vi->i_sb,
> +						"Found non-standard compression unit (%u).   Cannot handle this.",
> +						a->data.non_resident.compression_unit
> +						);
> +						err = -EOPNOTSUPP;
> +						goto unm_err_out;
> +					}
compression_unit seems to be used when the ntfs inode is compressed.
And it should be either 0 or 4 value. So, I think we can set related
compression block variables of ntfs inode only when ni is
NInoCompressed like this... Anton, Am I missing something ?

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index efe0602b4e51..e5a7d81d575b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1076,7 +1076,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
                                        err = -EOPNOTSUPP;
                                        goto unm_err_out;
                                }
-                               if (a->data.non_resident.compression_unit) {
+                               if (NInoCompressed(ni) &&
+                                   a->data.non_resident.compression_unit) {
                                        ni->itype.compressed.block_size = 1U <<
                                                        (a->data.non_resident.
                                                        compression_unit +

>  					ni->itype.compressed.block_size = 1U <<
>  							(a->data.non_resident.
>  							compression_unit +
> --
> 2.37.2
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
