Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4AFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 17:46:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB6E2067B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 17:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="RCjbk41G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB6E2067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CD4D884D5;
	Fri, 29 May 2020 17:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCRh7JI8ESh3; Fri, 29 May 2020 17:46:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CAE6884CD;
	Fri, 29 May 2020 17:46:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E6F2C07FF;
	Fri, 29 May 2020 17:46:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5023BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 17:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 35B3888524
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 17:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LteZs2cap8r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 17:46:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5558788522
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 17:46:26 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id j8so1515914ybj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T28CgoTvLzM8tz16a8eh0RZF1ywEtcGMeBF0Z28L8bI=;
 b=RCjbk41G+1YjTo3SenWTH6akCvneSVzaA7gWDTZlrVbdlg7/9ok6vdHFxJ/rq5g6tQ
 vqjmTING87wl7zjSyEsnON/65b2zeEcVBwjhg5CdANgEkQToI/0f5uC5ucvOEPQNfNvr
 bge8yBsCN6xwDtSMzb3UUCLhc4mf873+VPySRD14/30apaYoHGUadVL2SJ28hlC7S807
 ezUPy8CamLilbILTWxYBTaGSHdhez7KLfsPO4ofoX56D+n2pYcrc0xosGrM8+kWbk4Sf
 AUwPLad4UzeA284yhr4OcEnRB7Ldx6aYq9vZYX96VUhHCgM99vRvogwc0JL9Wi2HRm4R
 oDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T28CgoTvLzM8tz16a8eh0RZF1ywEtcGMeBF0Z28L8bI=;
 b=arZRxbfVhuY/BdnW9G5T+mGQJsSiiGvAJ6+0DzKA90TQu6c3Lae/WH84TTYcX7k+uJ
 F33T2kDSIQovwXYnR6uhsAqeZN7qrcRCagl/G8OmfLMDyITXGLCFPlhroB5/UB7CCMcB
 GGlLVN+slis+6nNlHV3hOlWdanx8YMGQ1lbY6YWGrS4yTrheFG1YfV/7NcqjFdjsR4jA
 kkxrTzIOim6wal/X2w2rwpi5VSgfQfyKECdeXr5/y23/zQhqbxHiSJJF+3IC8jbUJtPM
 E65TrgWYg/Uh+JLsN3Ch0sg/vqg0ezrGU4qQOmn3QVC4np7HR7AJXDAy6sYkFpAE86Nm
 E1kA==
X-Gm-Message-State: AOAM531q7lzJr0UGe8U/2NvPsBnyhwzxcpGOMvMVMnCwhFvv4WCd0KKi
 HYcq2Xo4WSszi5LbUKtU+84R52bw3PU/ljAq1KEWgQ==
X-Google-Smtp-Source: ABdhPJzyiVpFfT+IpUlTWmIFceOxHre5znwF48nwQ4mneDd657/RkCRNpHtsXubu/XwvVBM8lVwXU/LTwR5jdbO+4Qw=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr15518222ybg.129.1590774385194; 
 Fri, 29 May 2020 10:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200527003420.34790-1-vitor@massaru.org>
 <9b12d44c-938e-b57f-d3ed-509b8e1b07bc@linuxfoundation.org>
In-Reply-To: <9b12d44c-938e-b57f-d3ed-509b8e1b07bc@linuxfoundation.org>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Fri, 29 May 2020 14:45:49 -0300
Message-ID: <CADQ6JjXsSA7YQujOWWthGFSRwwVxs1noo_Ok1LF7YVqGY+=16A@mail.gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [fixup v2] kunit: use --build_dir=.kunit
	as default
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

On Thu, May 28, 2020 at 2:28 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/26/20 6:34 PM, Vitor Massaru Iha wrote:
> > To make KUnit easier to use, and to avoid overwriting object and
> > .config files, the default KUnit build directory is set to .kunit
> >
> > Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>
> >
> > Fixed this identation error exchanging spaces for tabs between lines
> > 248 and 252:
> >
> > tools/testing/kunit/kunit.py run --defconfig
> >
> >    File "tools/testing/kunit/kunit.py", line 254
> >      if not linux:
> >                  ^
> > TabError: inconsistent use of tabs and spaces in indentation
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=205221
>
> Vitor,
>
> This patch doesn't apply. Can you change to subject to be unique
> Fix TabError and do the patch on top of linux-kselftest kunit
>
> I think you did this, but I can't apply this on top:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit
>

Sure, I'll do that.

> thanks,
> -- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
