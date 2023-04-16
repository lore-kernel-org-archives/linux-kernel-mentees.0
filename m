Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B9C77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Apr 2023 20:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E69041C24;
	Sun, 16 Apr 2023 20:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E69041C24
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MoZJUZMV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHRkS2BLmVzp; Sun, 16 Apr 2023 20:40:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 31CC141C14;
	Sun, 16 Apr 2023 20:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CC141C14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09D76C0036;
	Sun, 16 Apr 2023 20:40:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFEBC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E495460B35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 20:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E495460B35
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MoZJUZMV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpfj4_4WclQq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 20:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF2760B19
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF2760B19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 20:40:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50671ef0c48so302708a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681677602; x=1684269602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Gmi/do156Oqurn6On7R7qt3l2vNSWVaalWH+Gn/vpM=;
 b=MoZJUZMV6rloOpwXdLAzDuGOg+XGzhwrmBxevKigjbxIyy6Vsf3l8DgMthmIMu93a3
 koN9dUheLelFz/KezCQN4OvkEgpwc5o/ds6mwGAlCLnnz8TfgWjO27231txGjGbR1jaO
 Ri9VwLug1wkXyrloJIYAtLn22yQhe2C8gWYSyrCL56tB6WqPb4Rq91T4QmjgcMfEqCJ5
 Xmc6Q/iD5VnQXzDrOEy2Kv1z/w2wxMcrZrITGGIUa226V8CoJ+gvRmVNzFvVaLyMk7rX
 +YtPh1OkEVw3zaBdaWvO06CdtYRulj/ulvxpYX3ReF4WA1eqi7RURxDI7jGoCdZdxZ/4
 iEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681677602; x=1684269602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Gmi/do156Oqurn6On7R7qt3l2vNSWVaalWH+Gn/vpM=;
 b=kJAp4WURDbksVs1BMW+xQbZ2mXTA0NqirDXWHT/G9Uta+d1f9RVhlYE9aV7hBHHjM1
 0tjOFgO5nnA+uFFTzqX1n+GCGlD1UVHV4KsFt0xQ32PSza5km8Wd2PGaj8iznp6leZJi
 FWT3Q0c4wVa7OKC1iWn8SoXHVvla/asvws0VqtXNE3LphScsDxKeO0anXw03wOe1U8EX
 pDqSEPGeydL4Lt0QSSWYN//ITbp2uY281Oj5BpSUn+6yp3iJoni2VpXHGxWmR7chZGl3
 nRgMgliWGf7x2/E5C7GvYtJPIKZ1VF5kodQ51vfu15gykDlo9Yt3HMSLw8zQSr6ijA2J
 /aFQ==
X-Gm-Message-State: AAQBX9edJC3CPbaBuNPnHrW1ySlu5dgZmnsweQRjhdETTUFlQVSZjfJs
 M3aNcz3e7Xdle8rfD1Cmy/w=
X-Google-Smtp-Source: AKy350Zl9UbVjnQxDl3btqlMf8RV3X44RulxYOQ2N9ntqnKgRdCPVIMtABj54YobhwzwJahy36T6Cw==
X-Received: by 2002:a17:906:19c:b0:94f:66af:b1f7 with SMTP id
 28-20020a170906019c00b0094f66afb1f7mr1551753ejb.1.1681677602426; 
 Sun, 16 Apr 2023 13:40:02 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.92.4])
 by smtp.gmail.com with ESMTPSA id
 qb3-20020a1709077e8300b008c327bef167sm5562437ejc.7.2023.04.16.13.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 13:40:02 -0700 (PDT)
Message-ID: <195d006f-b595-c0d4-24a5-49d8d350745b@gmail.com>
Date: Mon, 17 Apr 2023 00:39:59 +0400
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

Hello, Andrew!

I have been unable to reproduce the problem with any of the existing 
reproducers on the 3d7cb6b04c3f3115719235cc6866b10326de34cd commit, 
which was detected by the syzkaller bisection. I also tried to test if 
the problem is reproducible on this commit via syzbot, but it did not 
detect the problem. It's possible that the bisection claim is 
misleading, as the issue may not be consistently reproducible.

Why did you mention the 58ac9a8993a13ebc commit? I thought 99cb0dbd47a15 
was considered as a "Fixes". 99cb0dbd47a15 is older than 3d7cb6b04c3f3, 
and the problematic code appeared there, so probably the problem could 
appear in 99cb0dbd47a15 as well.

Please, correct me if I'm missing something.

Kind regards,
Ivan Orlov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
