Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEDCC636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 11:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2956113D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 11:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2956113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D50260785;
	Sat, 17 Jul 2021 11:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-PJtXZ-pQR0; Sat, 17 Jul 2021 11:20:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 408536076F;
	Sat, 17 Jul 2021 11:20:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 284C8C001A;
	Sat, 17 Jul 2021 11:20:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDBE4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 11:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7BC60785
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 11:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yQKVRtdHTbf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 11:20:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DFA16076F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 11:20:18 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 62so12765591pgf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=VIZjMOpqOb0AE3FncuOBi462LNGPX8eslw4O513AV4c=;
 b=FZba5TeHxHKhChJ8lZo8ziLJTmzjNDk3zYKoRrJQoVgrYCtPMj1P92vewJLaOIuPnd
 9WpGs5DR4Q7Ykhj8Xjhh03FQ53ucPGekmlgQ/GYnOMSg4+d7lT9dKjK34GLbDBY96UD/
 TTQ4n7ma3LGa+PY6e60unHWzi6bffN95GV9WvXSRNUzqogviQqsLVDFfKZflidz8p2RU
 5fuv7PenGSCD3SXX38x8lXgkr2BztYMojHkJ25Le4LeUQF23LewCtW0Hg1C/JlC8uTUu
 XCmCIXtqWGjZE9P5gOGw0piTM1dbtvq49dpM4TCcEiWgqLTVk7SDYWduw4S+Ig8qvIOH
 SQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=VIZjMOpqOb0AE3FncuOBi462LNGPX8eslw4O513AV4c=;
 b=KvklrdZs8dxPm7GzdV3Q7s9lgJp0/GJ0OINqg8/V71fakpMwNg3SI+maEIDl1v6YWk
 ISGUh4wq8AYYGIAsYW8Fyl3UWsTzwkNDLOcCig7AavTjQ8YQhKag21SvenJRnCuC15hq
 h2GCgHkg6tpxsf8vDlfAmwwLViv39m620ts5FwUHq3yx+T6OWEEOlUUQrLmrCkrMBRog
 9HqpcTzmWQ7Phb2qSER5NY1Nt2NqKcf2aB30gpiDGj60rRKdZwAYcmzQb7azq8kXhB1F
 Yi5F2xcXp8wC2hjAuwW+pVUMO94YWqqz5IvWtjTHoqiOuPXYxrzol81QkpcdmNABNUBq
 ImFQ==
X-Gm-Message-State: AOAM533Wj3eRrHleQ2YFSz9Rdb0/2hOapAhCZHJceF866N9nhL+j50zK
 oDPcNl9u21miNtEFDZ35UmSdtD1Grc3zkzE+
X-Google-Smtp-Source: ABdhPJwnGn6xgaecOUpWSOdw5bQ9quObvSISPZToy8iCC/2OZj4B+ae9w737ybN2YEelblS0vuL8LA==
X-Received: by 2002:aa7:86d9:0:b029:32b:5ec8:c87b with SMTP id
 h25-20020aa786d90000b029032b5ec8c87bmr15177851pfo.1.1626520817408; 
 Sat, 17 Jul 2021 04:20:17 -0700 (PDT)
Received: from ?IPv6:2402:8100:3038:e359:8dbc:d7b2:76ae:5f66?
 ([2402:8100:3038:e359:8dbc:d7b2:76ae:5f66])
 by smtp.gmail.com with ESMTPSA id h5sm12675720pfv.145.2021.07.17.04.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 04:20:16 -0700 (PDT)
To: lukas.bulwahn@gmail.com
From: Piyush Thange <pthange19@gmail.com>
Subject: Linux Kernel: Mining for Maintainers
Message-ID: <97dc8d5f-ebeb-c12e-d214-7c5591f1f4db@gmail.com>
Date: Sat, 17 Jul 2021 16:50:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

I am interested in the Mining Maintainers mentorship program and I would 
like to work on the tasks for the mentee selection.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
