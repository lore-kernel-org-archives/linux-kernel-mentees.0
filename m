Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D27CC2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 22:10:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A2120768
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 22:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="bSjg+S5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A2120768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A982858A6;
	Mon,  6 Apr 2020 22:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZ_-LwgrHkHZ; Mon,  6 Apr 2020 22:10:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23498858BA;
	Mon,  6 Apr 2020 22:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F776C1AE2;
	Mon,  6 Apr 2020 22:09:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BA5DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2AB2B88493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZpjFRyebuSj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:09:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3194788466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:09:52 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u4so17970645qkj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gIe8CkLjM82wDUUleKDpjwdoMMyk404Cqic4JU9Nero=;
 b=bSjg+S5s9dw1lm4JVKtoxcEC0us/Dz3yySWlk0kXzH0pfe6LwjY5LRiWDpPwKmNdLQ
 IFcCcERwJX97e/R/CqsDHJ65IkA+Fa/yGFMs9uW21KG6zxmWyB7VXyMAhB9GeP9MM8Zv
 aqCmjCB18+K+Aqu7cf2tDXZG1CtGJ6U6aKeuGS0gQylCCNsx2+C2R1pcGiqLauQ67wUw
 rDw4vYWthwd3JVsGnaWMTIcHC93ftfEqK8rD9C2kUyC/sqaO85eaYLQMdgdcItvfEDL7
 IO0hxYyUDb3TJ53eMVw5dzS2cFcxK72mQFaRTpztu9zBkH6TniwXZygMq66c3UDXAlP7
 O2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gIe8CkLjM82wDUUleKDpjwdoMMyk404Cqic4JU9Nero=;
 b=AjT6nOh1H5EospnC39AgbSgDScsWFXt3CT3EDEgjDHsbxaMSJyywvAMPL2EwuozPha
 sOszsaPW5tIoJqEFG3cpj6yv9Jpu66kLrAhj/ja6lbsCcusatemBPiF5CfOEEnXDvt+e
 qIYI3pO3BsdkaZjJzvITni4YIF4d80J6UDtB279JLF+v3HVf8x0iRFYtkDQEcQDHGpdO
 qRCszcX7vgVqnEDtt6HSxkR3lQbDzYgLKD6tBFmugWTs+mr8pnWzqD/Uxz/hatMm1xgq
 P+mqkpocUS63I37QYlD0BLvmOCzqRMtiXAnJxB64qfm9z348E/naL7PBwxYrkZXEQAmG
 yifA==
X-Gm-Message-State: AGi0PuakfJVSFFvjnklGN2TunbU7KcUhPkV+qFYVIL0Lf2YbP8/ypCmg
 QkmN8RTm0TqdlNyc2MfnBJahZQ==
X-Google-Smtp-Source: APiQypIwoRkcP3Q7jH+/lYhUjs6IyMIdwndWokuXoN8e9IyOmyvKF9OBaJWBTF2HZflWMyOS71+cKw==
X-Received: by 2002:a37:583:: with SMTP id 125mr11379230qkf.351.1586210991809; 
 Mon, 06 Apr 2020 15:09:51 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id x66sm10581544qka.121.2020.04.06.15.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:09:51 -0700 (PDT)
Message-ID: <def1997964b04f73fe7eeae5c20b5109ee2094df.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 06 Apr 2020 19:09:48 -0300
In-Reply-To: <CAFd5g47Ot-MfxzYmU8kfxpfv2pWhgb_2WigouuHnPT+20Ejk_w@mail.gmail.com>
References: <20200401013639.16388-1-vitor@massaru.org>
 <CAFd5g47Ot-MfxzYmU8kfxpfv2pWhgb_2WigouuHnPT+20Ejk_w@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kunit: Fix kunit.py run
 --build_dir='<foo>' fails on "unclean" trees
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

On Mon, 2020-04-06 at 11:12 -0700, Brendan Higgins wrote:
> On Tue, Mar 31, 2020 at 6:36 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> > Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> > 
> > For some reason, the environment variable ARCH is used instead of
> > ARCH
> > passed as an argument, this patch uses a copy of the env, but using
> > ARCH=um and CROSS_COMPILER='' to avoid this problem.
> > 
> > This patch doesn't change the user's environment variables,
> > avoiding
> > side effects.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Sorry for the delayed reply. I had two people finish up on my team
> last week and I needed to do some things for that. You now have my
> undivided attention.

np

> So, I tried to apply this patch and it still doesn't apply on
> kselftest/kunit. At this point, basing your changes on
> torvalds/master
> would be fine since kselftest/kunit just got merged for 5.7.
> 
> Can you use the --base branch option when you send your next revision
> so I know what branch you are working against (just to be sure)?

Sure, I'll do that.

Thanks!
Vitor


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
