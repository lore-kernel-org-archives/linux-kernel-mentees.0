Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB00C4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 06:09:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED73C61168
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 06:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED73C61168
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDC083422;
	Wed,  2 Jun 2021 06:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZPnxGakNaAa; Wed,  2 Jun 2021 06:09:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E409282AEF;
	Wed,  2 Jun 2021 06:09:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE65AC000D;
	Wed,  2 Jun 2021 06:09:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49D7CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 371C24029F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKeksSy4ETxs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:09:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B8D54029E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:09:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3754F61027;
 Wed,  2 Jun 2021 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622614190;
 bh=PQloMyEvJcItDwWbNDAkdXPRbi+IZHllRxe5fENgpb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kx+i0B1TrvHkrdGl7n4z2Gyvt3k6emFZ38XjCr/EZ4p/JSUEQup5UBj2ejlcdd2VN
 Ibi09VT/uDElGS1x9KjHC+O5GSUJ/2CvRLu2fc55gkq5Cmac7STR1YWr8UEM/33Dcy
 IdXvGs6WwVnmxC8DJ3ExVdtHXBpPIya3mPi8ofII=
Date: Wed, 2 Jun 2021 08:09:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kurt Manucredo <fuzzybritches0@gmail.com>
Subject: Re: [PATCH v2] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <YLcgrGQ0phBpvHxQ@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com> <12537-32529-curtm@phaethon>
 <YLZVnNNAkAQFvSm8@kroah.com> <16463-26867-curtm@phaethon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16463-26867-curtm@phaethon>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Jun 01, 2021 at 11:28:00PM +0200, Kurt Manucredo wrote:
> On Tue, 1 Jun 2021 17:43:24 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Tue, Jun 01, 2021 at 04:33:09PM +0200, Kurt Manucredo wrote:
> > > Fix shift-out-of-bounds in ___bpf_prog_run().
> > 
> > How is this "fixed"?
> > 
> Fix shift-out-of-bounds in ___bpf_prog_run() by adding extra boundary
> check in check_alu_op() in verifier.c.

Great, say this in the changelog text.

> > > 
> > > UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> > > shift exponent 248 is too large for 32-bit type 'unsigned int'
> > 
> > What is this from?
> 
> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231

You should provide this link in the changelog text.

> > Any reason you didn't cc: the bpf maintainers and developers?
> > 
> Yes. I send them to you, the mentees mailing list and Shuah, first, for
> review, comment and help. Is this not okay? 

Ok, didn't know what you were wanting here, you can always ask questions
like this below the --- line of a patch.

> > > Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > 
> > Does this pass the syzbot testing?
> 
> Yes, it says 'OK' in the 'Result' column at:
> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231

You should also say something like "passes the syzbot reproducer test"
in the changelog text as well.

> But at this point I cannot say if this is right. Should I send the next
> version to everyone?

Please do!

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
