Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94134EE49AF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Aug 2023 17:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D69D81776;
	Tue, 22 Aug 2023 17:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D69D81776
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VfouFOcE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u66GHLglfJAz; Tue, 22 Aug 2023 17:44:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EF52381468;
	Tue, 22 Aug 2023 17:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF52381468
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7F75C0071;
	Tue, 22 Aug 2023 17:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E69EAC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 17:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4EF840BF2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 17:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4EF840BF2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VfouFOcE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIz533BahBzL
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 17:44:53 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67CD40BBF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 17:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67CD40BBF
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so3877271b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692726292; x=1693331092;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D83pxoorKSMZ3KXT4tteloMjPSR576OWtj/BqTWoltc=;
 b=VfouFOcEQm14bIP+hmAy9H5Cbv7pd8goiWgJvgc1/lWxlzx8olBW3oKzSwr9VnqdBi
 plsJsRPUMXz4Ru4PwMrCp8aDdrOWhuSSnIDwGnUP7utY8nrhv5bXAZKjtoxpOs3IRcT7
 U9wXwvDoj9coLJ+9yMf4iMbS9wKZ4ZxoM7D8k8xSlgYWlS/VtCgnOy9Tk9nxZ5r6nKX7
 03DGfI9Q0eZ6mRNWgpH6ppeR+3UoBXmuuCDsj63/RyrVJzvmsxzgaEx9ZaFZi9TuUGVS
 VtC7G+VBbngPYQTX0KFlorQMeFIm9skopJwZAwnQgZaJKA6LdrMC1srd+bEbmBtsaG+D
 khag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692726292; x=1693331092;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D83pxoorKSMZ3KXT4tteloMjPSR576OWtj/BqTWoltc=;
 b=ju11NpRLKFPKWdyH+N1GzGYWVjLm0H9Bg8qXVm9Ea01tdi6DRPrjrbrrp8atT6/8TD
 A1RauYJFbhs/WdXw/exFv3XTnEhb9jMH4IxMIvSpf/1c5d4GYw95rSq2bZQG0QJ4OIgl
 TuCa1YNrSC3N43zwcQYDjJ4V+xCW9EmV9vSt4lMwKvWmNaX9ihwAwtGoTRpkI3ayB+04
 s6nlyWiRTuOC9imVcvS1IApfnrcrThSrvjHIDzvHmH3C+Stewll4Ko+hFchMHymckqQX
 EXMYqWifchlZQrXsFNm2kEldaxLA3qPEyGyNtgaqJNrbGHkfzXcuaiD/PBtKd5OVwa5M
 OE1A==
X-Gm-Message-State: AOJu0Yx16pgKXEoZslgxgKdxteCupqAk0jJecw/wLs00voyZfulpNt6Z
 3xnflNBM4YN6DP1KmoI9EPU=
X-Google-Smtp-Source: AGHT+IFKTE7SIbTMMWJAx0oW0kr9RcAgSRKog0enFdYErkO+dy/8hNTNi/3zJPYuYshsZtVCFglNpw==
X-Received: by 2002:a05:6a20:1456:b0:13f:c159:63ec with SMTP id
 a22-20020a056a20145600b0013fc15963ecmr14333954pzi.24.1692726292148; 
 Tue, 22 Aug 2023 10:44:52 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.176]) by smtp.gmail.com with ESMTPSA id
 n15-20020aa78a4f000000b00682a27905b9sm4500417pfa.13.2023.08.22.10.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 10:44:51 -0700 (PDT)
Message-ID: <f2b664d5-0710-67ae-fda8-d407af4df6fe@gmail.com>
Date: Tue, 22 Aug 2023 23:14:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: anton@tuxera.com, linkinjeon@kernel.org,
 syzbot+ef50f8eb00b54feb7ba2@syzkaller.appspotmail.com
From: Manas Ghandat <ghandatmanas@gmail.com>
Subject: fs/ntfs : use-after-free Read in ntfs_attr_find
Cc: linux-ntfs-dev@lists.sourceforge.net,
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
Reply-To: 000000000000aefc5005f5df169b@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

I was looking at this syzbot issue : 
https://syzkaller.appspot.com/bug?extid=ef50f8eb00b54feb7ba2

While debugging I found that when we are traversing through the 
attribute list, there is case when the next attribute is null (most 
likely we are traversing out of the list) and thus there is this error. 
I was wondering if we could add a size field to this attribute list. 
This would fix this issue. Currently we are just parsing to the next 
attribute using the length field.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
