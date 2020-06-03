Return-Path: <SRS0=6U4U=7Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E435CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Jun 2020 16:06:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB1C204EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Jun 2020 16:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dcKryL9N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB1C204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B1898791F;
	Wed,  3 Jun 2020 16:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vf8xrqZhkC5; Wed,  3 Jun 2020 16:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E213878E6;
	Wed,  3 Jun 2020 16:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D69AC0178;
	Wed,  3 Jun 2020 16:05:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1442CC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 16:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 035DE883B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 16:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsfdVLGHkBTx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 16:05:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7123387A2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 16:05:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id v17so2319089ote.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Jun 2020 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=UM0QayrHab5BZmMzM0XNZ8RWm9HESmAQsxNAFeF+Myo=;
 b=dcKryL9NCNQw2FvxmZh+3uH54ZpU9iQdFIAH3Ih/0JUOc/wFNHKeno+dO+Nw4lVfH4
 0PMDdUH/W6FvsYSlhZDOSmGuSL1pwCCah391UvE1ybvUKTjCchlqWBX4dsCWSx0MkoxS
 EQBi3bKEO0S3PSBokAqTSVyJushmIFwFXaEhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=UM0QayrHab5BZmMzM0XNZ8RWm9HESmAQsxNAFeF+Myo=;
 b=k5hKwu0xIZVmijwVPQodltUFoEokHMzLut0SurPaZx9wBKa1938FB9PJUYtl/xSPTw
 unYDl2FS3ZDvKjZpDqUncsJtrCz1gecsLMI58c2z/ABdtTpu+wlpGPbSBfHLkBAtCHxv
 /ezYLrpQCoTyTx23EtUTf8bRNS2ka++8gp2zeg5b1KJAaL/3HdtTYhUUAvWtybj5K4C7
 7dIOTTMTtaDuvaBKooVP3s8I4ULTRmIk2mPzTb1Ndq4WyBh1AUe3w1a29y4botxYQYw8
 0FNNsoYwkpWe4VB+zsRgHqwDnaAuU109O8xxN1xF8Nwevi5VNfrsA1ClAMKStRRlpeQx
 DZ8Q==
X-Gm-Message-State: AOAM530bubMa3yY3IMWuR9sAk0x7GAy1UUchBuKOr2Dhd1sYWcUwoZud
 +TfGKJXHKPkel1AIrjmpe+owzQEQ
X-Google-Smtp-Source: ABdhPJxSU+6AWWxeIPDa7gVyvx4r70YeSShs7q72lsMaupa3AyzpjJI9HKC3DxChh6Jewa+EYEf0ZQ==
X-Received: by 2002:a9d:4703:: with SMTP id a3mr483200otf.219.1591200356541;
 Wed, 03 Jun 2020 09:05:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c3sm569017otb.47.2020.06.03.09.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 09:05:55 -0700 (PDT)
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <83bc1b7a-ee84-d074-d04d-5fdb39e777f2@linuxfoundation.org>
Date: Wed, 3 Jun 2020 10:05:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] New Linux Kernel mentorship projects
	accepting application
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

Two new Linux Kernel Mentorship projects

LinuxLinux kernel Bug Fixing July-Sept 2020
Linux kernel: Refurbishing make coccicheck

are accepting applications now. The session starts on

Please visit https://people.communitybridge.org/#projects for
a full listing of projects and search for Linux in the search bar.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
