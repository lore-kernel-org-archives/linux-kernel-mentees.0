Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA560C77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Apr 2023 18:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4322D41828;
	Sun, 16 Apr 2023 18:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4322D41828
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ZnRJwT8s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_0AqotrUzHw; Sun, 16 Apr 2023 18:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D88DF41805;
	Sun, 16 Apr 2023 18:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88DF41805
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAFC3C0036;
	Sun, 16 Apr 2023 18:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9739C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 18:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA2441823
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 18:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA2441823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4zuX9vseLYs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 18:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D153541805
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D153541805
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 18:33:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DD3360D2D;
 Sun, 16 Apr 2023 18:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE45C433D2;
 Sun, 16 Apr 2023 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1681670016;
 bh=YlCs2n5EALDS5s68UQrGs8UJMvIrgeYJRA21TLlnrN0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZnRJwT8sgCw/ejrXUHDjYB/eP7lijyMB+3ylaEZ6+MWZuEiQu/DaC8FWk/mCvyeJL
 yO/JKjgmW0yLzhWN7of/mNXBxC5GE0wmsbOC8SYGrSf0tGHR6GE/KaAr3OfknHmazI
 6odrOytFLnI5HVyI/cEFOPCy5bnBp+xm/9yY+hRk=
Date: Sun, 16 Apr 2023 11:33:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Zach O'Keefe" <zokeefe@google.com>
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
Message-Id: <20230416113335.caeafda1328fdd4bfe2406e8@linux-foundation.org>
In-Reply-To: <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
 <20230331013301.ecgkjymaf3ws6rfb@google.com>
 <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
 <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, Yang Shi <shy828301@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


Circling back to this fix...

The BUG() is obviously real.  We're unsure that Ivan's fix is the best
one.  We haven't identified a Fixes:, and as this report is against the 6.2
kernel, a cc:stable will be needed.

According to the sysbot bisection
(https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc),
this is present in linux-5.19, so it might predate Zach's
58ac9a8993a13ebc changes.  But that bisection claim might be
misleading.

And Zach is offline for a few months.  So can people please take a look
and see if we can get this wrapped up?

Matthew, the assertion failure is in the

	VM_BUG_ON(index != xas.xa_index);

which was added in 77da9389b9d5f, so perhaps you could take a look?

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
