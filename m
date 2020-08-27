Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AEDC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:59:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2DA22CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKv0rDmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB2DA22CB1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFF402042D;
	Thu, 27 Aug 2020 09:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1OLBCD-j0Qr; Thu, 27 Aug 2020 09:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A67352002F;
	Thu, 27 Aug 2020 09:59:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C5CDC016F;
	Thu, 27 Aug 2020 09:59:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66B42C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5545985C04
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1VJMl40q6JF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C26C7869CA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:59:54 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEB4D207CD;
 Thu, 27 Aug 2020 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598522394;
 bh=kLOwClv6cLLdqgQ6u8r+eTVLWMVWAPwOxRLFW4eZjbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKv0rDmKS+We0eGWLP28VHPdK3FuCBdHYDM1jJqcogL4tZoqFhx5/DrygPOvX1aSL
 RUaVxu8O1D7L1O/vPnI0wmlQhjPxwvbhm9QtvwDcPw4iw0Q4GdP7O/uc6A61Ri3KqA
 LyhjigTVaO6BkxQ/c688Xk4Y6av0OmXCPoDtH50Y=
Date: Thu, 27 Aug 2020 12:00:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <20200827100008.GA403378@kroah.com>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
 <20200827094344.GA400189@kroah.com>
 <alpine.DEB.2.21.2008271145370.25858@felia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2008271145370.25858@felia>
Cc: keescook@chromium.org, kernel-hardening@lists.openwall.com,
 maennich@google.com, linux-kernel@vger.kernel.org, re.emese@gmail.com,
 linux-spdx@vger.kernel.org, tglx@linutronix.de,
 Linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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

On Thu, Aug 27, 2020 at 11:49:31AM +0200, Lukas Bulwahn wrote:
> 
> 
> On Thu, 27 Aug 2020, Greg KH wrote:
> 
> > On Thu, Aug 27, 2020 at 02:54:05PM +0530, Mrinal Pandey wrote:
> > > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > > spdxcheck-test.sh to the repository without the executable flag and license
> > > information.
> > > 
> > > commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> > > dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> > > Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> > > and commit 9b4ade226f74 ("xen: build infrastructure for generating
> > > hypercall depending symbols") added the file xen-hypercalls.sh without the
> > > executable bit.
> > > 
> > > Set to usual modes for these files and provide the SPDX license for
> > > spdxcheck-test.sh. No functional changes.
> > > 
> > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > ---
> > > applies cleanly on next-20200827
> > > 
> > > Kees, Matthias, Thomas, please ack this patch.
> > > 
> > > Andrew, please pick this minor non-urgent cleanup patch once the
> > > mainainers ack.
> > > 
> > >  scripts/gcc-plugins/gen-random-seed.sh | 0
> > >  scripts/nsdeps                         | 0
> > >  scripts/spdxcheck-test.sh              | 1 +
> > >  scripts/xen-hypercalls.sh              | 0
> > >  4 files changed, 1 insertion(+)
> > >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> > >  mode change 100644 => 100755 scripts/nsdeps
> > >  mode change 100644 => 100755 scripts/spdxcheck-test.sh
> > >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> > 
> > This does 2 different things in one patch, shouldn't this be 2 different
> > patches?  One to change the permissions and one to add the SPDX line?
> >
> 
> For me, this was one thing: minor cleanup; and taking one 
> minor patch is easier than taking two, but you make the call. Then, the 
> two or even three patches would also just travel through different trees, 
> the spdx tree and Andrew's.

License "additions" are good to separate from other changes, in case
people have questions/comments/objections about them, they can be easier
to discuss and possibly reverted.

More patches is not a problem :)

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
