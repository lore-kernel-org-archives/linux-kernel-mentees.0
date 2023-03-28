Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C1C761AF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Mar 2023 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A58D83EED;
	Tue, 28 Mar 2023 16:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A58D83EED
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=X4Tf1nN8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ia7nEG8_EU5l; Tue, 28 Mar 2023 16:55:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2315983EC2;
	Tue, 28 Mar 2023 16:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2315983EC2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F29EEC0036;
	Tue, 28 Mar 2023 16:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDCCC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D60D613F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D60D613F5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=X4Tf1nN8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSbGEnPu9D_d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8504D60AFF
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8504D60AFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:55:21 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q6so5642253iot.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1680022520; x=1682614520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bUwFwipOno/fglymvApN977dbpW81hWLY7eREVlD5Pw=;
 b=X4Tf1nN8HP4DeFF6EbvEkWREB1st50NkDS65kp+8R/cs7sKXVZc8Drmku3oRAX2RFw
 EntI3xB8VLzQn52gwj85snAZ5SeUAAL/2kIgNq3hpgbXH8LXfUNjZ2O1U6nxUf6uK7tB
 iQ7YOdgkCdEd+xOUzAft8fsTn4NokUSotJ2TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680022520; x=1682614520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bUwFwipOno/fglymvApN977dbpW81hWLY7eREVlD5Pw=;
 b=EgIKev+7w4Ig+zQGCzG8MX9EEF1SjQ6zKRqhhikn7RJM1/2RBK4oVzcTp3rAX6LRCI
 18GIOYYvT8+nSYxIb51lnuwMJFu+KX3wNUNy5YOXHDuZUWhqpFUdPQ+PZLWjEKM4PdH/
 QRNfZEuPzaUYVhaFdR98Ec9b9wUmiJ76YDgC5DFkeiGkBWsIaFAAyrr08YRFxXC58uil
 CsOLFEg5j11IAJCd8Nk2lFKkrXxnhb/rKgRolQG0Iv5+t5+VGSRh9+GeJ1Ttg5cxnuvQ
 7AcwoBjudmaNEwsLyxLuEI/ckJM/in8sVOugcXd9NCGLYNYc5d2M1BKW1djJHpONlxNS
 wL4A==
X-Gm-Message-State: AO0yUKWWWIic/8b1JXiGlKLAKc4IcU4E5G7/srnSX3+zBXGVEPHfGfon
 EPPsvmqPIVyxDYic7izuNW/HLlg2
X-Google-Smtp-Source: AK7set8TguUAlFX6s9EJ2012vUFq7IUpqfWYU8bPcZpnUbMzBB7huyu1SG+aPm7x2CZeHZKWcW0+5A==
X-Received: by 2002:a05:6602:2f04:b0:758:9dcb:5d1a with SMTP id
 q4-20020a0566022f0400b007589dcb5d1amr11663431iow.2.1680022520562; 
 Tue, 28 Mar 2023 09:55:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 s19-20020a056638259300b003acde48bdc3sm9622622jat.111.2023.03.28.09.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:55:20 -0700 (PDT)
Message-ID: <ad8b13fe-b732-e4d9-874c-949701bf47a9@linuxfoundation.org>
Date: Tue, 28 Mar 2023 10:55:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] selftests: prctl: Add new prctl test for PR_SET_VMA
 action
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, shuah@kernel.org,
 colin.i.king@gmail.com
References: <20230325205903.5550-1-ivan.orlov0322@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230325205903.5550-1-ivan.orlov0322@gmail.com>
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

On 3/25/23 14:59, Ivan Orlov wrote:
> This patch will add the new test, which covers the prctl call with
> PR_SET_VMA command. The test tries to give a name to the anonymous
> VMA within the process memory map, and then checks the result of
> the operation by parsing 'maps' virtual file.
> 
> Additionally, the test tries to call the prctl PR_SET_VMA command
> with invalid arguments, and checks the error codes for correctness.
> 
> At the moment anonymous VMA naming through prctl call functionality
> is not covered with any tests, so I think implementing it makes sense.
> 
> In version 2 of this patch I consider the selftest Makefile rule about
> TARGETS entries order - I moved the 'prctl' entry in the Makefile to
> follow the lexicographic order. In version 1 it was placed at the
> end of the list.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---

Thank you. Applied to linux-kselftest next for Linux 6.4-rc1.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
