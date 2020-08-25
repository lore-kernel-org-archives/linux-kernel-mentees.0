Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E2CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 17:13:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18D22076C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 17:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnZw/EDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18D22076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28D2286DD0;
	Tue, 25 Aug 2020 17:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUa5BjYqnnRx; Tue, 25 Aug 2020 17:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C25B586C78;
	Tue, 25 Aug 2020 17:12:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5896C07FF;
	Tue, 25 Aug 2020 17:12:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 415D0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 17:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2B5E288070
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 17:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vybU+y5VkbOi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 17:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F114A87F34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 17:12:56 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d19so7258281pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CDJUAd9wV5rW2Ler2a2mLyA8fUH115tJlJPmgB4uBuY=;
 b=NnZw/EDHYt2NwwW6ntYS4NRclJi2nzS0qnpyZ5bOPH+F1THhlFHTusVgt0akMN1gHg
 cruU8w15DKhorJi2+8a0CgAleQeml1Ibg+Bkkp6iqxrqbpMl5Xy2PRKkHIHnw8DLUxBK
 kremo6Ji8Ywg1muwwQh1KGSfzGX3Cn36vVUhiAMBgdn80NgNo0UFCQUJjAkWtuczdWew
 z37hSfISD+N/dTDknT6czKgEsGrvYbecgW2DvnKaaYUSlC0EmAIadOnbHcNmFbCRAhye
 H6N+m7rbfMudLxWFTXNzTv/jXRx3QHfkqxyMoixpHjorW6O1PD0kKA0NfuVVX+xAIqjw
 9HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CDJUAd9wV5rW2Ler2a2mLyA8fUH115tJlJPmgB4uBuY=;
 b=mnM+KeqHwfwn9ROm5QG5HL5iSJXY77785nBqBNwHPkspaRSgeAYcEAH55ZjeE4IfKE
 yJ/EMTJYfPZHvgSFl69kWGn5cjG24gKqxEFlhs5qBlBy5nae0q2zEckWBeuiGs62UT/C
 o6IcLGQQqhW+tCwthDOwrLS0eks2tgSCx6WDDZPEPSledKFCrHBNQE/H/NqxqZp0/VgH
 PoH2ZzI73xJ5/u5jsEmyrZpdTNle0oyL6Z6ooU0EyCKRPuht661ROfhsOq8DHPYolQkd
 R3GjfrGUWdjpqnzpH7XGrQkYqjXSrQsV8p5JYL/wzq33M2iSPvLLBswzE703EwjnycPR
 Vqmg==
X-Gm-Message-State: AOAM530pLC34S3GiVhuotzbhtAQ1kE9djbEXjsW+/EdDr+jJbEm7CdpE
 eWxDEhkilZqTRB+HRzcoDg==
X-Google-Smtp-Source: ABdhPJzhfdy/2hH5np/xlhW3evexK/onWwZg2iqcIhwkYrgFP32U51A3Eh68OeZL4e6QQ2I7bKGm9A==
X-Received: by 2002:a63:f4a:: with SMTP id 10mr7150104pgp.18.1598375576436;
 Tue, 25 Aug 2020 10:12:56 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id g8sm14481455pfo.132.2020.08.25.10.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 10:12:55 -0700 (PDT)
Date: Tue, 25 Aug 2020 13:12:49 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200825171249.GA860904@PWN>
References: <20200818085706.12163-15-jslaby@suse.cz>
 <20200825164804.860743-1-yepeilin.cs@gmail.com>
 <20200825165935.GA1527003@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825165935.GA1527003@kroah.com>
Cc: syzkaller-bugs@googlegroups.com, jslaby@suse.cz,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 15/16] vc_screen: extract
	vcs_read_buf_header
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

On Tue, Aug 25, 2020 at 06:59:35PM +0200, Greg KH wrote:
> On Tue, Aug 25, 2020 at 12:48:04PM -0400, Peilin Ye wrote:
> > Hi all,
> > 
> > Link: https://syzkaller.appspot.com/bug?id=f332576321998d36cd07d09c9c1268cfed1895c9
> > 
> > As reported by syzbot, vcs_read_buf() is overflowing `con_buf16`, since
> > this patch removed the following check:
> > 
> > -		if (count > CON_BUF_SIZE) {
> > -			count = CON_BUF_SIZE;
> > -			filled = count - pos;
> > -		}
> > 
> > Decreasing `count` by `min(HEADER_SIZE - pos, count)` bypasses this check.
> > Additionally, this patch also removed updates to `skip` and `filled`.
> > 
> > What should we do in order to fix it?
> 
> This patch is already reverted, and it has been discussed a bit as to
> how to do this properly if you look at the email where this was reported
> to us.

Ah, syzbot has reported this issue as two different bugs...I started
looking into it without noticing your discussion under another thread.

Sorry,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
