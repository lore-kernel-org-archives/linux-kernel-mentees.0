Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F55C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Apr 2023 00:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19FF2822FB;
	Mon, 17 Apr 2023 00:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19FF2822FB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sbBQCkJR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACpX9aDFeEsU; Mon, 17 Apr 2023 00:45:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 22874822F3;
	Mon, 17 Apr 2023 00:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22874822F3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6202C0036;
	Mon, 17 Apr 2023 00:45:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9B8BC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 00:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B25D41952
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 00:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B25D41952
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=sbBQCkJR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMVZo_211SHl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 00:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E54A4186E
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E54A4186E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Apr 2023 00:45:30 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id m14so6702170ybk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681692329; x=1684284329;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRSWS4CahJKmzHjoYHWbTfAxUOlWiKT6IkxMS+a7Rf8=;
 b=sbBQCkJR1blA3hV96FpkODzI2tgHmoZZfsnImeAQnIAhG79OWScwEEOSM7gZ0tW1zP
 EiFVqszySsbrwI59L7OFeP55CYduW/jOtunH0hxePs7wY85uyAz1iH6Psg+xzgzCTdJP
 0iKpt8nOteMGmwrsWscYZCyPD7u3VlJlygy12rXWVMHcJrTq2W+1vrdcs10Wt6OwCjdE
 M+EdvAlQBCbLcihbX/qL6yLRDRSeNVnfgNOXMliL4e6yduDQYHOIvj2fqlHsdTnTpWXF
 WgNHZPbRajqpfbbBq+Hfue3QT3sz1wqUAeDEzHKSe+xpwUMW+mWmOvKYuOx14RDBvnnl
 wwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681692329; x=1684284329;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRSWS4CahJKmzHjoYHWbTfAxUOlWiKT6IkxMS+a7Rf8=;
 b=ZmBcpRFrPgjQ30l3F1oXC2XPMEjdUjXxixhzqM2N0EUfSd6a4RRdBxlKsfxwq5MDp2
 VtFOEK06q+mR6m0EmQA5sNSgaXgjh754h79rphQt5In0GxFc43i28Ay/xdfpCTR1szXr
 pCDp8elTXwiFUGhMwBC4DQhvg7KUQogmB4k22DG0rTujge/d8cQAgtyq749abdWIEkK+
 tIDj+YYVPvjhPi0+aByA3irpdkhumgr0BRseKGz4gFUVH+NYb3em9R6vdsOKQZQipKOP
 eKnAlM5BAp5q2Rk8erM9dq5tNXkgr5Q8zZIr0UET+SctDUhERPERgQDe5+uZGfgeu8ik
 P9Lw==
X-Gm-Message-State: AAQBX9fLSD6+fvmQVMs06IJOO+BmR0hJRVJe1nku8Zi0kzBGNP5sVU6D
 DP7kERzRZ8ynXgXEr49lRWGxmw==
X-Google-Smtp-Source: AKy350ZNiO/Qqw4kBjaaCtnr795xEsGikp7UxElEWMXA54ObhUZJ121qoa5BUfup+ExOJL25sSjdBQ==
X-Received: by 2002:a05:6902:114d:b0:b6a:9364:1dc8 with SMTP id
 p13-20020a056902114d00b00b6a93641dc8mr15325573ybu.44.1681692329122; 
 Sun, 16 Apr 2023 17:45:29 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 be18-20020a05690c009200b0054fcbf35b94sm2601627ywb.87.2023.04.16.17.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 17:45:28 -0700 (PDT)
Date: Sun, 16 Apr 2023 17:45:18 -0700 (PDT)
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
In-Reply-To: <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
Message-ID: <f0fa9ad0-5077-e47a-8234-684f5cddcae0@google.com>
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
 <20230331013301.ecgkjymaf3ws6rfb@google.com>
 <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
 <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
 <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, Yang Shi <shy828301@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Zach O'Keefe <zokeefe@google.com>,
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
From: Hugh Dickins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 16 Apr 2023, Andrew Morton wrote:

> 
> Circling back to this fix...
> 
> The BUG() is obviously real.

It's worth remembering that syzbot's reproducer involves artificially
injecting page allocation failures.  So although the bug may be "real",
it is rather in the theoretical category, way down on my own list to
look at, and I'd say not at all urgent to fix.

Hugh

> We're unsure that Ivan's fix is the best
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
