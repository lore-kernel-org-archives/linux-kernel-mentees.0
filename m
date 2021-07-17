Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A88C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 06:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D97261029
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 06:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D97261029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5791A42396;
	Sat, 17 Jul 2021 06:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22hr5oxfZ7yc; Sat, 17 Jul 2021 06:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 43F5842392;
	Sat, 17 Jul 2021 06:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1ED1CC0010;
	Sat, 17 Jul 2021 06:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A20D3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C55240194
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrUTwWXLXNm7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:54:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 018DF400B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:54:32 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id w15so12180052pgk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 23:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=3/7ysmts7v0DI67ZBGnE25VR6bpXk5YEjt2qQt+gQfM=;
 b=bV1GHjRUMm59IYvCaJS5mDed8n2nnKeXZXbPirmFJLNxcz1DmBCofQpWl0LXVA2pIH
 gmxBhTbTGfe4h9g9gu2HLNH/fs/8rVdmvA+qaU5onlE7gTPyOfeg/ymDI12EPZEoJbEt
 qpnQgWyCLl6cKRDgU1CC43pUDVGp2jWjtHsbB6iXWzuBQz69M/aKOSiKiPqxCIZUKvG1
 KWV9jg8Hc1kJkgpwIzD1tG60nlVNp6erhF8v/BCE62kFnJJI3buC/Zs3jXTYszTU4RDb
 o6AEOlnf3RRU/cn7SswQTTre7DQes/z3A82NSI62cUhFuBifjslTMaujw5D7EoxlBGJI
 7zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=3/7ysmts7v0DI67ZBGnE25VR6bpXk5YEjt2qQt+gQfM=;
 b=EJ1867heo7ps3laQGRsHN3ANG6r/b0p3BwqUeHKqxG+MEVMwgoameeRpEeO3HOfmDz
 Q17AGoqgrmdj0SkRgIWOXaM5ELBZL+gkQ04R9bs7fSAaBaiLrsupnljv/n/VofnbqUie
 Emft/DQV5bZ7UEjSIBJAM04Bk0F0PKmC7LkboSijPjkwfs6CuVNl5YoCjFCG1x30ovGV
 mBMWPdt2Z04LwvbT6mReCL/3mZ3W9dhSlJq5Rqt15Ig6pvGkgVf2r0Nvcr6wOv3hgss9
 KN5roxJuk/c7+9buGJ53jGmTLbaG/sFH3KaNO/6b8fLyJRTnQb9xIqVf6V9JiQQ+YTvQ
 xonQ==
X-Gm-Message-State: AOAM531Yr0y13KdIQO0hn1k+BnfLtj3GJHzGdwiQLX3ICnJbxDQNQ10s
 1WikgBASNpPFYi6yFLlMzvI=
X-Google-Smtp-Source: ABdhPJxevMKq++qCWQYz5Yq7EsMi3tgET6zINoxXKLas/K+Y48FQRyyMI0RY/kKlps0BkpsWomtUzw==
X-Received: by 2002:a65:5684:: with SMTP id v4mr13880832pgs.388.1626504871900; 
 Fri, 16 Jul 2021 23:54:31 -0700 (PDT)
Received: from uver-laptop ([2409:4063:6e1f:5dc5:bdc:3adf:c8d3:ee46])
 by smtp.gmail.com with ESMTPSA id h24sm12814986pfn.180.2021.07.16.23.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 23:54:31 -0700 (PDT)
Date: Sat, 17 Jul 2021 12:24:27 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Linux Kernel: Mining for Maintainers Mentorship Tasks
Message-ID: <20210717065427.GB4873@uver-laptop>
MIME-Version: 1.0
Content-Disposition: inline
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

I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
