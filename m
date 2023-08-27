Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B95C83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Aug 2023 11:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CD640469;
	Sun, 27 Aug 2023 11:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CD640469
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aa5zTc1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v145m55UTxG6; Sun, 27 Aug 2023 11:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6C4F84028D;
	Sun, 27 Aug 2023 11:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4F84028D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4853CC0071;
	Sun, 27 Aug 2023 11:16:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC4DBC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 11:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C098A6100B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 11:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C098A6100B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aa5zTc1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOEiLwmJ0YUL
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 11:16:47 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2029A60FE1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 11:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2029A60FE1
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a8614fe8c4so1844110b6e.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693135006; x=1693739806;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJmYrWmRmpXxOujg+OQiE1K3Sx+g8h3tcHh7bhFexXI=;
 b=aa5zTc1Cb8tV/b2O3cRWLmGPwUbCfUELxsGhzzogTH4qcw61HXJVY/SpzY3R1dEoFP
 JpA2dnP22KvxtNvjfUm4roW+K7mVl5tM4QLTKWLNSWgKMwP1UlbOuOH960dm8w/DnnRo
 z/z+xIivziHZqW9OsxNaAvuKlEfnS22eP9N2CE6hi0XLCmS0vlMt1pTiWaNEbOvU6UUy
 aelEaTR3AvOMgYXk3pLf93NNZ82vkfmJA4438KOaXD02zID38DxRZxOQrQw86yqUiOhN
 JKUQbAl5Ln4eWuuVelJoTPt4QowJDjYIqylHLs2Fr9/w6D4xf8t3zcHBtxygZBFeC0Nb
 qbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693135006; x=1693739806;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJmYrWmRmpXxOujg+OQiE1K3Sx+g8h3tcHh7bhFexXI=;
 b=UCxJu6bQmtYFcbeKwmUqeUiabc7pH083bLz3gs5SrHbUS9+oPZeinbYJlq+XosS7tg
 Pj0PSy0KFyPqCnkJUYR+YeU2vahToePA9nFCMOCosztFiqLOMjGHmiFKEzLpoMyVtDsS
 nYsqtzYpN9C3d6aAkWqI0pUU0VzzePekesxRxD3qYA3Ewa4H9mJyf8OBXt5piMUCs7Oi
 aTpnKrye1aqN1e9AjJ8qgB3K1jcagIk8d2qS3DIX+SK06el9BEkGFhbj7fWVp890D6uQ
 8PhcQ8O743trykA0KSgiE+5UBT/7HbT4RNY0reWlyhbd3XsxazWnZz5bSsiLQsAlsSAh
 nxBg==
X-Gm-Message-State: AOJu0YycucB+DGAX8TA9UlzkBeQrLF488bKgEMMPgJK8xD48ivwVZBMk
 ISbawRZByCJZQCF08F92PMU=
X-Google-Smtp-Source: AGHT+IGTYj4MItsxKHcKFDgUktBntcZHWgfBzG560nKtJGQNI6VXo6O3t+2NFSbm7mS2xghDGP9SqA==
X-Received: by 2002:aca:1c17:0:b0:3a7:4fa4:edfe with SMTP id
 c23-20020aca1c17000000b003a74fa4edfemr8124630oic.54.1693135005812; 
 Sun, 27 Aug 2023 04:16:45 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.178]) by smtp.gmail.com with ESMTPSA id
 p13-20020aa7860d000000b00687790191a2sm4629446pfn.58.2023.08.27.04.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Aug 2023 04:16:45 -0700 (PDT)
Message-ID: <24deab57-5480-3af6-17e6-0874aeaef3db@gmail.com>
Date: Sun, 27 Aug 2023 16:46:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
From: Manas Ghandat <ghandatmanas@gmail.com>
Subject: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
Cc: salah.triki@gmail.com,
 syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 luisbg@kernel.org
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
Reply-To: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Greg,

Sorry for directly mailing to you but I tried to reach the maintainers 
for quite some time now. I haven't received any response on my patch. I 
was told to mail you in order to get my patch pulled.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
