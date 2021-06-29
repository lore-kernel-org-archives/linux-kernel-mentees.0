Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4FC11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8E761D3E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8E761D3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D4C740134;
	Tue, 29 Jun 2021 19:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aG8zBaPJjtta; Tue, 29 Jun 2021 19:13:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F19840105;
	Tue, 29 Jun 2021 19:13:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 806A2C001A;
	Tue, 29 Jun 2021 19:13:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02DA5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61916083E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dubeyko-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBKD7BsHcsd9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:13:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 192676072F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:13:52 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so23790111otl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IXvp6iYKQ7LnDZgY4w/YeVt41OnTxqbG05Qy728iqDQ=;
 b=XBe6ZNy9PinPV3StEvl00KHi2NGx4DwYVRdaw7sfW5C17MpRktVuuTgcyqre+nt+ad
 f7Xtb7JecKipWjzeAfQhChNAx2oHAK841c3lVi8OHGVsBbQN29bqdQg8T4Pg3yHju47S
 chdICXJHMFQTMGyHvXrPFw3tuQlmN/ujJiRyVgNoZoBdEkkKr3ZnRwbcEwGXlvY3jGU+
 a767VexQaeNRSbD48jFoCwPwYQ/NFc3hlBBbQb+NdrgOW0leYl6fOQHrUdamAQ5WArwu
 jy+/9M3YBlPs9H2asOze84NOpQDyX7318bXoJYNLUusR4T1Vp0ENPt0nUjbZgInMF5cO
 fwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IXvp6iYKQ7LnDZgY4w/YeVt41OnTxqbG05Qy728iqDQ=;
 b=d+SSepA/ZZq6Ablfb7dEa31C3SPKKInTi76DTKSdIOsvzWoQnIz5YKX3GLAa3qy0TX
 tLyX8Y00WBcQGwc0/P04lMG4/os1F7PSvT4EhCOAW4L5zGVs7uNteveCsLn5yEXDSJs2
 cjQfZBwHAp/eTMaw9piK7x2yHPheLM5QP6gD+0SUxQASkajkWMXEzjlLcL4zSghLVevC
 A/CBOA0EHK+o/+zoYicSxGMvGLRAYjH0QBYEfp+EyuzgkcE3uhn6b3bFYxGFE4Zhy4Zp
 4I/6D4zC/mp6GNNugIR1sXHqyvyRh/qZ3XOYoqFpTYTdqjq42BYgQ+CvtwHdrEi26K9v
 ywUQ==
X-Gm-Message-State: AOAM532+mkO6xGqEdX9E79PnG5jX2JpeEu5VUh7UxamcwH6SmqQ8kX/t
 suParqqovXIWjDTU8B1XJ/QRog==
X-Google-Smtp-Source: ABdhPJz4Km15cqKpfqYG6bnFUHdFiJMXgnHFhUkf/d8pxk+AZBjQcf/VOpdyt5J1c7n79donpSlTrw==
X-Received: by 2002:a9d:2781:: with SMTP id c1mr5747720otb.34.1624994031775;
 Tue, 29 Jun 2021 12:13:51 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:f8e3:a853:8646:6bc8])
 by smtp.gmail.com with ESMTPSA id n72sm4101436oig.5.2021.06.29.12.13.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jun 2021 12:13:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/3] hfs: add missing clean-up in hfs_fill_super
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210629144803.62541-2-desmondcheongzx@gmail.com>
Date: Tue, 29 Jun 2021 12:13:46 -0700
Message-Id: <28CCF4E3-51D1-43BE-A2BA-4708175A59C0@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-2-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
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
> On exiting hfs_fill_super, the file descriptor used in hfs_find_init
> should be passed to hfs_find_exit to be cleaned up, and to release the
> lock held on the btree.
> 
> The call to hfs_find_exit is missing from this error path, so we add
> it in to release resources.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> fs/hfs/super.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
> index 44d07c9e3a7f..48340b77eb36 100644
> --- a/fs/hfs/super.c
> +++ b/fs/hfs/super.c
> @@ -419,6 +419,7 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
> 	res = hfs_cat_find_brec(sb, HFS_ROOT_CNID, &fd);
> 	if (!res) {
> 		if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
> +			hfs_find_exit(&fd);

I see that there are several places of hfs_find_exit() calls in hfs_fill_super(). Maybe, it makes sense to move the hfs_find_exit() call to the end of the hfs_fill_super()? In this case we could process this activity of resources freeing into one place. I mean line 449 in the source code (failure case).

Thanks,
Slava.

> 			res =  -EIO;
> 			goto bail;
> 		}
> -- 
> 2.25.1
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
