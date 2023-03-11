Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF8EC61DA4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Mar 2023 06:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73E9410A8;
	Sat, 11 Mar 2023 06:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73E9410A8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Og7FiROu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fx-djc_muEHa; Sat, 11 Mar 2023 06:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50C52409F1;
	Sat, 11 Mar 2023 06:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C52409F1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C2ECC0035;
	Sat, 11 Mar 2023 06:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB9AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 06:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3682F81FEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 06:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3682F81FEB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Og7FiROu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nOogRHAxNjz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 06:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E0181FDF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16E0181FDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 06:12:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o12so29102106edb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 22:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678515130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rVC8LiGnUfG6nH76f2ANmYFw3KtTCvNV7A7+6I82Gks=;
 b=Og7FiROuZ05YCLv2EfXCEia1iQhtPv/bti70tBPQ44KDDZoAs5Um29S+pPuhla/doW
 mo/LYVkXv2odN9UJ0Bn50cJX58XBcgRD+UZ9vIOV6Z8im7BhcJ27H+Ou1z4OL8qVbquy
 6DUvOSKNEb3cOZlEzdXmY431h0NQaFhNcnxoBZFjd6V51Sg0l0p+cANRuTf0ApWY7LkC
 kB760xeH2xFRuDNqKnYTL4+zmAfh+wCBnYsKtoxABXltDIuQiKAqHaDQZvckAOJFGVkz
 Nug6iXfwq04SADdIWcyA2ScaGoBvzdJkD9SLRL+9Uk3az+lZE4+LKyI/2MuNKpSgjZDZ
 nE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678515130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rVC8LiGnUfG6nH76f2ANmYFw3KtTCvNV7A7+6I82Gks=;
 b=byC1taIG2iwOpTldwhq53Yb++Bt0l2gMZhDLnZQL3O0Irafcwks6g9hLjabEBuZEMt
 Odq5K36n2rxriIC7qgsAbIeYY/VT6M0FeAJRDUbfuvfq5PPWx6jempxUfoJ7esU7F8yA
 FSXppaaTfRWaZfuXcyOSebX/sl1/mfCuM1fgjJP39xuybJP+D2z6xMZDpVffy0PBh1iR
 FfqabeQ2+Y3bhHjw6wAxxZX++W1mqFZ5m3cQxdUGtRqvSGGcusI3C4ZepOTdOVoxCKzg
 eC8wFhLAQZODTg54Uo0Qm3JTdMk2UTNUhCCaQUigGPlKjBqtLggrX+UVlKQmbEn5MVkM
 gSIQ==
X-Gm-Message-State: AO0yUKXC5gkY788tbk1eQxS7Tz2pMqrBKD5kZgbT+pGHbS++DVCp/W42
 2Y/5QsNN/DdadO+FZwhsHrs=
X-Google-Smtp-Source: AK7set8K606JzvAv5mqcU/f2BrqbeSpWXF7RngXN9y8ZyHVKNxPGmXOrxixkhn/2bYUOn1H7UHRSSA==
X-Received: by 2002:a05:6402:1e8e:b0:4bc:3ff2:dbe7 with SMTP id
 f14-20020a0564021e8e00b004bc3ff2dbe7mr9501767edf.1.1678515129970; 
 Fri, 10 Mar 2023 22:12:09 -0800 (PST)
Received: from [192.168.10.15] ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a508d07000000b004af6c5f1805sm786410eds.52.2023.03.10.22.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 22:12:09 -0800 (PST)
Message-ID: <bfd3eecf-4af2-184c-ff52-5509791fbf49@gmail.com>
Date: Sat, 11 Mar 2023 10:12:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
Content-Language: en-US
To: Siddh Raman Pant <code@siddh.me>
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
 <186cf19b619.4777c80c154603.5258165448157616593@siddh.me>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <186cf19b619.4777c80c154603.5258165448157616593@siddh.me>
Cc: lucho <lucho@ionkov.net>, ericvh <ericvh@gmail.com>,
 asmadeus <asmadeus@codewreck.org>, linux_oss <linux_oss@crudebyte.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+cb1d16facb3cc90de5fb
 <syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com>,
 v9fs-developer <v9fs-developer@lists.sourceforge.net>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On 3/11/23 09:16, Siddh Raman Pant wrote:
> On Sat, 11 Mar 2023 01:56:19 +0530, Ivan Orlov wrote:
>> KASAN reported the following issue:
>> [...]
>>
>> Calling '__v9fs_get_acl' method in 'v9fs_get_acl' creates the
>> following chain of function calls:
>>
>> __v9fs_get_acl
>>        v9fs_fid_get_acl
>>                v9fs_fid_xattr_get
>>                        p9_client_xattrwalk
>>
>> Function p9_client_xattrwalk accepts a pointer to u64-typed
>> variable attr_size and puts some u64 value into it. However,
>> after the executing the p9_client_xattrwalk, in some circumstances
>> we assign the value of u64-typed variable 'attr_size' to the
>> variable 'retval', which we will return. However, the type of
>> 'retval' is ssize_t, and if the value of attr_size is larger
>> than SSIZE_MAX, we will face the signed type overflow. If the
>> overflow occurs, the result of v9fs_fid_xattr_get may be
>> negative, but not classified as an error. When we try to allocate
>> an acl with 'broken' size we receive an error, but don't process
>> it. When we try to free this acl, we face the 'wild-memory-access'
>> error (because it wasn't allocated).
>>
>> This patch will modify the condition in the 'v9fs_fid_xattr_get'
>> function, so it will return an error if the 'attr_size' is larger
>> than SSIZE_MAX.
>>
>> Reported-by: syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com
>> Link: https://syzkaller.appspot.com/bug?id=fbbef66d9e4d096242f3617de5d14d12705b4659
>> Signed-off-by: Ivan Orlov ivan.orlov0322@gmail.com>
> 
> You should also test with Syzkaller if it gave a reproducer.
> Check the following docs to know about it:
> https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches
> 
>> ---
>>   fs/9p/xattr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
>> index 50f7f3f6b55e..d6f7450107a8 100644
>> --- a/fs/9p/xattr.c
>> +++ b/fs/9p/xattr.c
>> @@ -35,7 +35,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char *name,
>>   		return retval;
>>   	}
>>   	if (attr_size > buffer_size) {
>> -		if (!buffer_size) /* request to get the attr_size */
>> +		if (!buffer_size && attr_size <= (u64) SSIZE_MAX) /* request to get the attr_size */
>>   			retval = attr_size;
>>   		else
>>   			retval = -ERANGE;
> 
> You should use EOVERFLOW for overflow error. Make a new conditional
> instead of using AND. Also, the explicit u64 cast for SSIZE_MAX can
> be dropped for better readability.
> 
> Thanks,
> Siddh
> 
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> Linux-kernel-mentees mailing list
>> Linux-kernel-mentees@lists.linuxfoundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Thank you for the review! I will modify the patch according to your 
comments, resend it as v2 version and test it via syzkaller.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
