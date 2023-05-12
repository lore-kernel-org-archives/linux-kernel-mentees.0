Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD3C77B75
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 May 2023 15:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 337E7429E1;
	Fri, 12 May 2023 15:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 337E7429E1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20221208.gappssmtp.com header.i=@kernel-dk.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=uQb+J4jz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoKIZyNx35rq; Fri, 12 May 2023 15:09:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E0ED84298C;
	Fri, 12 May 2023 15:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0ED84298C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2A4CC0036;
	Fri, 12 May 2023 15:09:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD06FC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A683E4298E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 15:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A683E4298E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMYuinAqOq3K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 15:09:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D58C4298C
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D58C4298C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 15:09:36 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-760dff4b701so59896439f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1683904175; x=1686496175;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCibvLLxmrwwjTg8tqAHybrQHxUO9Q8BGBSAxnFXhiw=;
 b=uQb+J4jzLKUfp8gagw5cGFiAeUpcv8jZJp1GHPpWmpH5ipBA16smx4xIf5dXo0kFt+
 8GFco37b1QZVTDLsrUc59o0pmGTqqi+/Qpf+QglCqnMTKQ7ve0Au+qGHWiu40eqcmuXq
 tRZZ+RomkmcHetSB4F4Ten7NhzlmLnvX+ZH5m5DO/LRzSGQqwgNL/qweq2O67gzIGqjc
 MiJgfs9oBjCHf6V3c9KE9H5PsHE6lUMNVV2lUxN9lnfahQMHEBGRb3KV40k7a+9VIaC+
 B+AiDPgnY2JO6kEjuOgTgw3z+ikAybLXCLo3kEg3OrtP/hEreqnZzhzWQbgqssBrkyKF
 0/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683904175; x=1686496175;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCibvLLxmrwwjTg8tqAHybrQHxUO9Q8BGBSAxnFXhiw=;
 b=H7a6E6bBi/rWzufiyf/iAAYjJElSqUVhb0EfcLFE7htJPNA3lXHhMQUrvLAzS30ZDW
 cTbNXrRe7WrYj0l9Btykzrj2iCa6j1fvw2JGK87FdSBIFPgHGEpyD2BhjOK2tJoHhTLE
 AgdLTKavTzP3fJzILwcIFBh8Rt3VzYAzNNbEXs+tGnzg/bgMYfJbjppMD+kHoNMFJ5eF
 tLwshP7wJjznCBjz4Y72GWmWNYI/4Ox1UpHhnPCos3bwDQ0eAcRY3efStLelHZHeQBol
 2XFL1ekQSDbA3DqpVDpOHddySiw3aHFtEkRUExflUvNc+J1ja3RGha/X0rGsIy2L9x4q
 CrdA==
X-Gm-Message-State: AC+VfDxsV/xBVvKpb3wSMtYeIw+9GU2QN3bF5GXAJxiMwvfL9SeJ4o1l
 EAFSZGJ5NpBnK5zK65woNMVeaQ==
X-Google-Smtp-Source: ACHHUZ4C6nUSwzXyYsE0c9Gh7gS2xy8BK1Q/t0KdbEpeZZJd9wlQic8dUm6KTp4fKwUEmUvC3d6cQQ==
X-Received: by 2002:a05:6602:2b93:b0:76c:8a4c:ad79 with SMTP id
 r19-20020a0566022b9300b0076c8a4cad79mr2715877iov.1.1683904175386; 
 Fri, 12 May 2023 08:09:35 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 u21-20020a6be315000000b0076c6f5b8db5sm1685542ioc.16.2023.05.12.08.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:09:34 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
References: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] nbd: Fix debugfs_create_dir error checking
Message-Id: <168390417460.869582.2878039069012872149.b4-ty@kernel.dk>
Date: Fri, 12 May 2023 09:09:34 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-00303
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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


On Fri, 12 May 2023 17:05:32 +0400, Ivan Orlov wrote:
> The debugfs_create_dir function returns ERR_PTR in case of error, and the
> only correct way to check if an error occurred is 'IS_ERR' inline function.
> This patch will replace the null-comparison with IS_ERR.
> 
> 

Applied, thanks!

[1/1] nbd: Fix debugfs_create_dir error checking
      commit: 4913cfcf014c95f0437db2df1734472fd3e15098

Best regards,
-- 
Jens Axboe



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
