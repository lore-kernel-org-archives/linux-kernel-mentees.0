Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21F3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 01:52:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BE32068D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 01:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="y3sIRdlx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BE32068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 287F82050C;
	Tue, 26 May 2020 01:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcI9giGKI76Y; Tue, 26 May 2020 01:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DDDF8204FF;
	Tue, 26 May 2020 01:52:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD156C088D;
	Tue, 26 May 2020 01:52:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42178C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2BA858682F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yg9BAvFK8R5u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:52:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D088E862F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:52:38 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id ee19so8773153qvb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 18:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GswiztD5rfdIx8UvdfdPn09KbqwxIb3eeCWbRm1S2fE=;
 b=y3sIRdlxL+4tpIlJT8doB4fYIhWp2YEuGEGmf31TipWhOg8V8fF23GExUU71pZwftg
 spg7/T/UmdLjvp+LKU9YTuKZS9I4aL9nnIknX84Twwgxe9ILXe22/cZmq0e2FYJqzU8K
 jntoF1eufmVOOEWUIXQhYeMgN8gYpV1bc4fohS1mJtJebAvkbAS9Ryc2sxH3b1lvpcyR
 f5L7fFrZ+V4jtfzlGyyfhtiC2D7VfwIKPUYaC0ur0kx7RcW7ZI15oxkfeIMOLXn5UYn5
 QvTtFwyFlzIkuXklnkhXZxDRt2GLS0jrtneP4Qa5/B9S8kA05m9BJHUqSz6bvBE94CXn
 lIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GswiztD5rfdIx8UvdfdPn09KbqwxIb3eeCWbRm1S2fE=;
 b=FdhL1bxwWnbjcWUOkqDJjStc5DVjTEY2+YCYPRZxuvCc2AmT3my2qAACIg44MM6uYD
 ml/ruT1NW9U5QrBLZ2e66f+I+dcbEOFmS0QntMtD58n/pmiERk7mWfCI3N0F2hqX7O7D
 EwZQIOF6dnG5WC4xSeWvzh78iu0hlODlSnnhoxcyl7Bh0CD4ICdzim6y5f/ZFl1EFbjw
 /Xbu8rnm1HyDu9rwPvsVnYZ5SKHbixWP8N1ey/Yn1Rx4K/EdWmWhQjkc0OiBJauZ+/2t
 zeczQxeZ+nO6CLBJjn2ZvlLlkv/cdpEhrg7W7f3z58PqjrD/JuGmNfFBYVNy93b9ysIR
 DAEA==
X-Gm-Message-State: AOAM531LjxEPHMJt6JrYs20bng6H0izzMDfdSokVcy9ZU3PdrM3GG9al
 jLSldbVNo+WsML71RbDkBUztAQ==
X-Google-Smtp-Source: ABdhPJxMzVWNomlCvv/+yQ1qqLHvamQ4vD9iRdeXGLG0fDJzF2JwvF7fKSoMv8xNCorB8rp8ETvkbg==
X-Received: by 2002:a0c:a98d:: with SMTP id a13mr2194047qvb.157.1590457957497; 
 Mon, 25 May 2020 18:52:37 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id j7sm3724298qkk.63.2020.05.25.18.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 18:52:37 -0700 (PDT)
Message-ID: <b04934ab91fd57e6df35279ad8a2619afb00b452.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: shuah <shuah@kernel.org>, Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 25 May 2020 22:52:31 -0300
In-Reply-To: <c035d65b-7e93-f948-22f9-73a56193ec36@kernel.org>
References: <20200414230950.83665-1-vitor@massaru.org>
 <CAFd5g47CaeEBiJsiSUtihHQF+OGpfCg76dS2ys2mwy2qn_L5-w@mail.gmail.com>
 <c035d65b-7e93-f948-22f9-73a56193ec36@kernel.org>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RESEND] kunit: use --build_dir=.kunit
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

Hi Shuah,

On Fri, 2020-05-22 at 16:40 -0600, shuah wrote:
> On 4/16/20 5:11 PM, Brendan Higgins wrote:
> > On Tue, Apr 14, 2020 at 4:09 PM Vitor Massaru Iha <
> > vitor@massaru.org> wrote:
> > > To make KUnit easier to use, and to avoid overwriting object and
> > > .config files, the default KUnit build directory is set to .kunit
> > > 
> > >   * Related bug: 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=205221
> > > 
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > 
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > 
> 
> Applied the patch to kselftest/kunit on top of
> 
> 45ba7a893ad89114e773b3dc32f6431354c465d6
> kunit: kunit_tool: Separate out config/build/exec/parse
> 
> from David's work resolving merge conflicts. Please check if it is
> sane.
> 
> thanks,
> -- Shuah

The kunit branch had some problems related to identation. KUnit's code
has mixed identation, and with that, in conflict correction, it ended
up breaking python.

In addition I found a bug: related to the creation of the .kunitconfig
file inside the default build directory. Should I send the patch again?
Or do I make a bugfix patch?

BR,
Vitor

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
