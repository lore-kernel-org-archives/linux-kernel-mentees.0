Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D8C83F01
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Aug 2023 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAAA241D71;
	Wed, 30 Aug 2023 16:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAAA241D71
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jU50Xyyd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlZZWZPpA6gy; Wed, 30 Aug 2023 16:59:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 88E4441B51;
	Wed, 30 Aug 2023 16:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E4441B51
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57F5BC0039;
	Wed, 30 Aug 2023 16:59:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 796FBC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 471978226E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 16:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 471978226E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jU50Xyyd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMY6HeKR0T5Y
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 16:59:05 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A698190B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 16:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A698190B
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-26f7f71b9a7so3697101a91.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693414744; x=1694019544;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgkRy2fHXk12I8uXbR8oF1JVRCE6YBpekWqJS8+t/SY=;
 b=jU50Xyyd32xk88aJooTv1enzNSFyzxDdYhs1S5+KYvKSfwmK+8sbcfdHnKp2PfrqK2
 mCVKMvTZnCLyzD6pcz/uyjt1aNk7fq9IisRPNG9wFx1th9/bxHfskIp8GnPYacH4megc
 rEGP2PZv4UDCGlf8QBPjMA2tHSbbTCjbh8/MsLrmDqpWS70jId/xjLs/QjiMkNomPtx0
 klTsy8c+Y0NauuM4TRhQK7iWPN006Pt1N5rX95tHPNo/Q+s4dKHP4XoJJx7jWGfjgJTe
 GqJrnxVrMJSrfxqdmZqxh3PaWrw38R+KqgH/ODepNyDnNrs/j3JxOJBF2oWdX2yAEdYF
 pMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693414744; x=1694019544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wgkRy2fHXk12I8uXbR8oF1JVRCE6YBpekWqJS8+t/SY=;
 b=FfPbApWgyodAzBriU1M/05YEFa07hW3CaMbzmeViudrQu65yb1TR3rSnRVWzUbn41s
 cd0v0LGVN9UbT9+7e5V8BsZITOVF/NBSpRPs2UA5rMZjJyV6lp0O7ECvQThEiuUhitqu
 hnvOJB01DzP8bWjct+N9AnVgbaqv+DcPUMJ816JBMXGLBVNZqxUAFvQM/hQ03LizpXXT
 /FAeCpAu9c3y2y/JT+7J/JhgWdzXdrL7CrvI66OybkgP5/GtbAnmd2OMBHm/ATAHDTxl
 j0KUlDyhUvKDW9cWh5tD/zdujGIR+FnrOc6hRNZ1xB7ofkE4Lke4Gl9tSG+JV5XjCswx
 AL9g==
X-Gm-Message-State: AOJu0YwXWMI8tr9aNcAaPY299xIArL/Pu8BIwqnrA7Uo0eeHf+0D+LAt
 cpaP0w7tQdtt73txFrZ2NPA=
X-Google-Smtp-Source: AGHT+IEiBWKa3xloyf6eL2PYGoBgEH0g8SDOhM3inWHe4UsSlpRC7tRISmG4yyxSsF9If5WjYXUl6w==
X-Received: by 2002:a17:90a:7345:b0:26b:4a9e:3c7e with SMTP id
 j5-20020a17090a734500b0026b4a9e3c7emr2738462pjs.4.1693414744444; 
 Wed, 30 Aug 2023 09:59:04 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.174]) by smtp.gmail.com with ESMTPSA id
 d13-20020a17090ad98d00b0025bfda134ccsm1496364pjv.16.2023.08.30.09.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 09:59:03 -0700 (PDT)
Message-ID: <e655b722-f610-99dd-16c1-ed3235860a80@gmail.com>
Date: Wed, 30 Aug 2023 22:28:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs : fix shift-out-of-bounds in dbUpdatePMap
To: Dave Kleikamp <dave.kleikamp@oracle.com>, liushixin2@huawei.com
References: <20230827050513.364567-1-ghandatmanas@gmail.com>
 <edf10660-2e8a-4f5b-8eb5-16038f8adbcf@oracle.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <edf10660-2e8a-4f5b-8eb5-16038f8adbcf@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+91ad2b52815a08caf4ea@syzkaller.appspotmail.com
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

I checked for the v6.5. Its fixed there.

On 29/08/23 23:19, Dave Kleikamp wrote:
> On 8/27/23 12:05AM, Manas Ghandat wrote:
>> Currently there is no bound check for number of logical blocks per
>> page (bmp->db_l2nbperpage). Added the required bound check for the
>> calculation of dmap.
>
> This should already be fixed by 11509910c599 ("jfs: jfs_dmap: Validate 
> db_l2nbperpage while mounting")
>
> Can you please verify if this problem still exists in v6.5?
>
> Shaggy
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
