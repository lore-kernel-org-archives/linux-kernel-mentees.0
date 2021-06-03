Return-Path: <SRS0=X5dI=K5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9750C47096
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Jun 2021 04:43:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825EF613B8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Jun 2021 04:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 825EF613B8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F6D3404ED;
	Thu,  3 Jun 2021 04:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xqRCUWDlkm9; Thu,  3 Jun 2021 04:43:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7443F404EC;
	Thu,  3 Jun 2021 04:43:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4ECB8C000E;
	Thu,  3 Jun 2021 04:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 625E1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 04:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA3B83E08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 04:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQniRB8pT2bM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 04:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEDED83DB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 04:43:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46328613BA;
 Thu,  3 Jun 2021 04:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622695412;
 bh=iBrVSaDhqE8uFABGWrDJeYHOE6iBHbWDWzWxi6Jrflw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AH/gyS9TTOx0VAHLFgYBRFlVkVj9G0e4MGs9R7KiDwKloke9F60xk+iPrefkYaJvj
 bvzyPRk1PLbutzhmbJrjXlzyzVPrUaL9ghP8qmyNcUZ8M8wH9qHSbpIfgkoj7eMhOe
 PoiQACmtOFsKbBDXuKpuqrzPsbNkFoFBOdF4NfYA=
Date: Thu, 3 Jun 2021 06:43:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kurt Manucredo <fuzzybritches0@gmail.com>
Subject: Re: [PATCH v3] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <YLhd8BL3HGItbXmx@kroah.com>
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602212726.7-1-fuzzybritches0@gmail.com>
Cc: nathan@kernel.org, songliubraving@fb.com, kafai@fb.com,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com, hawk@kernel.org,
 daniel@iogearbox.net, yhs@fb.com, linux-kernel@vger.kernel.org,
 john.fastabend@gmail.com, andrii@kernel.org, ast@kernel.org,
 syzkaller-bugs@googlegroups.com, clang-built-linux@googlegroups.com,
 ndesaulniers@google.com, netdev@vger.kernel.org, kpsingh@kernel.org,
 kuba@kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Wed, Jun 02, 2021 at 09:27:26PM +0000, Kurt Manucredo wrote:
> UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> shift exponent 248 is too large for 32-bit type 'unsigned int'

I'm sorry, but I still do not understand what this changelog text means.

Please be very descriptive about what you are doing and why you are
doing it.  All that is here is a message from a random tool :(

thanks,
greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
