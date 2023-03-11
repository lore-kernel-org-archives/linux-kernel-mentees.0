Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A7EC61DA4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Mar 2023 17:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04DE41C5D;
	Sat, 11 Mar 2023 17:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04DE41C5D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pHGpBQ07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJxKHupxEDHV; Sat, 11 Mar 2023 17:35:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4BF6441B57;
	Sat, 11 Mar 2023 17:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BF6441B57
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 236FCC0071;
	Sat, 11 Mar 2023 17:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E3B2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 642524046D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 642524046D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pHGpBQ07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uN-vZVIv4afk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB0A400C4
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB0A400C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:35:45 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x3so32964616edb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 09:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678556144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=inkmI/Yc55oH+OAgW/G1RQMkGyBxBvxe3t8F6Rn9vUA=;
 b=pHGpBQ073xM2B56EvVGdkyPDPc2e2lY3LZlq3DkqgmHpKoMzrOTG37LsE8XI4w/sQw
 mdWuBiAqqwl/ni9QcB2IYANfjhTKVScmyjinmHlpDPAMczMY4MFlRQKCiu2Qz3IE7pHZ
 O4vYJq0slSj+TYuraVo2VYJALXgswIP4fvY0YwFe1E6whfGGQWjw6GamzeVL0F0BeFTm
 CXuPvhSbluqR2MJ27JNghrZSz4lheJBkldd+U+6nYeQkpW1GlSgQsT77KvAgRzZecQhM
 Fqwmp8DK4Fo0JV/07N2SffV4diUn9KdGD+vmWG6lsWp3hmpcCHm7UH1ulgxRirRJeNtb
 th6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=inkmI/Yc55oH+OAgW/G1RQMkGyBxBvxe3t8F6Rn9vUA=;
 b=UZq+uE1BWuVa+nca7p7UuX5KdNo+P2mWdJKUKp8mpcsLnui7xl3elcVL0vbZpJMMgy
 E8G77aWDFOl1pnBorok58+qvBf/E0/jqu92vv5i1vJVBAAIPbimD+dMlNLsy4quRl43L
 u36M/wbq8TU8HuLcVh+QKFRdDQLYUqpaoN7+jSQQKL9q9kwM0/dTVgeZXa0wPC3Oo8+L
 bU4cKLr513SgXzPhxmDMci2x5I2nW2wAFkRFivV+QfAdTpbr02wLyRiToQnmKBMRKSD5
 N8ov6EM40r7E2FOdHijCOtw6Bf3BK7kfDnPnBM8kQV5gjDT/kT6psOtAKrKGOL8r9gBX
 2x8Q==
X-Gm-Message-State: AO0yUKUtOIZ+npUkVcdtsyRi9fxM4MJceQiTzKhQiRXV0Ywpakhsaz3m
 dElOaOFHcvCQlk1iZHUVqOk=
X-Google-Smtp-Source: AK7set+wjuNcDAjxAcSlBFN1Kql0mhZJD7n898URWMUbIbQwCZ7D6krXKc5StYEaRyb8plJ2mAqAaQ==
X-Received: by 2002:a17:906:10c8:b0:8b1:94cc:10b1 with SMTP id
 v8-20020a17090610c800b008b194cc10b1mr6628865ejv.7.1678556143979; 
 Sat, 11 Mar 2023 09:35:43 -0800 (PST)
Received: from [192.168.10.15] ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a50c38e000000b004fa610895b5sm962679edf.7.2023.03.11.09.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Mar 2023 09:35:43 -0800 (PST)
Message-ID: <d5bb5ff0-1102-c7cd-c21b-c3a7f4f31717@gmail.com>
Date: Sat, 11 Mar 2023 21:35:41 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
Content-Language: en-US
To: David Kahurani <k.kahurani@gmail.com>
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
 <CAAZOf24yhpSBd1926v7T=qDwqvFfLsWMJeMKTafeZ=69hJ4rdw@mail.gmail.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <CAAZOf24yhpSBd1926v7T=qDwqvFfLsWMJeMKTafeZ=69hJ4rdw@mail.gmail.com>
Cc: lucho@ionkov.net, ericvh@gmail.com, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, linux-kernel@vger.kernel.org,
 syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com,
 v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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


> I'm not sure what are the rules around here but I prefer to use brackets 
> more generously.

I think in this particular case they can just make the code less 
readable (considering they will not change the behavior in any way). 
However, this is eternal discussion and I saw examples of both in the 
kernel sources.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
