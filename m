Return-Path: <SRS0=BNqc=I5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BA3C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Mar 2021 19:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662536101E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Mar 2021 19:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662536101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F0160618;
	Wed, 31 Mar 2021 19:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 133_U6ZfGwLO; Wed, 31 Mar 2021 19:32:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA2C605C9;
	Wed, 31 Mar 2021 19:32:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC612C000B;
	Wed, 31 Mar 2021 19:32:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A315C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 19:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD5340657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 19:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt9VrlYoxHWo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 19:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D962D405C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 19:32:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 335FA9A8;
 Wed, 31 Mar 2021 19:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 335FA9A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1617219130; bh=hZwGuOo7xBljtRcLVGar1Uk5RDsxdyJQt5UiAYHN+jc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=E7ufQWAca4gTgjOdNkDbwdFZsU25mdw2tplB6ctexMcpjFECDHkl1uj1asFkfJKU3
 FkOuM5VUFbxiYj/qttGYof7zZJCFaIgqbHW1bPmTjd7lxgqNlvTw+iGBZPWSCISx9v
 9pI2Qqy9Y2QdlMJA9dEJQ8nRrhNnwQ8NLclSBVvC3geZBz+9cnAC2Vnf0MBJwehQA4
 tjDzwKUOmgEeisYHK0jaNMQYIRKAuUbKXb0NLmMvZ0p6TkwgUPm+3M2+A5bpj/8vYO
 //zZZKmzljHy5HqES9WWjgE627obg0Ek79rboZLNSGrDseW7+Q9AGKktpVG4tQcL2Z
 r5sj8cQXv0I4w==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] scripts: kernel-doc: add warning for comment not
 following kernel-doc syntax
In-Reply-To: <a35096d5-99e7-6b69-c959-1136d511a0ff@gmail.com>
References: <20210329092945.13152-1-yashsri421@gmail.com>
 <87czvit65m.fsf@meer.lwn.net>
 <a35096d5-99e7-6b69-c959-1136d511a0ff@gmail.com>
Date: Wed, 31 Mar 2021 13:32:09 -0600
Message-ID: <87mtujktl2.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

Aditya Srivastava <yashsri421@gmail.com> writes:

> On 29/3/21 7:26 pm, Jonathan Corbet wrote:
>> Aditya Srivastava <yashsri421@gmail.com> writes:
>> 
>>> Currently, kernel-doc start parsing the comment as a kernel-doc comment if
>>> it starts with '/**', but does not take into account if the content inside
>>> the comment too, adheres with the expected format.
>>> This results in unexpected and unclear warnings for the user.
>>>
>>> E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:
>>> "mm/memcontrol.c:961: warning: expecting prototype for do not fallback to current(). Prototype was for get_mem_cgroup_from_current() instead"
>>>
>>> Here kernel-doc parses the corresponding comment as a kernel-doc comment
>>> and expects prototype for it in the next lines, and as a result causing
>>> this warning.
>>>
>>> Provide a clearer warning message to the users regarding the same, if the
>>> content inside the comment does not follow the kernel-doc expected format.
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/kernel-doc | 17 +++++++++++++----
>>>  1 file changed, 13 insertions(+), 4 deletions(-)
>> 
>> This is definitely a capability we want, but I really don't think that
>> we can turn it on by default - for now.  Experience shows that if you
>> create a blizzard of warnings, nobody sees any of them.  How many
>> warnings does this add to a full docs build?
>> 
>
> Hi Jonathan, here's the diff I have created for the warnings before
> and after the changes:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/kernel_doc_comment_syntax.txt
>
> Around ~1320 new warnings of this type are added to the kernel tree,
> and around ~1580 warnings are removed.

So I finally got around to looking at this again...  How did you
generate that file?

I tried applying the patch and doing a normal full htmldocs build and
got all of four warnings:

  ./include/linux/seqlock.h:829: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t
  ./fs/jbd2/journal.c:1391: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure
  ./fs/jbd2/journal.c:1422: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   *  journal_t * jbd2_journal_init_inode () - creates a journal which maps to a inode.
  ./include/linux/dcache.h:309: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   *      dget, dget_dlock -      get a reference to a dentry

Two observations:

 - This is not an awful lot of warnings - not the blizzard I had
   feared.  At this level, I think we can just merge the patch and
   then, hopefully, fix those cases.

 - All of the warned-about places are *attempts* to write real kerneldoc
   comments, they just got the syntax wrong in one way or another.  It's
   probably not worth the effort to try to detect this case - the
   warning is enough to draw attention to the comment in question.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
