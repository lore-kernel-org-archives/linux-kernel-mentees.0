Return-Path: <SRS0=Fejl=GX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651C2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 12:53:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC26E2333C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 12:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC26E2333C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D5CB86905;
	Wed, 20 Jan 2021 12:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOYcBghgPHTl; Wed, 20 Jan 2021 12:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C66A986948;
	Wed, 20 Jan 2021 12:53:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFF3EC08A1;
	Wed, 20 Jan 2021 12:53:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08397C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 12:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFC6A203DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 12:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TkbryXhMOOG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 12:53:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by silver.osuosl.org (Postfix) with ESMTPS id 14B4B20345
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 12:53:24 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id n25so15159448pgb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 04:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hB+1o0DrnShLgQiO0WE1Gdsq3IMq61KourkCYu6qcaY=;
 b=Seq9VaSKx/HQCC1k4Uz7Pk3ROqFrZ6fucBgqAuYXmtaLwbmKESKzwhLRK8Oi2p+612
 /34CKTXFTGzASV79GPoEG++AHzsWgeqWRZM5QBYCZgX3CgdgwPxRVrQxbexWbiPXKh2t
 NXZcZQBN/E/EPD0V8qzxmeJgEnmaA5YelJIkV6wANe38GBkU6vrh+V1sxNXPwGZh4Taa
 SPA8vttyYnWVeA1bDMnAE8TcJUUrT1C4rtP7HFeYUBBlKGcJ0STTqpOzeK9zFWJmAspR
 mh7smVY2msulNe2rFtBv2b+GjyZUfsNzZ/FJVvah9Jhriz87GZ4i1+Ky495MU2NN4W/5
 qFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hB+1o0DrnShLgQiO0WE1Gdsq3IMq61KourkCYu6qcaY=;
 b=fO7zoD7YuSoLqygHlkquZP1NAP9pGK7wmvjobn2blZ6KSaNuOnEe5lpp068nG/wzvs
 vYXQUIWipzFE1XYYexxHwLwN7mvfhGzcL6nofjVEE24aES/op74RZvtp3y/THQv0Gbub
 d6XabuIo2i3ixv9z54wXpAW7iJKU6/4Mi1R9Pof+pUfkM3YfWb9RGLFmxPV5wfkFrOpe
 grOO+MxbMpBhEWHj5J+iXfFqKd96Ar/ayMK1JzEqlfnDAIc7ahOZtHkG8vGvVWqvvl0U
 OPeMbB2YvWEaOVIMLoZMZh6fyqRCPVLrthq7d7asTVSqVy+bQe3760A2thVN4jHqaqu8
 nGYw==
X-Gm-Message-State: AOAM531t9tKKwBLqJ/w2Cn72V4KdCDR+kdRMy2dvWPC7Xr8WQiSn8Uo4
 2f5jnrLLdqouPhX49Anv+zg=
X-Google-Smtp-Source: ABdhPJwa3aot/XiE+R+h1fEeREklj3vFnePmy4/tZlr4My0oqbnc+lzORozd6rTMDgtGrC545XsD8g==
X-Received: by 2002:a63:4504:: with SMTP id s4mr9089641pga.284.1611147203498; 
 Wed, 20 Jan 2021 04:53:23 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:7054:d78f:3538:6af3?
 ([2405:201:600d:a089:7054:d78f:3538:6af3])
 by smtp.gmail.com with ESMTPSA id j17sm2242003pfh.183.2021.01.20.04.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 04:53:22 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
Date: Wed, 20 Jan 2021 18:23:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
Content-Language: en-US
Cc: broonie@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 clang-built-linux@googlegroups.com, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On 20/1/21 2:51 pm, Joe Perches wrote:
> On Wed, 2021-01-20 at 12:55 +0530, Aditya Srivastava wrote:
>> Local symbols prefixed with '.L' do not emit symbol table entries, as
>> they have special meaning for the assembler.
>>
>> '.L' prefixed symbols can be used within a code region, but should be
>> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>>
>> Add a new check to emit a warning on finding the usage of '.L' symbols
>> in '.S' files, if it lies within SYM_*_START/END annotation pair.
> 
> I believe this needs a test for $file as it won't work well on
> patches as the SYM_*_START/END may not be in the patch context.
> 
Okay.

> Also, is this supposed to work for local labels like '.L<foo>:'?
> I don't think a warning should be generated for those.
> 
Yes, currently it will generate warning for all symbols which start
with .L and have non- white character symbol following it, if it is
lying within SYM_*_START/END annotation pair.

Should I reduce the check to \.L_\S+ instead? (please note "_"
following ".L")
Pardon me, I'm not good with assembly :/

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
