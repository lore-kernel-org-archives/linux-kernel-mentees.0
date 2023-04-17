Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB79C77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Apr 2023 18:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D138360D8E;
	Mon, 17 Apr 2023 18:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D138360D8E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LOBAzaOn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UORq_zWPJz5B; Mon, 17 Apr 2023 18:28:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 948E360D88;
	Mon, 17 Apr 2023 18:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 948E360D88
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EBBAC0037;
	Mon, 17 Apr 2023 18:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A24D5C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 18:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E06640990
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 18:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E06640990
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LOBAzaOn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nN61iheS8Ym
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 18:28:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31AB44096D
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31AB44096D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 18:28:55 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50671ef0c48so427748a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681756133; x=1684348133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0lqi6e8RVymVTF7fcFUOheURxMqgPbsBHzaUXSbYH78=;
 b=LOBAzaOnsbv+xJP9yrRAQZbI6B1nC83pWaavjbDytCM09qdqR5xvP/kOGyGhyhJitE
 KeFPQxLE9aNAeW1K964mlXNqJnmye34SZhx0h6fSjZutXCXd9fORM/8rV2tklwzzLNQZ
 unFClX8U9/out3OBbsRqjF9TqIZvUyxfnirs0dD5tVubtnARlTCHDsVc9473jaXtDh9u
 yQo8XH/bcZziG8vVyG4OQ7yQJpWLA0UsdMHpOjfJB2LbZnfjTok5V2+a/6Ge25MLKsFi
 D0H0C9s5cYSU+CGEfWy7YlAoMvB6Zpw6/uropFfLFEjewyhLKYjtqFIYkDDkCX3R08Xb
 WqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681756133; x=1684348133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0lqi6e8RVymVTF7fcFUOheURxMqgPbsBHzaUXSbYH78=;
 b=MknM3aUpGoOKUYW1tWUO98PkBNsTmhsBIaRmlMJHWH0naLYuxaepv3Q9P3Kz0MTTLV
 QnmGZdG9BoSHE56Lqm7IWQ2jMJ2TLktHYuXu7n2P6J3VMeUoUjoyGaVE7JYeOjmvRkxm
 NTnvfkXINVrQbsHoccN8WciZE0QJEaAhjsVW92zG0rSCS8GoOIi4+gIYmxS/aTqb/Hhj
 HFKq48YHIrOZLUleSsTtBCWqM7YDhaNQxg9yx0qbdZ00r7rv6p+mb38dqpejWEYeoBWO
 0dtRYGdAZXq8qSHTHOTHSu+o3bG14Oz1Q2CIRJQJASlEKhN2f78DigukmhZ/SuYcE+bk
 KJKA==
X-Gm-Message-State: AAQBX9d8tBCs0ptlJwASRjlD18LZiiJmpSuS8eE6Z/6URXx8vYOY6N0O
 UttVsJmbD9T/qaI04x6fuiY=
X-Google-Smtp-Source: AKy350YbvOqbJZgTK9Sfz/uzC+CuwIZ0d5X/ModBjEaxuEa/1srzK+Ja6pWa6tWd/92z8dNPYbu33w==
X-Received: by 2002:a17:906:7a45:b0:947:bff2:1c2d with SMTP id
 i5-20020a1709067a4500b00947bff21c2dmr11215147ejo.3.1681756133240; 
 Mon, 17 Apr 2023 11:28:53 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.92.4])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a17090681d100b0094f2f1c5ea1sm3618588ejx.174.2023.04.17.11.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 11:28:52 -0700 (PDT)
Message-ID: <5dc97e10-8c64-4818-2642-dd8edb21c016@gmail.com>
Date: Mon, 17 Apr 2023 22:28:51 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
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

On 16.04.2023 22:33, Andrew Morton wrote:
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

Tested today on the latest rc7, the bug still exists.

Kind regards,
Ivan Orlov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
