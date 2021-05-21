Return-Path: <SRS0=yYPO=KQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17260C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 11:07:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30F9613D7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 11:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B30F9613D7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75250844FD;
	Fri, 21 May 2021 11:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkCOBJnt2I2y; Fri, 21 May 2021 11:07:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927C5844B8;
	Fri, 21 May 2021 11:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79401C000D;
	Fri, 21 May 2021 11:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67D10C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E60E405C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0HMfyKTayNZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:07:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1747401E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:07:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D606D611AE;
 Fri, 21 May 2021 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621595257;
 bh=RnjQsR1H5aqN6tCZnJoqqA4p4twRvCmpeee1SK0l2VY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VxAaSAE6jScbTw66SXo4juzgz19Ws8GeJS8r9B1vMa1zpZl934q+jJ1y6z7j/DXu0
 cbln/2/wj7l9uEQ6OpbXEbeIjUu/CYBNSy/slPzkUN2RIqTSanQcvrJi3kiii+mM7N
 ao4Dd7JesIYGYjr++p2H63byqOKKbj3QcSvUpdSI=
Date: Fri, 21 May 2021 13:07:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aviral Gupta <shiv14112001@gmail.com>
Subject: Re: [PATCH] This commit fixes the error generated due to the wrong
 indentation which does not follow the codding style norms set by
 Linux-kernel and space- bar is used in place of tab to give space which
 causes a visual error for some compilers
Message-ID: <YKeUd/X5tuN54o1H@kroah.com>
References: <20210521105654.4046-1-shiv14112001@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521105654.4046-1-shiv14112001@gmail.com>
Cc: shuah@kernal.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, viro@zeniv.linux.org.uk,
 linux-kernel@vger.kernel.org
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

On Fri, May 21, 2021 at 04:26:54PM +0530, Aviral Gupta wrote:
> ERROR: switch and case should be at the same indent
> +	switch (whence) {
> +		case 1:
> [...]
> +		case 0:
> [...]
> +		default:
> ERROR: code indent should use tabs where possible
> +                              void (*callback)(struct dentry *))$
> 
> Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
> ---
>  fs/libfs.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Your subject line is very odd.

And why are you trying to change coding style issues in core kernel
code?

Please start this type of work in drivers/staging/ where it is wanted,
not in other areas of the kernel where it is not good to try to learn
the process.

good luck!

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
