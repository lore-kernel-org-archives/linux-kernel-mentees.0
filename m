Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB153C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 16:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8E66139D;
	Wed, 16 Aug 2023 16:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8E66139D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NHB1Kirn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywabsjEp5Vgk; Wed, 16 Aug 2023 16:40:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5F51E60ACC;
	Wed, 16 Aug 2023 16:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F51E60ACC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F2E6C0071;
	Wed, 16 Aug 2023 16:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13EDEC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5601416E3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5601416E3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NHB1Kirn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2P67RBGsgnp
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 16:40:19 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AFD640232
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AFD640232
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bdfb11ea2aso13484765ad.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692204018; x=1692808818;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lpXtmiRdtXtrnVuj+yOd5/ldcPOOd3KtSDr9PtSjjpQ=;
 b=NHB1Kirnobegb/kcu1DT8SxfH2r9i3kA/FMl1eEpCEgUxQUt6tXQ3PTBnk/DbE0h/y
 k/ZNiyyMfYKu5iTilr1EU8FSbFxzeU5OfyatpKMQwc1kSUSXGYbHbYx0U1PpF5fF1Vkc
 CubvRnJIP7rkjbLGISOReUrbh5/24BRmOnjQNTpW4K9VCRo4oVsxdN2PRcWxPg8Wpi3U
 luAJ2/VSvnKT4I5hKRjI5GH0zodIBP7J5AWrsZbP5+cHlplgMaUD7kJ6chqyhmVotlLF
 ofNmHf7tQks0vnVFDJdObvsqj09zODg9xZzzVXc8MY6muLp5Re/Oe41w8j/lQlJWOP+W
 CvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692204018; x=1692808818;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lpXtmiRdtXtrnVuj+yOd5/ldcPOOd3KtSDr9PtSjjpQ=;
 b=b1TREeSm0oWht0Nx7WPBgQ1pPRGNIvwpmbkVRUbY0dK9AX0tHsdfa/UG8ok/NFx8c0
 xNqPta7VtxpgQauhSd9SLW07XLuLBm6MTCCMytREnQO1UmxBLZJ6tgFUKZICiMeYO3uJ
 hn22I7/vHOWIT27g+8bAtFKQQzOG1ONwnV3JH3/aBRp5yOFt+TRRghP34e4ur1lzZtr3
 gM/S9xdGhPzXxaWWGpvKLCHOIYwuQ9iYw1jZdWQtgkeh7ReKDOIHFelTljPTBAphbZy4
 52BpHv/MU6pj/izLl95hPGWisVKRQeX/8j5uN4jAobj/juZVX+uzKBQw7wRHrsYQ7iI/
 NKJw==
X-Gm-Message-State: AOJu0Yy+g9+sZFxqAt90D8u25BD3EnQwBTPYw/7RFBSu1sV3Ji7xt70s
 s3FF7Q6YvAbj+FGu8IJ8+BK0fUbmzPESRuaf
X-Google-Smtp-Source: AGHT+IFgmpqQTjnDicZXCXdWpUiVCZFVQJb0ZW+wO3g3PcrODJcTxoXS67BKCpC9Y/ka1nbYpEwtbQ==
X-Received: by 2002:a17:902:ef89:b0:1bb:25bd:d09c with SMTP id
 iz9-20020a170902ef8900b001bb25bdd09cmr2188237plb.1.1692204018320; 
 Wed, 16 Aug 2023 09:40:18 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.179]) by smtp.gmail.com with ESMTPSA id
 q24-20020a170902789800b001b8b1f6619asm13375124pll.75.2023.08.16.09.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 09:40:17 -0700 (PDT)
Message-ID: <a1c9e590-2d42-23bc-bdf7-3f3c784284b5@gmail.com>
Date: Wed, 16 Aug 2023 22:10:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: viro@zeniv.linux.org.uk, brauner@kernel.org
From: Manas Ghandat <ghandatmanas@gmail.com>
Subject: [PATCH 0/1 ] fs: Warming in __brelse
Cc: linux-fsdevel@vger.kernel.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Hi,

I was working on the following syzbot bug:

https://syzkaller.appspot.com/bug?extid=ce3af36144a13b018cc7

Upon debugging I found that in this case the buffer_head is having count 
0 and then when __brelse is called it tries to free it. A simple 
solution to this problem would be to remove the warn call. SInce in any 
case the buffers only get freed if the count is present and consequently 
the pointers are also set to null. Additionally we could add a check in 
the has_bh_in_lru to also consider the counter.

Link : 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/buffer.c?id=d192f5382581d972c4ae1b4d72e0b59b34cadeb9#n1509

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
