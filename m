Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACECBE784B6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31E3C4059D;
	Mon,  2 Oct 2023 14:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31E3C4059D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RX3U3SCN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvSL_plTcPmr; Mon,  2 Oct 2023 14:34:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 319E3411A6;
	Mon,  2 Oct 2023 14:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 319E3411A6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03674C0039;
	Mon,  2 Oct 2023 14:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E4F6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D01606DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D01606DC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=RX3U3SCN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYPMEw1a_Abk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:34:19 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7EEE60804
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7EEE60804
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35264dff796so1029165ab.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1696257258; x=1696862058;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kRxNfqGjCGFxbOhmZF5JCBU40Y06pFegG3QOX3/BuLA=;
 b=RX3U3SCNpLqsO4CXG/MS6uO2VwcRyMuuyq6olo+4CiLPVywP2E+sw3+G3EjxpFFy7z
 MaVwhK3LrturM5/+yGGljy905gFfXmy8Wu22rD0vCqntrZ1IiDtxv7bYkQtfZthqq7NU
 0GKFggtfaXWCSqOnIVaebKMDn1S69ptWYIL4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696257258; x=1696862058;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRxNfqGjCGFxbOhmZF5JCBU40Y06pFegG3QOX3/BuLA=;
 b=JUsx41jyxWsviCokCgvScn2KqEEMBHdlurYyaky4pECthBnnrPeVob5hhAdE7OM6Id
 m/F8JHrCMDqZj7K3Xhgp5QCftp/yYPuvr7ajoLTaih5OwYEKs8JZ1rbkVg9/4WnJQ+gG
 8tM+xtWCpdporo03Lf3C2sS2isIRTPrnO5zIv9yg9I1Gbnhl4yMDfKtRYQkhfSI+pvx+
 WNyWZ9U3yzv1uZskqIo9F2yjz0UBy2QplwXLQqDR+RXRfJZlfomMIOQ7zc9l9tcypIyJ
 vwHPVtjR0TykElzN5qSQXlJv8gLe0jNzhJhm1O4rdVuWGsdjMgTirVJfTCSscjf1vlT+
 e8Cw==
X-Gm-Message-State: AOJu0YyZh5dDTRifJGASgigB8+EAcKST0KuWO70H+NWxHQPABmBWloWS
 FXJNvr2jmD+m2YhQSHv16E3alfc9
X-Google-Smtp-Source: AGHT+IEeeEyqmM4GNE0zvXS/ZnjHo+Pb1gJrNueMD0ZUcJZdbOdVx2t67HBz2Wwi1Ck4CD4GkyhX6g==
X-Received: by 2002:a92:c9c4:0:b0:349:983c:4940 with SMTP id
 k4-20020a92c9c4000000b00349983c4940mr11992080ilq.1.1696257257752; 
 Mon, 02 Oct 2023 07:34:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056e0204b200b00351268dfbd5sm6374043ils.57.2023.10.02.07.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 07:34:17 -0700 (PDT)
Message-ID: <087c5c0d-6a20-e58b-7735-d764c4de69af@linuxfoundation.org>
Date: Mon, 2 Oct 2023 08:34:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] Added missing TARGETS in kselftest top level Makefile
To: Abhinav <singhabhinav9051571833@gmail.com>, shuah@kernel.org
References: <2023100251-recycled-purist-1ea5@gregkh>
 <20231002114635.1567809-1-singhabhinav9051571833@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231002114635.1567809-1-singhabhinav9051571833@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

On 10/2/23 05:46, Abhinav wrote:
> Some tests like dma, ia64, etc. were not present in top level of
> selftest Makefile, so when someone ran 'make run_tests' they would miss
> these tests. This patches adds those left out tests.
> 
> Signed-off-by: Abhinav <singhabhinav9051571833@gmail.com>
> ---
> 
> I removed sched, safesetid and filelock from the Makefile, because these
> tests were actually triggered when we run 'make run_tests' even though it
> has not been mentioned explicitly inside top level Makefile of selftest.
> 
>   tools/testing/selftests/Makefile | 7 +++++++
>   1 file changed, 7 insertions(+)
>

There are good reasons to leave out tests from the kselftest default
run.

1. test requires specific hardware or driver or system configuration
    which includes kernel configuration options.
    e.g: media_tests, dma
2. It is a benchmark and/or destructive test that doesn't fit into
    default run category: watchdog, kmod
3. test Makefile doesn't support kselftest framework

Any patch adding a test left out of default run to the default
run has to explain the reasons why it is a good idea to add it
and more importantly showing that this doesn't impact the default
run with report from the test run "make kselftest"

Sorry. I am not going to take this patch.
  
thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
