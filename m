Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F84C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Apr 2023 23:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8CE41B9B;
	Sun, 16 Apr 2023 23:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8CE41B9B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=H66VS9lJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKevO4nreltq; Sun, 16 Apr 2023 23:05:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F298B41834;
	Sun, 16 Apr 2023 23:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F298B41834
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B21C0036;
	Sun, 16 Apr 2023 23:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB58C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 23:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4473360B94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 23:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4473360B94
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=H66VS9lJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPPbiZB5Rsxf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 23:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2367E60AE7
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2367E60AE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 23:05:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94d585efdbdso34197266b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681686302; x=1684278302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JfCcxv5wLUfMTELXAoE2t5WyF0Xi0PP+u/u08eUy+2I=;
 b=H66VS9lJEjt1KObnvR8249QRKSgoVyagjfpOWBsXehIFrQeIrpo35VJQNHaRkZnFnj
 PUzVpDOpkNsMnvFfsq13xBdZTsZLiH5wf75lR8rog6COXzTNjHJmSyInjs2VFCx5zv9S
 Z6y7/wcGXhbHrt6iRu7gasliOZlQBcom+i3R/y/9/GTfzC6tFrHzX3793v8Lut6Dj8Rk
 2RW1tO96E6lIGHo7yjpUVOLlcLEZkOjrv+D09D4JLyhbemkKzeq8wsWLOM/9uOSZOiId
 a/UkuwzqS6MINzaRWtyOCvQXoQVoyzF3n+PV0o957evCqjaGk3cXD3iflrbEL945i1S9
 jvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681686302; x=1684278302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfCcxv5wLUfMTELXAoE2t5WyF0Xi0PP+u/u08eUy+2I=;
 b=bXDa3kfpspD17e5cJK0eY2vkRpeyUFf3e2rnmJuhjGTqQ8uN9ol0sFEdB9Iiv5jdf8
 2Pd79rm+wZtBSjmnuW7loY5wXvlZZqrMGP4wO/w4xStbOpjEkpAafjgAF3hzFCcSo+oU
 +mXtBKifMVsd8RfVE1itgU5DVQBE+ka1HOssNSvt/sLd+L4XjKyhM9H1yBfIh1xY0ejR
 tgNouB0ajSw2PvePGIEtjY7+nkhq2hmsJxrvrv/kfLuU6bzUAtoMwIZP3Qe8BB+OtTSu
 m7IjClzLezlPyHKvSmbuMufQgfyXoqkB+fYcpxth0v74+ziFpvXS/9SqXuPCaUnea6XT
 7f0Q==
X-Gm-Message-State: AAQBX9fgf7AGkYWhKB4DmmOsJrasQDTpxaARDXoQ476J/YjnkCQIEEy8
 SBTEufg06g9r1UKzsaDUe9w=
X-Google-Smtp-Source: AKy350a5cudH4yO6cluPGC+FqL8+sxaXKMlI5R4NcktLq1tvB3/j3aoF4CQHQf0zBPTF1FLP51gheQ==
X-Received: by 2002:a17:906:7a4e:b0:94e:d5d7:67eb with SMTP id
 i14-20020a1709067a4e00b0094ed5d767ebmr7440893ejo.5.1681686301910; 
 Sun, 16 Apr 2023 16:05:01 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.92.4])
 by smtp.gmail.com with ESMTPSA id
 eq17-20020a170907291100b0094efe88a037sm3503048ejc.9.2023.04.16.16.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 16:05:01 -0700 (PDT)
Message-ID: <d513cd8d-0262-8c4e-d0d9-ec7eea45941a@gmail.com>
Date: Mon, 17 Apr 2023 03:04:59 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Zach O'Keefe <zokeefe@google.com>
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
 <20230331013301.ecgkjymaf3ws6rfb@google.com>
 <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
 <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
 <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
Cc: Yang Shi <shy828301@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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

On 4/16/23 22:33, Andrew Morton wrote:
> 
> Circling back to this fix...
> 
> The BUG() is obviously real.  We're unsure that Ivan's fix is the best
> one.  We haven't identified a Fixes:, and as this report is against the 6.2
> kernel, a cc:stable will be needed.
> 
> According to the sysbot bisection
> (https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc),
> this is present in linux-5.19, so it might predate Zach's
> 58ac9a8993a13ebc changes.  But that bisection claim might be
> misleading.
> 
> And Zach is offline for a few months.  So can people please take a look
> and see if we can get this wrapped up?
> 
> Matthew, the assertion failure is in the
> 
> 	VM_BUG_ON(index != xas.xa_index);
> 
> which was added in 77da9389b9d5f, so perhaps you could take a look?
> 
> Thanks.

I tested the reproducers on the 99cb0dbd47a15 commit, and they do not 
trigger the problematic condition of shared memory truncation or 
hole-punching. I will investigate further, as there have been many 
changes in khugepaged since the 99cb0dbd47a15 commit that could 
potentially affect its behavior.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
