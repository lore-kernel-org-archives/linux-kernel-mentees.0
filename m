Return-Path: <SRS0=GqCC=2J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72708C2D0C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:02:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F932146E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxe+ElQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F932146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 033DA86FF1;
	Thu, 19 Dec 2019 17:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1sqZcfOy5N8; Thu, 19 Dec 2019 17:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E44186DDA;
	Thu, 19 Dec 2019 17:02:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E010C1AE8;
	Thu, 19 Dec 2019 17:02:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 952C5C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D28D86FE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Km9Z6LJNHkL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E65C186DDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:02:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x8so3426691pgk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QmZHBv3VTqpxW/+akPp/0Up5TSxjNx51R37o6VFJo/8=;
 b=Rxe+ElQQdLHhw9LCWF1MT+SEbUVbP6UBVHaNYlY8Y655lU5jeO2JXQ4vuSKHpar2Bx
 evQIWX3uKVu1nLpE4Jpk4DbtISWARtGqBhJBxoQdPqsuP2KxYFNEhRiR0qcKOs4mXRjM
 YESOA+egwGyNcxg9KwICjh6RlwcuqTtPs32YF4w529lg8+J1FsqORTNH0Crom2oKc2nO
 2yWTE8Q54pbpzcrogjN7XTiM7UecKzIWaZttpMXY2M0c32z6CYiYTol+CkQNjEIx9wc1
 +aEOGC8noMRzk9kkCrgW6dSsIJ4GCYMGwVvQc01ronCGari5RXeHqUw7o9VTlRs1PWtA
 sv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QmZHBv3VTqpxW/+akPp/0Up5TSxjNx51R37o6VFJo/8=;
 b=VPs4w/Gbk5ICSAASOYx+OSGvpH+C8wDe4Nb1awJ1xxEKGUr/fNu5qjCAH4DrdpBQjs
 XgLTuqmEuRX6wRG5I5ZgOnRGc+vQJb7Ibtsg9hzCyz3v5ndhxAnBLOVtVLbhEy6VJU0B
 4lrTDCVD/fTWeFU35WJ2wITPk4z4BNMJRHunveXa4hV5WSqgwOlt5y4ZD8f5fqYEK2v1
 SwfBRZK7YZCktZfPjUkK5hz803GkJhZ2fGfxEDDtIiOZha55dHBGXU1ell/jXJAtPngE
 aThk7fUyWYoh8grt7s0AUDwq4HQUrb66GRHNhQ3YB2weKsGDJ8k3DWpR9PgVvyhpKflB
 BvPQ==
X-Gm-Message-State: APjAAAUMFzpZmLDlQU09Q6pz+ob9NdhmmPDMfro5UWhtG/VP3U1DvI/Z
 b3JfF4s2pGcn9Oce570dqyM=
X-Google-Smtp-Source: APXvYqyebZwOJg1dT7jXsy0er9lcMqa/aeNpp2VMPO3d+LC5lWQ7Ugfd7hJLcic/CSI7Ym+uGIn6Vg==
X-Received: by 2002:a63:e042:: with SMTP id n2mr10338201pgj.308.1576774923465; 
 Thu, 19 Dec 2019 09:02:03 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id v4sm9038094pgo.63.2019.12.19.09.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:02:03 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <20191120192655.33709-1-dwlsalmeida@gmail.com>
 <20191219095356.4a3ad965@lwn.net>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <2eba770a-f566-d704-35b3-7c00995bbc76@gmail.com>
Date: Thu, 19 Dec 2019 14:01:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219095356.4a3ad965@lwn.net>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert fuse to RST
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

Hey Jonathan! I hope you're doing fine.


> So I have to confess that I've lost track of where we stand with this.
> Holidays and moving house will do that...apologies.  In any case, I have a
> couple of additional comments.


Actually Miklos replied. While he did not comment on the amount of 
markup used, he had this to add:

> Hmm, most of this document is*not*  an admin-guide at all.  The only
> sections that really belong in that category are "What is FUSE?" and
> "Control filesystem" and maybe some of the definitions as well.   The
> mount options for fuse filesystem are not generally usable for
> actually performing a mount, most of those are actually internal
> details of the filesystem implementation.
>
> So I suggest leaving this file under Documentation/filesystems/ for
> now and later work towards splitting out the admin-guide parts into a
> separate document.

Please let me know what you think? I can do another pass to clean this 
up and remove more markup, no problem!


-Daniel.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
