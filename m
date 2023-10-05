Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21EE936FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Oct 2023 05:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF45C41F34;
	Thu,  5 Oct 2023 05:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF45C41F34
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dfVadmSa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Agr46F458rai; Thu,  5 Oct 2023 05:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 47A5C41511;
	Thu,  5 Oct 2023 05:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47A5C41511
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 244DCC0039;
	Thu,  5 Oct 2023 05:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2325CC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 05:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 060CC82299
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 05:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060CC82299
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dfVadmSa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdXh1nSK2ybo
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 05:15:55 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0147B8228A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Oct 2023 05:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0147B8228A
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c77449a6daso4596335ad.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Oct 2023 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696482954; x=1697087754;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9nT5tLRN5qqmtXX+vtQZ11JSBruGv0fxOyk+moMln8=;
 b=dfVadmSalkGwhuUWfQ2IiPmvs2HVX7vKASkZMAWXSA+je7CKYM2JbmEkt19jlK4178
 KWXfjcYq6oYaVKj27b4APJKrTNT5uDtXmyZUMXO78OoHMvcKed2xLZlKa95wsqMBoCSs
 1pomQXnGAS4+t7Gw8flJUIB1HV+xMAU3ziGLSpiuczgCqBjw5XcIpgmlbiUlpH4KEOwR
 sU9ok2QLy4gRoE5ZwMCH2xpbJN6oNzvNNJwxvKoxxtIuj/dZAZAVSXmBomFmBQZ64Mtg
 LlD5HlnPy9klWhL1KVf7InJepo3HwMsHFzCDgTFTCu2cAC2IVtqoh+siXGtypwFvFLf2
 CaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696482954; x=1697087754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9nT5tLRN5qqmtXX+vtQZ11JSBruGv0fxOyk+moMln8=;
 b=A1RZ+uMOrvuQPcHuYSxesDLRixtzJEx8lPzyEexHHoJbKhEk37+gUb3PrPdGlnRG/v
 n6JVy9f6Jc9iHx/J2vrNrysqnDk0rjPhKMyeQK0ze2YkFx+nDD3PLYWz9aoL37KhdbHi
 WxSWzhTqx1lS8tAIKaPw341siRAChlrZ5gQLgJLxmupymdRmzUL4hnQrL/2sduU0oWdp
 6tLUuyKkqvYfp5yLM7amdjqnK00zaCymuQNsc2GC4zkjUsdytfV9f927A8xIQsHsCkKX
 LT/S41AKrZQOAv0X/dc2Xz/NcEHhdFG7JDnGL0EB0g8gageZialOtnQWXboLGrIp5hqu
 a41w==
X-Gm-Message-State: AOJu0YyPeYuBEOStcaSXdXq2CQjfgg/aKfhko1O0MPneQW5DJqwovOci
 clboztk6iLHg+dhU6Pw3RWA=
X-Google-Smtp-Source: AGHT+IG0E0MClgQEMPm1p4gW05l/cLgh45hB65zPuXG48f5XxjBjvLGQ87pk67e720CBKvIJ65j8ZQ==
X-Received: by 2002:a17:903:2445:b0:1c7:4ab6:b3cc with SMTP id
 l5-20020a170903244500b001c74ab6b3ccmr5233304pls.54.1696482954260; 
 Wed, 04 Oct 2023 22:15:54 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.179]) by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f7ca00b001bc445e249asm533587plw.124.2023.10.04.22.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 22:15:53 -0700 (PDT)
Message-ID: <3d4e0f62-35bb-4b18-a64c-191c88415032@gmail.com>
Date: Thu, 5 Oct 2023 10:45:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs : fs array-index-out-of-bounds in txCommit
Content-Language: en-US
To: Dave Kleikamp <dave.kleikamp@oracle.com>, shaggy@kernel.org
References: <20230919155542.4354-1-ghandatmanas@gmail.com>
 <423182d1-3d75-4a73-9011-da24658a40cc@oracle.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <423182d1-3d75-4a73-9011-da24658a40cc@oracle.com>
Cc: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com,
 jfs-discussion@lists.sourceforge.net,
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

On 04/10/23 00:46, Dave Kleikamp wrote:
> The size of the xad array can be either XTROOTMAXSLOT or XTPAGEMAXSLOT 
> depending on whether it is the root, imbedded in the inode, or not. It 
> is currently declared with the smaller value so we can use xtpage_t 
> within the inode.
>
> I had promised to address this, but haven't gotten to it yet. I'll try 
> to carve out some time to do that.
>
> Thanks,
> Shaggy

Can you guide with the workflow of how things should be done. I can try 
to work on it and resolve the issue.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
