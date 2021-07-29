Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F9DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 11:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B2260720
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 11:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85B2260720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D2FB40556;
	Thu, 29 Jul 2021 11:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyMiZug1rY1O; Thu, 29 Jul 2021 11:56:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 82AA540520;
	Thu, 29 Jul 2021 11:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F995C0010;
	Thu, 29 Jul 2021 11:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B637C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19380404F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9CJA4fhd9QG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 443A240550
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:56:14 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d17so6660796plh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=reWzh3OdEOGw7F78jU2h0BOb61+Bau+uTHia8Q/89V8=;
 b=IaL3rGM1C0+p5EI4dwAtMi7JS2l80ZljyAWOK2arkXrKp3nTXS49OP6MfH3eVQW9kD
 pu5JqNu4HNx5plFv3VYgwzFZLfBBMWq84kURUBKQ5jEe0sqIPEWln+eSnF9MrVUw0exg
 3CkRUhPvAydBUlUmx18mWAeMCrRGtbIA93B7Qd1h1EUXaPcnWE9VBfY3dY2oT8KjGlBP
 lKokRCRDeOKHFfCX/dA89sIO8QqdO7o8mZ07wal1pZEe3b5UXOKOWf3Uv0zSiih+6G0j
 tbE7I0jtp4aVsYUDMWtgRp0CL77BCGx8nKOKl7TQmw2YcUnmFlK6mES5XWRH3Voo3IZb
 oFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=reWzh3OdEOGw7F78jU2h0BOb61+Bau+uTHia8Q/89V8=;
 b=LwKoKdQmj7UfuY8ZO3QZcKej0cBSa88yBdCkfkENgfCR2guBYl5ZHuR0YdOd0rIiEk
 UNodTd1rOXwfGS5MkESbluNDXbpvG6tOU5UbNZzFSSlIYrfb/RVB4hjMG6gw2D7CdMPB
 GJm57xUr5Gc0udqKqdRglih1d3ftw4nOaLKJa+QyNpTNxIcWyN1J4mt3/wcjgpzeJcx+
 gR9o47MWKA4aDo5UVJaqNDCQtAivr5gdZvmtLntSDrz2PT4hLoCHml5rkfhp2yrGtHZc
 iAEX7RLwo3Gt4hqCXGJ7VrYYnZNv8T8h7NCYpAd0j5FcNKKJTN0u9oG/WySytI5N2Oot
 xLwA==
X-Gm-Message-State: AOAM531Fe2uOQX98U8vkI7xDRCE6BQ+kgJ2Q31e2+h4ykM6/SFqtb62K
 SfM9Wi3ZUBsz6ZzCKNCicA8=
X-Google-Smtp-Source: ABdhPJzj0RzK7IZOH+o/pO07TTLehY7nwqiCMVKOOGmOCGDv3SpV5AZLs1+BD7rJnIH0eNdeWFVTmw==
X-Received: by 2002:a17:902:b218:b029:11a:bf7b:1a80 with SMTP id
 t24-20020a170902b218b029011abf7b1a80mr4437298plr.82.1627559773713; 
 Thu, 29 Jul 2021 04:56:13 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id e23sm9671103pjt.8.2021.07.29.04.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 04:56:12 -0700 (PDT)
Subject: Re: [PATCH] ntfs: Fix validity check for file name attribute
To: Rolf Eike Beer <eb@emlix.com>
References: <2424055.QlFIqzKPrH@devpool47>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e24a9b8c-12c9-eb05-7133-148d16da034b@gmail.com>
Date: Thu, 29 Jul 2021 19:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2424055.QlFIqzKPrH@devpool47>
Content-Language: en-US
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 rkovhaev@gmail.com, syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, anton@tuxera.com
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

On 29/7/21 4:31 pm, Rolf Eike Beer wrote:
> Hi,
> 
> I was just scanning through some older vulnerabilities and came across
> CVE-2018-12929, CVE-2018-12930, and CVE-2018-12931, which are all still open
> according to linuxkernelcves.com (originally reported against 4.15 [1]). I
> looked into the commits in fs/ntfs/ from 4.15 onwards to see if they were just
> missed, but I can't spot anything there. RedHat claims to have them fixed in
> one of their kernels [2].
> 
> Which makes me wonder if the issue fixed here is a duplicate of the any of the
> above. Is there a reason I can't find any patches for the original issue in
> tree, like the issue only introduced in a custom patchset that Ubuntu/RedHat
> were using? Is this thing worth it's own CVE if it's no duplicate?
> 
> Greetings,
> 
> Eike
> 
> 1) https://marc.info/?t=152407734400002&r=1&w=2
> 2) https://access.redhat.com/errata/RHSA-2019:0641
> 

Hi Eike,

Thanks for digging into this. From a first glance, this bug seems most 
similar to CVE-2018-12929.

However, from the logs, the root causes are probably different. The 
cause of this bug is specifically in the call to 
ntfs_is_extended_system_file [1], but from what I can see this is not 
the case for CVE-2018-12929. I don't know enough to comment whether it 
needs a CVE, but it has been patched on Linux stable (up to 4.4).

It's worth noting that there's another similar bug that was fixed by 
Rustam Kovhaev (+cc) in ntfs_read_locked_inode [2]. This may or may not 
have been the issue in CVE-2018-12929.

Link: 
https://syzkaller.appspot.com/bug?id=a1a1e379b225812688566745c3e2f7242bffc246 
[1]

Link: 
https://syzkaller.appspot.com/bug?id=933dab9c03ac47a3d09dd4b0563a0a8fcb35f282 
[2]

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
