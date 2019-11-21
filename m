Return-Path: <SRS0=RvA/=ZN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84ECC43215
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 20:21:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A769D20672
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 20:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZETbOGr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A769D20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67BC888934;
	Thu, 21 Nov 2019 20:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g52xmT7R0lfR; Thu, 21 Nov 2019 20:21:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5D3A8892D;
	Thu, 21 Nov 2019 20:21:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB030C1DD7;
	Thu, 21 Nov 2019 20:21:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8840BC18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D3288811F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 20:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJkdi4qgDAXH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 20:21:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 035408811E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 20:21:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3746420672;
 Thu, 21 Nov 2019 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574367666;
 bh=HgxTSBNdBflEaa2mhxi0rIBzCeKSbmDGPn7oUaS9/jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZETbOGrs6HkcD335esHHSk5upUtshvkNT3XL3+bGIsebnSyLJlSLxpba4mRB/6K/
 hLPYK1DtXbTgqj1vvzIkvrNbQnIa3A49cQWA4U7zTTZV8xxorjSM+iFjuP4EmuL8/Z
 OYyaXHKsDbOqTfUOoTkWf6lGFLp8DlnGQaPVn9Ro=
Date: Thu, 21 Nov 2019 21:21:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191121202104.GA812038@kroah.com>
References: <a02e01c5-635f-60c3-9d27-6c13abda8ffa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a02e01c5-635f-60c3-9d27-6c13abda8ffa@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Linux 5.3.12 BOOT TEST: Compiled, Booted,
	everything OK.
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

On Thu, Nov 21, 2019 at 03:55:34PM -0300, Daniel W. S. Almeida wrote:
> ~ 2hr uptime: no crashes, no new errors on dmesg, everything looks good.

Thanks for testing.

> *This pops up after diffing the output of kselftest though:*
> 
> < # ./reuseport_bpf: Unable to open tcp_fastopen sysctl for writing:
> Permission denied
> ---
> > # ./reuseport_bpf: ebpf error. log:
> > # 0: (bf) r6 = r1
> > # 1: (20) r0 = *(u32 *)skb[0]
> > # 2: (97) r0 %= 10
> > # 3: (95) exit
> > # processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0
> peak_states 0 mark_read 0
> > #
> > # : Operation not permitted
> 
> I did not run kselftest as root. I assume it is nothing noteworthy?

Is this a new issue, or has it always been there?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
