Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F291C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:14:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5627320723
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5627320723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 243E987996;
	Mon,  6 Jul 2020 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CU_R7V-zoCq7; Mon,  6 Jul 2020 18:14:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C59CE87846;
	Mon,  6 Jul 2020 18:14:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC7A1C0891;
	Mon,  6 Jul 2020 18:14:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07077C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E3BD0893D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kYGpf2YJu4W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7765A893D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:14:09 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id CDE0A2AE;
 Mon,  6 Jul 2020 18:14:08 +0000 (UTC)
Date: Mon, 6 Jul 2020 12:14:07 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20200706121407.6c24f537@lwn.net>
In-Reply-To: <20200706180010.29032-1-puranjay12@gmail.com>
References: <20200706180010.29032-1-puranjay12@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Security: Documentation: fix:
	`make htmldocs` warnings
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

On Mon,  6 Jul 2020 23:30:10 +0530
Puranjay Mohan <puranjay12@gmail.com> wrote:

> Remove extra ')' after function name to fix warnings.
> It solves following warning :
> WARNING: Unparseable C cross-reference: 'groups_sort)'
> Invalid C declaration: Expected end of definition. [error at 11]
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
>  Documentation/security/credentials.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
> index 282e79feee6a..d51e42b92395 100644
> --- a/Documentation/security/credentials.rst
> +++ b/Documentation/security/credentials.rst
> @@ -455,7 +455,7 @@ When replacing the group list, the new list must be sorted before it
>  is added to the credential, as a binary search is used to test for
>  membership.  In practice, this means :c:func:`groups_sort` should be
>  called before :c:func:`set_groups` or :c:func:`set_current_groups`.
> -:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
> +:c:func:`groups_sort` must not be called on a ``struct group_list`` which
>  is shared as it may permute elements as part of the sorting process
>  even if the array is already sorted.

So this is a great fix, thanks for sending it.  That said, there are a
couple of ways in which this fix can be made even better:

 - The simpler of the two is to change the subject line of the patch.
   "Fix a warning" is almost never a good description of what you're
   doing; what you are actually doing is fixing a broken cross reference.
   So the subject line should say that.

 - In this case, though, there is a much better thing to do.  We
   deprecated the use of :c:func: around a year ago; the docs build system
   can now do the right thing automatically.  So a fix that would both
   eliminate the warning and improve the document as a whole would be to
   replace every instance of:

	:c:func:`function_name`

   with:

	function_name()

Is there any chance I could get you to send a patch that does that?

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
