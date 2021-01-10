Return-Path: <SRS0=byAB=GN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAF4C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 20:33:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EFB229C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 20:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EFB229C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C420B86714;
	Sun, 10 Jan 2021 20:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmY7Z6jtBmrn; Sun, 10 Jan 2021 20:33:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B5678670E;
	Sun, 10 Jan 2021 20:33:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19EA8C0893;
	Sun, 10 Jan 2021 20:33:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18B7EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 061E686714
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 20:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VlcyD18IsKe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 20:33:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 301E08670E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=bzliTk+pD/abvOFgeWFHUrCNiv7v6oE0Jq+wzAicleU=; b=SmUMYOKtWwCu2E+oKe1i5FMDNi
 MgChyh5CNa1cnjeoeYccApfllv7qjfuA7oDlXFM7SIelYu5DnFupu3L2z5IrSTxEFKt9vu91R1J1k
 UFXFMpl6GG28hZEpM7B3cB0drbgp0DHkZFLFRIU8DMcErvaWcvZopV6+k/Z3GxXGQQpYinkM5QioJ
 7mJDbDIckSputPFqUKtgogkOHWizV3iVdX/LQwXhchjw/4xTGdUXgWPgkNEu+PW/kr5Ao2D0l6qaz
 iwUz4aciXbCOOcEq4Dq9lFj+TN3mO+hBfUOY78IuUZ8wx3H2UJPkKpI3Y8viID3lFSWTcPT8NmQFr
 MUrjSn8w==;
Received: from [2601:1c0:6280:3f0::79df]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyhOu-0006HN-Rl; Sun, 10 Jan 2021 20:33:26 +0000
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, masahiroy@kernel.org,
 michal.lkml@markovi.net
References: <20210110185702.111538-1-dwaipayanray1@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b11b1e50-bc2a-0037-1f51-fb69300206b1@infradead.org>
Date: Sun, 10 Jan 2021 12:33:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210110185702.111538-1-dwaipayanray1@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: mod: fix checkpatch.pl
	warnings
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

Hi,

On 1/10/21 10:57 AM, Dwaipayan Ray wrote:
> Fix the following warnings in file2alias reported by
> checkpatch:
> 
> CHECK: spaces preferred around that '*' (ctx:WxV)
> CHECK: spaces preferred around that '+' (ctx:VxV)
> CHECK: spaces preferred around that '-' (ctx:VxV)
> CHECK: spaces preferred around that '&' (ctx:VxV)
> CHECK: braces {} should be used on all arms of this statement
> CHECK: Unbalanced braces around else statement
> CHECK: Alignment should match open parenthesis
> CHECK: Logical continuations should be on the previous line
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> WARNING: Missing a blank line after declarations
> WARNING: please, no spaces at the start of a line
> WARNING: Block comments use a trailing */ on a separate line
> ERROR: spaces required around that '<' (ctx:VxV)
> ERROR: spaces required around that '=' (ctx:VxV)
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: space prohibited before that close parenthesis ')'
> ERROR: code indent should use tabs where possible
> ERROR: "(foo*)" should be "(foo *)"
> 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> 
> Note: The patch is compile tested only

Couldn't you at least do a kernel build that builds some
loadable kernel modules?

Also you could/should tell us if the before and after .o file
is the same and if not, why not.

> ll file2alias*
-rw-r--r-- 1 rdunlap users 39536 Jan 10 12:10 file2alias.o
-rw-r--r-- 1 rdunlap users 39536 Jan  8 10:06 file2alias.o.b4

> cmp file2alias*
>

Yes, they are the same.
 
>  scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------------
>  1 file changed, 83 insertions(+), 73 deletions(-)


Looks OK to me.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
