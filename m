Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7DBC43464
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 20:17:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F40921D42
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 20:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dswyVVpW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F40921D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 073A486B34;
	Sat, 19 Sep 2020 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsJVDD4eIZRI; Sat, 19 Sep 2020 20:17:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E250085F15;
	Sat, 19 Sep 2020 20:17:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDB62C088B;
	Sat, 19 Sep 2020 20:17:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 043B2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE775872C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNSn5pDn4Y0v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:17:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 42531872BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:17:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x22so905182pfo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nufqMxRxzBynEUzPSmKE11m5kNg4+eB3mixf5Nnih4E=;
 b=dswyVVpWzVbiP2kS5AD/QD8cHzI45lM/MxkySFRQSVYmP2C8cVcZnsoIUHMkeP0p6/
 NlTrTAXVIQGKSljeVEQhU+rnZwZ3C/3m2dB4u56v+olo8gfT5B9MdaXdKTVwCBBXSfso
 d5Z4wDdJJBRlamEyPm/YjKSiZ8yioEkioxLfq+AigV1SPZ/xhfZr0jOIVyYzat9wDWYC
 51w3q3tm5bQ7RG8qzu+7WpdTHbkb0eyDyFpKSEapx3qUPx39/PPaLOEEJuICYPy02oWM
 UnjgNwiJitmwsUd5YiujlNl9YLxZIOY8BPW9NDqyDoHD3//eqchZuhpJIFz3Tx97SysN
 eKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nufqMxRxzBynEUzPSmKE11m5kNg4+eB3mixf5Nnih4E=;
 b=GMNGWucxXXQJsUR4sa7dzMYayV3kxGKKUZJa/2AncfZl5W+eRHdwVb7G5eXGPIlx8+
 XPljwlTaXxLXvLg8xj3lCtld54McKfia6QprNGfK1PniAPnFTP9pNNw16QMEh12RpMkz
 AHTeQMqBB4m6IoSDfF4lVkEIAovGhKKZpu8dYMOVJZAWYSHu1Svwo5A72BTEZqRbANQY
 UKWj8HRljRjoV9cxXpitcF3n9XTpBmEfdiPkqAh9/gK8Y+2LWzfa5T6bGJuVs8RBtZNA
 UDUPIW2wQjFNIbpgdzT85TVoytRiB7kfI3UDF2NBQYuBrWc8BOolYzW9rYD5ScZPq7Y+
 ERTw==
X-Gm-Message-State: AOAM530FX652JhtyIlWsI9RRToklx85yGWF0hwQmvNtKkZnd1QlJUb+Y
 AlINVS5p7FeaEt/Dt3Hxk1M=
X-Google-Smtp-Source: ABdhPJwmaLvMmQ0FhJwwhvT/7QRl99Kv7dcwIDpJdJkJ/7+mObcFcvLUIlKkLC9FIB3sn+NWTWMmwg==
X-Received: by 2002:aa7:8aca:0:b029:13e:d13d:a07d with SMTP id
 b10-20020aa78aca0000b029013ed13da07dmr37930221pfd.20.1600546664624; 
 Sat, 19 Sep 2020 13:17:44 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.24])
 by smtp.gmail.com with ESMTPSA id d20sm6371822pjv.39.2020.09.19.13.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 13:17:43 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
 <20200916054157.GC825@sol.localdomain>
 <20200917002238.GO3421308@ZenIV.linux.org.uk>
 <20200919144451.GF2712238@kroah.com>
 <20200919161727.GG3421308@ZenIV.linux.org.uk>
 <20200919165558.GH3421308@ZenIV.linux.org.uk>
 <26d881e5-f68a-b3b7-4cb0-04a3c6c384ac@gmail.com>
Message-ID: <e8b218d4-e64a-ac0a-ea53-567d07a58f42@gmail.com>
Date: Sun, 20 Sep 2020 01:47:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <26d881e5-f68a-b3b7-4cb0-04a3c6c384ac@gmail.com>
Content-Language: en-US
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 19-09-2020 17:03, Anant Thazhemadam wrote:
> On 19-09-2020 22:25, Al Viro wrote:
>> On Sat, Sep 19, 2020 at 05:17:27PM +0100, Al Viro wrote:
>>
>>> Lovely...  That would get an empty path and non-directory for a starting
>>> point, but it should end up with LAST_ROOT in nd->last_type.  Which sho=
uld
>>> not be able to reach the readers of those fields...  Which kernel had
>>> that been on?
>> Yecchhh...  I see what's going on; I suspect that this ought to be enoug=
h.
>> Folks, could somebody test it on the original reproducer setup?
> Sure. I can do that.

Looks like this patch actually fixes this bug.
I made syzbot test the patch, and no issues were triggered!

Note:=A0=A0=A0 syzbot tested the patch with the KMSAN kernel, which
was recently rebased on v5.9-rc4.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
