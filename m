Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCAFC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:40:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0CB206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzTgbfRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0CB206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 615C220410;
	Sat, 12 Sep 2020 11:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPrGnsELzOW8; Sat, 12 Sep 2020 11:40:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C82920402;
	Sat, 12 Sep 2020 11:40:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25EA2C0052;
	Sat, 12 Sep 2020 11:40:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6902C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AF1E687685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bq6Naivr13qx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:40:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 687678767A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:40:51 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id x123so9109885pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 04:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Xg+wawjSxl/HC7bhG44igY9Wecjh6tzUKcFk6cUYFqA=;
 b=jzTgbfRG4QwwFICTxwb7tjiNrJsZltcqCMA8l/gtnbN/zUAG66x2rRyNFfzaoFDRju
 5zFtlH3VVgcYpdZyfEh7nUiqQnvzwUiUwq8IcfxewFuENBFgmKkDwZvklssFRyJ9P1eK
 25fsqKGqV59iWHZYXPdhWBLWqQq4t+PTwL2AQhbZg0aKCyYeen9apxfcfuJH+GpCKcRA
 Ewkyv+fO28ccKVJP2phsgx1R7+skr3sf02vuXkYfeZA/hGyA2TSevEBGgpqxwp5lOGTj
 0mN7qm00SFsowJsho7IE2JXesyoq7fIkMRw5/VMztQjKl8Opamvt8YxVZ5hs+zs1ESle
 He9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Xg+wawjSxl/HC7bhG44igY9Wecjh6tzUKcFk6cUYFqA=;
 b=bII578W5GaAGISjRpp9xfd2ECwKCAbUhV2XowwwpLeICj+2bwFYPrFpL5z9EjFMAmi
 7gQvGqDJ76j0/DJhuXRpD1Rk5x0Br+GsvHkFcLpfOB8TnHjBqvXr2k7zF2CQvEW0eZ70
 a40fEQosYwEB0WuK8qDh0lq/e6F+cZWNuTpZvLtngqu/clXKYl/+XzdDvaRVLr9oR9V8
 CbT/uFLfRUsK86byFxbvD0F7c+/s0Uuh5iy1IBub8pT3ZzAez3qbdczNB6iJHIXPEDZZ
 LV+NSwik8bCz1zSvLRJiano7powVxgka1SwTQHJ8zqhQLF2+eitVhpnKcJehZLZGP8SL
 TWmg==
X-Gm-Message-State: AOAM5300oYq6OROCbYMSLqRM0DJByWNb7aTKZcipmVdKMvF4XvDNtMsD
 TTSeEVbsVWlp9CWBTwQ/YwEfzVScxwlfuw==
X-Google-Smtp-Source: ABdhPJx6zv8lDofl7RSnlH9ANxkCLwDFVtS6Tll5mzJ6etbZcEba81T+n3ZEng93oLMMBDBKr+R99w==
X-Received: by 2002:a63:1257:: with SMTP id 23mr4340881pgs.401.1599910850437; 
 Sat, 12 Sep 2020 04:40:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id n72sm4955413pfd.27.2020.09.12.04.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 04:40:49 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
Date: Sat, 12 Sep 2020 17:08:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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

Hello Lukas,

I attempted the tasks.

Below is the link of GitHub repository containing my write-up and findings.
https://github.com/Ujjwal0501/lkmp-checkpatch

Kindly take a look and give your opinion.


Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
