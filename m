Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B8BC54FC9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 01:56:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93721214AF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 01:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8Orgpmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93721214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E277870D7;
	Mon, 20 Apr 2020 01:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKI27+uia+zl; Mon, 20 Apr 2020 01:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 521B287032;
	Mon, 20 Apr 2020 01:56:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39389C1D7E;
	Mon, 20 Apr 2020 01:56:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC548C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C57CE2038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNn1Yag+NUws
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by silver.osuosl.org (Postfix) with ESMTPS id E3D482038B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:56:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k11so10182755wrp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Apr 2020 18:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:cc:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=UYNW5GeAYadqc/oT9I6i9oO9sDz1gyzVuG0OOlSZVV8=;
 b=Q8OrgpmgZ9AI0UJKDOXheHaO/ygaIRB+5/M+7gIZUhxNkyXxtwZcqTH1VIOcN02aW1
 dsnCpsvbZrcQu8/dQXQqrRNwITFa9Y9gJTaHxW2msvzZGjp9CK+pD4kvaovoho414h3P
 vvyKmDSPV/Vu5Ppxw9GZnWPEzz8/SUwfDqdxcN5I5AWK+1UAl8IkSCfWOm/zaSv2Yw6f
 4vTJq71c+PyWa6Bkf10MCLlwDVu+jEJ7KMkCdt/STOtIIiBhZoNaFrNrAtxr2i9/b7sH
 AANPG/sGa5gl7dNzCjwY6XN8e3lhy/nVyU68wKXltH0FAJiQqzrPrrvukKi3MSZUl+P9
 3OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:cc:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=UYNW5GeAYadqc/oT9I6i9oO9sDz1gyzVuG0OOlSZVV8=;
 b=Xo1N4HOTwsfzrdygX0Vfn6uAquDDAsnRoHM8a+jCHkLVdLuVQJpRWvPyLJfkIXr3D1
 yOL36hfyJ2aZRhZwOgk44UMH5cGN0eiMkK6bB3QdSMeXq/x0U4IZMJx/czLWnToINwFU
 86z2/oYQnNIlVUEBkh49bIlF4z4TAcBrq2LaFc4Z1eRzADkZ4WL8ClL8OrdBRLa7Whzw
 VJ6UNeX4L03duwiOgrbxYTBJjGtODG7FLlSQcaMr65F5yBnxdNWQRXuW3jxFWO6aQs66
 YSfulu3neeBLWsC0SYBUIsgT4PS6dAbpifNlUBqSVfgWeHFlVZuKyycLxXunAz9coGxs
 4vAA==
X-Gm-Message-State: AGi0Pubu3qyw/Zc9jttjxThX7bEk/t6SZMX6+tcUhNWg36rMTFRqWert
 7camQ+HYBJa4nLmlrfeDKR4=
X-Google-Smtp-Source: APiQypJn2DpwBLi+iJbbpMgoH2otNrMCOHDU7NtjfDloMVmHh5vrKgn02fJFjF/F1rl+D3RbtdQC+Q==
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr9392073wrs.11.1587347766394; 
 Sun, 19 Apr 2020 18:56:06 -0700 (PDT)
Received: from net.saheed (5402C526.dsl.pool.telekom.hu. [84.2.197.38])
 by smtp.gmail.com with ESMTPSA id 36sm27199054wrc.35.2020.04.19.18.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 18:56:05 -0700 (PDT)
From: Saheed Bolarinwa <refactormyself@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, mchehab@kernel.org
Message-ID: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
Date: Mon, 20 Apr 2020 02:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] Is anyone working on fixing warnings these
	Documentation files ?
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

Hello,

Please is there anyone working on fixing these files. I have have 
checked the email archive,

though I surely have not search thoroughly.

Please, let me know if you are working on any of these:


- Documentation/admin-guide/ras.rst

- Documentation/virt/kvm/amd-memory-encryption.rst

- Documentation/trace/events.rst

- Documentation/power/pm_qos_interface.rst

- Documentation/process/programming-language.rst

- Documentation/filesystems/fuse.rst

- Documentation/admin-guide/bootconfig.rst

- Documentation/admin-guide/hw-vuln/tsx_async_abort.rst

- Documentation/filesystems/ubifs-authentication.rst

- Documentation/driver-api/driver-model/driver.rst

- Documentation/driver-api/gpio/driver.rst

- Documentation/driver-api/thermal/cpu-idle-cooling.rst


Thank you

Bolarinwa Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
