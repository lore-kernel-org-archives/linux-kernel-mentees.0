Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262E5C3E8C5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:02:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F4A221F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btNf5rVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F4A221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B385384482;
	Wed, 18 Nov 2020 18:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgU6FIn-OtzD; Wed, 18 Nov 2020 18:02:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D62084410;
	Wed, 18 Nov 2020 18:02:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FFFBC0891;
	Wed, 18 Nov 2020 18:02:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF852C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEA9722B25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvtLgtbN4uuJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:02:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by silver.osuosl.org (Postfix) with ESMTPS id 795DC2291D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:02:07 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id g7so1915322pfc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7ufxdXxLALhq+5RvVAIkp3GooJqmbbvJSLROuf5Zqsk=;
 b=btNf5rVy2lcx7XPHQF0fSI4tvOuwCMU+FBcwO6lrz6IyP9HhPs6SYY05dzae7bd8lS
 4bo2epsmxTDyHouc5D673SyaLtTWNkhPf+3DqCGsx8ljnrTKYE1OBYTb2VkkNv0aRET4
 Be/f80ToaZZX4UsFr7oOjvPeTMr+uBihcdSk7eSAO6xAYnI3MFDBzgCsKOOov/P4IwEG
 k7QBEkC/Pj9OCO7tiXk0tUaFHQ7nmRZwf9uedIBeCZtJ+OjzL/CM8TqYiEqiBHzpGTz8
 /Ydw5gQhB1rbI01gSQB3bPKQ4gO2P1uwBLvg/M6TllBfP2RmPbnCaE+RcoyQrgovewsy
 J7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=7ufxdXxLALhq+5RvVAIkp3GooJqmbbvJSLROuf5Zqsk=;
 b=q7OQTi8C8YSBKC5EfQ0Yrg4aJY+CwoMXkJbZOD2PfAPpzuAwBEsU+hCmTdJzwRAjtp
 /uREyRAyGhBBnGddVxTu+TA38AW5TbxK8f2eTyFbSXx1SS2ehRxsaYGujPV6YH6yWBlI
 MwMRZSvcH0Xb3RtMd9IOQo/koc54l4i9U/r4j6ufHHGjDjHdVSyIVFHgl3Fn3T/zx7U/
 w2AbxgyFOVtKIw4uK7PFcuKXxRouarK3Gp3/pP+AaC5y4sIJlcex0mWyJJn0721xq31b
 Ta/p+zw4U6mQ3U9rRvKB5jnZmRACPtMsQAbitllvsqDw6vEmslGOQbm8Nb/OhXnDmNMO
 6uGQ==
X-Gm-Message-State: AOAM533EuVCw0GZFLAfeD3ndoj8K7mXrgQWtobHJ4BhoeLFIHstNWCAa
 PSCl+MY+r5b0f3jf66maFlhactmQzYjQyQ==
X-Google-Smtp-Source: ABdhPJxx8KAQQSfiwVM2juhksQE+0r8vHQAvQSzRLQkW9neFkETwVIG8pwRNdJTCWECnzhX2ZFKzFw==
X-Received: by 2002:a63:4765:: with SMTP id w37mr9121064pgk.332.1605722526525; 
 Wed, 18 Nov 2020 10:02:06 -0800 (PST)
Received: from ?IPv6:2402:3a80:43c:f24e:b031:6d03:e76d:9978?
 ([2402:3a80:43c:f24e:b031:6d03:e76d:9978])
 by smtp.gmail.com with ESMTPSA id 23sm25888512pfx.210.2020.11.18.10.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:02:06 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <1fa76103-e32c-0443-dde1-9ac4fc45f79a@gmail.com>
Date: Wed, 18 Nov 2020 23:32:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Adding doc for parse-maintainers.pl
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

Hi Sir
So, I tried finding doc where to add documentation for
parse-maintainers.pl and MAINTAINERS.
I think the only place we have documentation related to MAINTAINERS is
here:
https://www.kernel.org/doc/html/latest/process/maintainers.html

Or https://www.kernel.org/doc/linux/MAINTAINERS

Maybe we should add the changes at the end of this section:
https://www.kernel.org/doc/html/latest/process/maintainers.html#descriptions-of-section-entries-and-preferred-order

ie at the end of "Descriptions of section entries and preferred
order", something like: You can achieve this desired order using
/scripts/parse-maintainers.pl


What do you think/suggest?

--
Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
