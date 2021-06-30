Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC0C11F65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 04:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38CAF61D28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 04:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38CAF61D28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F04D483AB5;
	Wed, 30 Jun 2021 04:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfNmIw4XAdW3; Wed, 30 Jun 2021 04:50:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E289483AB2;
	Wed, 30 Jun 2021 04:50:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9CE9C0010;
	Wed, 30 Jun 2021 04:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 748A8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 04:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6804D400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 04:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPXHDjMrB9jU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 04:50:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5C7140004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 04:50:29 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y4so1283004pfi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 21:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ih/5Nva+sERVyI3phX+JlQ0UWPIAUb3maiYKveHsY0=;
 b=SYnsfHQRrT67MAawYTDoxV4OfYq4NxRX1wHSRq8Y1MXxzoZLjn+lZqyCAIEACFpGiU
 nkDMUwSfVrUU9TfSMthVoE1VDTTYYx5WGS1Sxi2BUs7oVa8lDXdSg/33qNX84cLwBC/W
 x//NYFLrwc0zCDIj18pqlvLHnpsW3LnUnlpzEwE3sQFk/WVUa9TjwAOWhBjyRnoO+W9S
 ty0CrFntOKdV71FycnGqIlfcY2DmnKMoVbKMdtEEkgTuIvNB6jL8QY2V0PM+jh+6I45R
 MWj0X8K4wnXmeI4CHb2r6d4ZdhllU9PLSK85d0AdTKHGX+Y9ALum7sljYrN/P4KQLlxM
 /pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ih/5Nva+sERVyI3phX+JlQ0UWPIAUb3maiYKveHsY0=;
 b=VnxlInGJGBmvMhnSMbLYw8GzmEyjmnLLUct9RPj3AnBRprqCYmjFFlPSDVXHKtoHFn
 LNkEGKYcKhy982NUjj1I5Pr8JDjqFYx/4TwydQ1MDJbriIzI2RIdOsSlSc0pMRNoDXqP
 RARqBD57W+o3D24eZZkS3EsfWpV5ySFuZl91frIlBJvvYJkx6oR8ngj0yb/VfyWUGDLm
 PnZhcTXT+k6xTXTVnCMG5Oowb2TvLXOJ7nM0UXCIfZX1EqV0qu71xbH4BfDKADCi9C0j
 67RKqbdRcL6x+kn/tzkF4QBOICBGbTGkrIEdNBaGh2nwtiWC+GdRf56/CDCotJ8AA21v
 9oSw==
X-Gm-Message-State: AOAM533QPU25qnsvnQtKV1U0+NlvChk3LfPls8V6k3AhY1S627Kyy49w
 OuuEp29xJ7dq5HqC+moYT82IkWhac6cl6V/J81A=
X-Google-Smtp-Source: ABdhPJx7T2SMm+OqTpb9jbIAzW8c2VrANN3PTAAOIqJ/nHc3hecyU3ySD4YhBLRYmHxFsM1outAvUg==
X-Received: by 2002:a63:348f:: with SMTP id b137mr7669225pga.164.1625028628815; 
 Tue, 29 Jun 2021 21:50:28 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id e4sm19331263pfa.29.2021.06.29.21.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 21:50:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] hfs: add missing clean-up in hfs_fill_super
To: Viacheslav Dubeyko <slava@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-2-desmondcheongzx@gmail.com>
 <28CCF4E3-51D1-43BE-A2BA-4708175A59C0@dubeyko.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <6c6d6cd8-b8b3-54a9-f0bd-b36220caba26@gmail.com>
Date: Wed, 30 Jun 2021 12:50:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <28CCF4E3-51D1-43BE-A2BA-4708175A59C0@dubeyko.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
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

On 30/6/21 3:13 am, Viacheslav Dubeyko wrote:
> 
> 
>> On Jun 29, 2021, at 7:48 AM, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:
>>
>> On exiting hfs_fill_super, the file descriptor used in hfs_find_init
>> should be passed to hfs_find_exit to be cleaned up, and to release the
>> lock held on the btree.
>>
>> The call to hfs_find_exit is missing from this error path, so we add
>> it in to release resources.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>> fs/hfs/super.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
>> index 44d07c9e3a7f..48340b77eb36 100644
>> --- a/fs/hfs/super.c
>> +++ b/fs/hfs/super.c
>> @@ -419,6 +419,7 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
>> 	res = hfs_cat_find_brec(sb, HFS_ROOT_CNID, &fd);
>> 	if (!res) {
>> 		if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
>> +			hfs_find_exit(&fd);
> 
> I see that there are several places of hfs_find_exit() calls in hfs_fill_super(). Maybe, it makes sense to move the hfs_find_exit() call to the end of the hfs_fill_super()? In this case we could process this activity of resources freeing into one place. I mean line 449 in the source code (failure case).
> 
> Thanks,
> Slava.
> 
>> 			res =  -EIO;
>> 			goto bail;
>> 		}
>> -- 
>> 2.25.1
>>
> 

Thanks for the suggestion. Since the bail and bail_no_root error paths 
are used before hfs_find_init and after hfs_find_exit are called in the 
normal execution case, moving hfs_find_exit under the bail label 
wouldn't work.

Perhaps this can be done by introducing another goto label. Any thoughts 
on the following?

diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 44d07c9e3a7f..12d9bae39363 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -420,14 +420,12 @@ static int hfs_fill_super(struct super_block *sb, 
void *data, int silent)
         if (!res) {
                 if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
                         res =  -EIO;
-                       goto bail;
+                       goto bail_hfs_find;
                 }
                 hfs_bnode_read(fd.bnode, &rec, fd.entryoffset, 
fd.entrylength);
         }
-       if (res) {
-               hfs_find_exit(&fd);
-               goto bail_no_root;
-       }
+       if (res)
+               goto bail_hfs_find;
         res = -EINVAL;
         root_inode = hfs_iget(sb, &fd.search_key->cat, &rec);
         hfs_find_exit(&fd);
@@ -443,6 +441,8 @@ static int hfs_fill_super(struct super_block *sb, 
void *data, int silent)
         /* everything's okay */
         return 0;

+bail_hfs_find:
+       hfs_find_exit(&fd);
  bail_no_root:
         pr_err("get root inode failed\n");
  bail:
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
