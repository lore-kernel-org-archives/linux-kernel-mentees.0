Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBBEC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 03:57:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6522075F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 03:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy6m6mzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6522075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6482487750;
	Tue, 11 Aug 2020 03:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IMH9GbsCNC5; Tue, 11 Aug 2020 03:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4760687689;
	Tue, 11 Aug 2020 03:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3780DC07FF;
	Tue, 11 Aug 2020 03:57:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4EB3C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 03:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A3903203E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 03:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWy0odGP2czJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 03:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 5ED20203C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 03:57:31 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id x1so9445682ilp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 20:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Ej3O/P5forMr7lkh8Irj0X/aIJv290wNqPXSY+K8SQ=;
 b=Dy6m6mzpsrA6AiUFbCE/bSjm0Ha27RRY29MhbJd/pIkrgoNaBTwHAWHseayvDnrnCA
 HwxjeaxYINZHazGU3LyZTfhUmoxozHW8eUuuTVJ2bChVO3S4jc5gnpGqdixrngOjOvZb
 pT0JrlO6rdHNLUXHOw+rGQRqzehZQ2t0HR9Ie3vLxrt+zMZ3FFs1DyT/jBuUMxkJfg6h
 cMxGGUnbb16zLxzIVzIFBfrt08riVQ01vqyYYEiqsVUQRbTPP4a+aQTdOpE7Um4t77vW
 SGhixNnowuHWYLNeYCXspG6tRjf8su5CFtSR4DePU5Ta+mGtOJLAs6rjesqLj0qHV7qj
 PU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ej3O/P5forMr7lkh8Irj0X/aIJv290wNqPXSY+K8SQ=;
 b=U0n9+pzZLHOrxRKRyriUP9ULs8RmRzIsaxmbVucyqonwWIXW6Jf0oSW58/TA8eVGi5
 B3TisnLjFjPi6ZvQFTaQY0nWccnhHmsVEaC36GjzbHkRGxNaLrR8VH49Zx8cS9wyzIjB
 nlP8W7NoOWKxLYdpD1vWLUF77yKX7GhdLJFwhkVdzMoFPXHggi4tAyOFV/bJm9MCcQhX
 oIWICDb5sON83NGQn0Hd13NHYYOPznXFI7UJNM9r0tPD2yFMrqcCaK+wnW1auK7Jg+h2
 CjQJIR2BmqFY+TGSddeDEAZQ8GtVNxhwupt0RFTUkIozt5ELFsGK3Xa4m+QfPLcmJpFW
 AGHg==
X-Gm-Message-State: AOAM532p0XdrBTxp0S3HRUdctJVTm/vbbuUocFJzSwUcfzVs5fah+2Kr
 ypfDYMJv4znICGHEVGK6h8noQY7hZyrRLGGanIo=
X-Google-Smtp-Source: ABdhPJxJs7CjX3vzQq4fwm46ZTzG5HJ9oYGcb02FW6eIoE2VtGxgiQ6jHAgG+NKiJD5eiy2VkBGZYzjktmLVzpEwS1A=
X-Received: by 2002:a92:bad5:: with SMTP id t82mr3521374ill.22.1597118250579; 
 Mon, 10 Aug 2020 20:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200810220703.796718-1-yepeilin.cs@gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 10 Aug 2020 20:57:19 -0700
Message-ID: <CAM_iQpWsQubVJ-AYaLHujHwz68+nsHBcbgbf8XPMEPD=Vu+zaA@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Wensong Zhang <wensong@linux-vs.org>, coreteam@netfilter.org,
 Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, lvs-devel@vger.kernel.org,
 Julian Anastasov <ja@ssi.bg>, Simon Horman <horms@verge.net.au>,
 NetFilter <netfilter-devel@vger.kernel.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net] ipvs: Fix uninit-value in
	do_ip_vs_set_ctl()
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

On Mon, Aug 10, 2020 at 3:10 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> zero. Fix it.

Which exact 'cmd' is it here?

I _guess_ it is one of those uninitialized in set_arglen[], which is 0.
But if that is the case, should it be initialized to
sizeof(struct ip_vs_service_user) instead because ip_vs_copy_usvc_compat()
is called anyway. Or, maybe we should just ban len==0 case.

In either case, it does not look like you fix it correctly.

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
