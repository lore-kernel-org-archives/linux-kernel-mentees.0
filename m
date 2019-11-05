Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31952C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 17:13:15 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0384120663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 17:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h/cnKxqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0384120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0CB5E31;
	Tue,  5 Nov 2019 17:13:12 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D44B0E20
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 17:13:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8B792189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 17:13:10 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id w12so23475582iol.11
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=7sKC9HI38dLm7onuvIT50IaJJI3Zvf740fzdyI6Wy1E=;
	b=h/cnKxqfs1r8mqmNCggYffFUXqlyUPNimrGvJ4vOoL3zlwr0bbRNT43PDPbPFyScAC
	uqVSobt1+b9HDVNHFQiQsgtth5KPlGpzhS7ifYxUBhTKbtmudUYwGoK6yYL1lhlFV/tQ
	2reQKfHIND/rn+2v1Gpc2WQ7pFsOrTZJ7RgoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=7sKC9HI38dLm7onuvIT50IaJJI3Zvf740fzdyI6Wy1E=;
	b=aHb78gd+9drbIZNnsEvSAmcbNnvwvlYLpdg5JVqztRWRGRgcq6tezNaaaYeEiCVIfH
	OXeQA5UnNs+dq+fDxgVhgWuRUsxssa66VDmxlmO7zQcJT7z3ewqRpK2fHrVf/mC26CPQ
	Gkck0WcevFyeRAk7NPnKqPKJy0fTFPXlCD4BjRNbvqQ26D20oq/EuObMpU4p6qSWxahi
	FrrlEPtrgM4lAOZUJ0AmRhVaKZPfelqvDYrCDX7dgngpTJEEfGMSrdAM8BSvZDXKd28y
	JAEyp9cWGWhPvwuN5wimth3cBCenbqCcVFYpzV4thuGicntOqezypiGX3n6FLTaEt+uE
	UflQ==
X-Gm-Message-State: APjAAAWr8LoqoDKLJ0BcseN5ABp9wZCC/GKQ8Tlr0RIVl3AyOC9Yg51l
	gxoAfZJele5Tl9WvDNzauM/0QWnTzfkt+Q==
X-Google-Smtp-Source: APXvYqxbsjf1jvJ0H5IsOTWF7CTvSNcVNxsT4haiL8Lli/DshBnN+K4/PS81r0N41ocuwhGvSTG9/w==
X-Received: by 2002:a5d:94d8:: with SMTP id y24mr21631249ior.131.1572973989906;
	Tue, 05 Nov 2019 09:13:09 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
	[24.9.64.241])
	by smtp.gmail.com with ESMTPSA id f8sm2681942ilf.36.2019.11.05.09.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2019 09:13:09 -0800 (PST)
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <673f5568-7fa9-66c2-2408-81d405d31465@linuxfoundation.org>
Date: Tue, 5 Nov 2019 10:13:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] Archive for linux-kernel-mentees list on lore
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

linux-kernel-mentees list has been added to lore archive

https://lore.kernel.org/linux-kernel-mentees/

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
